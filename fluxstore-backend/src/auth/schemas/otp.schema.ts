// schemas/otp.schema.ts
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type OtpDocument = OTP & Document;

@Schema({ timestamps: true })
export class OTP {
  @Prop({ required: true })
  email: string;

  @Prop({ required: true })
  code: string;
}

export const OtpSchema = SchemaFactory.createForClass(OTP);
