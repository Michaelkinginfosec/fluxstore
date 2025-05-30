import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as SibApiV3Sdk from 'sib-api-v3-sdk';


@Injectable()
export class EmailService {
  private logger = new Logger(EmailService.name);
  private defaultClient = SibApiV3Sdk.ApiClient.instance;

  constructor(private configService: ConfigService) {
    const apiKey = this.defaultClient.authentications['api-key'];
    apiKey.apiKey = this.configService.get<string>('BREVO_API_KEY');
  }

  async sendOtpEmail(toEmail: string, otp: string): Promise<void> {
    const senderName = this.configService.get<string>('EMAIL_SENDER_NAME');
    const senderEmail = this.configService.get<string>('EMAIL_SENDER_ADDRESS');

    const apiInstance = new SibApiV3Sdk.TransactionalEmailsApi();
    const sendSmtpEmail = new SibApiV3Sdk.SendSmtpEmail();

    sendSmtpEmail.to = [{ email: toEmail }];
    sendSmtpEmail.sender = { name: senderName, email: senderEmail };
    sendSmtpEmail.subject = 'Verify your Fluxstore account';
    sendSmtpEmail.htmlContent = `<h3>Your OTP Code is: <strong>${otp}</strong></h3>`;

    try {
      await apiInstance.sendTransacEmail(sendSmtpEmail);
      this.logger.log(`OTP email sent to ${toEmail}`);
    } catch (error) {
      this.logger.error('Failed to send OTP email', error);
      throw error;
    }
  }
}