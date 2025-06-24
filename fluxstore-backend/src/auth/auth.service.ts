import {
  BadRequestException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { JwtService } from '@nestjs/jwt';
import { Model } from 'mongoose';
import { EmailService } from 'src/common/services/email.service';
import { User, UserDocument } from './schemas/user.schema';
import { OTP, OtpDocument } from './schemas/otp.schema';
import { comparePasswords, hashPassword } from 'src/common/utils/password.utils';
import { LoginDto } from './dto/login.dto';
import { ForgotPasswordDto } from './dto/forgot-password.dto';
import { generateOtp } from 'src/common/utils/otp.util';
import { VerifyOTPDto } from './dto/verify-otp.dto';
import { CreatePasswordDto } from './dto/create-password.dto';




@Injectable()
export class AuthService {
  constructor(
    @InjectModel(User.name) private userModel: Model<UserDocument>,
    @InjectModel(OTP.name) private otpModel: Model<OtpDocument>,
    private readonly jwtService: JwtService,
    private readonly emailService: EmailService,
  ) {}

  async signUp(data: Partial<User>): Promise<{ message: string }> {
    const {password } = data
    const existing = await this.userModel.findOne({ email: data.email });
    if (existing) throw new BadRequestException('User with this email already exists');

    if (!password) {
            throw new BadRequestException('Password is required');
    }

    const hashedPassword = await hashPassword(password);
    const user = await this.userModel.create({
      fullName: data.fullName,
      email: data.email,
      password: hashedPassword,
    });

    if (!user) throw new BadRequestException('Error creating user');
    return { message: 'User Created Successfully' };
  }

  async login(data: LoginDto): Promise<{ data: {message: string, user: any; access_token: string } }> {
    const user = await this.userModel.findOne({ email: data.email });
    if (!user) throw new UnauthorizedException('Invalid Credentials');

    const match = await comparePasswords(data.password, user.password);
    if (!match) throw new UnauthorizedException('Invalid Credentials');

    const payload = { email: user.email, sub: user._id };
    const token = this.jwtService.sign(payload);
    const { password, ...userWithoutPassword } = user.toObject();

    return {
      
      data: {
        message: "Login Successful",
        user: userWithoutPassword,
        access_token: token,
      },
    };
  }

  async forgotPassword(data: ForgotPasswordDto): Promise<{ message: string }> {
    const { email } = data;
    const user = await this.userModel.findOne({ email });
    if (!user) throw new BadRequestException('User with this email not found!');

    const otp = generateOtp();
    if (!otp) throw new BadRequestException('Error generating OTP');

    try {
      await this.emailService.sendOtpEmail(user.email, otp);
      await this.otpModel.create({ email: user.email, code: otp });
    } catch (error) {
      return { message: 'OTP sending failed. Please try again later.' };
    }

    return { message: 'OTP sent successfully' };
  }

  async verifyOTP(data: VerifyOTPDto): Promise<{ message: string }> {
    const { email, code } = data;
    const otpRecord = await this.otpModel.findOne({ email, code });

    if (!otpRecord) throw new BadRequestException('Invalid email or OTP code');

    await this.otpModel.deleteOne({ _id: otpRecord._id });
    return { message: 'OTP verified successfully' };
  }

  async createPassword(data: CreatePasswordDto): Promise<{ message: string }> {
    const { email, password } = data;
    const user = await this.userModel.findOne({ email });

    if (!user) throw new BadRequestException('User not found!');

    const isOldPassword = await comparePasswords(password, user.password);
    if (isOldPassword)
      throw new BadRequestException('New Password cannot be the same as old password');

    const hashNewPassword = await hashPassword(password);
    user.password = hashNewPassword;
    await user.save();

    return { message: 'Your password has been changed ' };
  }
}
