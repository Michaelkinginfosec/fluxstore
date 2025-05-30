import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { PrismaModule } from 'src/common/database/prisma/prisma.module';
import { JwtModule } from '@nestjs/jwt';
import { JwtStrategy } from './jwt.strategy';
import { EmailService } from 'src/common/services/email.service';
import { ConfigService } from '@nestjs/config';

@Module({
  imports: [PrismaModule,
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
