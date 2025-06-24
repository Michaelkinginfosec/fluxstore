import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';
import { JwtStrategy } from './strategy/jwt.strategy';
import { EmailService } from 'src/common/services/email.service';
import { ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from './schemas/user.schema';
import { OTP, OtpSchema } from './schemas/otp.schema';

@Module({
  imports: [
      MongooseModule.forFeature([
      { name: User.name, schema: UserSchema },
      { name: OTP.name, schema: OtpSchema },
    ]),
    JwtModule.register({
      secret: process.env.JWT_SECRET || 'My_SECRET', 
      signOptions: { expiresIn: '1h' },
    }),
  ],
  controllers: [AuthController],
  providers: [AuthService, JwtStrategy, EmailService, ConfigService],
  exports: [AuthService],
})
export class AuthModule {}
