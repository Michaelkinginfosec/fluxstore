import { BadRequestException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/common/database/prisma/prisma.service';
import { comparePasswords, hashPassword } from 'src/common/utils/password.utils';
import { LoginDto } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt';
import { generateOtp } from 'src/common/utils/otp.util';
import { EmailService } from 'src/common/services/email.service';
import { ForgotPasswordDto } from './dto/forgot-password.dto';
import { VerifyOTPDto } from './dto/verify-otp.dto';
import { CreatePasswordDto } from './dto/create-password.dto';


@Injectable()
export class AuthService {
    constructor (private readonly prisma: PrismaService,
        private readonly jwtService: JwtService,
        private readonly emailService: EmailService) {}
    async signUp(data: Prisma.UsersCreateInput): Promise<{message : string}> {
        const existing = await this.prisma.users.findUnique({where: {email: data.email}});
        if(existing) throw new BadRequestException("User with this email already exists");
        const hashedPassworded = await hashPassword(data.password);

        const user = await this.prisma.users.create({data: {
            fullName: data.fullName,
            email: data.email,
            password: hashedPassworded
        }})
        if(!user) throw new BadRequestException("Error creating user");
        return {message : "User Created Successfully"}
    }

    async login(data: LoginDto): Promise<{data: { user: any; access_token: string }}>{
       
        const  user = await this.prisma.users.findUnique({where: {
            email:data.email
        }});
        if(!user) throw new UnauthorizedException("Invalid Credentials");
        const match = await comparePasswords(data.password, user.password);
        if(!match) throw new UnauthorizedException("Invalid Credentials");

        const payload = { email: user.email, sub: user.id };
        const token = this.jwtService.sign(payload)
        const {password, ...userWithoutPassword} = user

        return {
        data: {
            user: userWithoutPassword,
            access_token:token
        }
        };

    }
    async forgotPassword(data:ForgotPasswordDto): Promise<{message:string}>{
        const {email } = data
        const user = await this.prisma.users.findUnique({where: {email}});
        if(!user) throw new BadRequestException("User with this email not found!");
        const otp = generateOtp();
        if(!otp) throw new BadRequestException("Error generating OTP");
        try {
            await this.emailService.sendOtpEmail(user.email, otp);
            const code = await this.prisma.oTP.create({data: {
            email:user.email,
            code: otp
            }});
        } catch (error) {  
            return { message: "OTP sending failed. Please try again later." };
        }
        
        return  {message: "OTP send successfuly"}
    }

    async verifyOTP(data: VerifyOTPDto): Promise<{message:string}>{
        const {email, code} = data
        const otpRecord = await this.prisma.oTP.findFirst({
            where: {
            email,
            code,
            },
        });
        if (!otpRecord) throw new BadRequestException("Invalid email or OTP code");
        await this.prisma.oTP.delete({ where: { id: otpRecord.id } });
        return {message : "OTP verify successfuly"}
    }

    async createPassword(data: CreatePasswordDto): Promise<{message:string}>{
        const {email, password} = data
        const user = await this.prisma.users.findUnique({
            where: {
                email
            }
        });
        if(!user) throw new BadRequestException("User not found!");

        const isOldPassword = await comparePasswords(password, user.password);
        if(isOldPassword) throw new BadRequestException("New Password cannot be the same with old password");

        const hashNewPassword = await hashPassword(password);

        await this.prisma.users.update({
            where: { email },
            data: {
            password: hashNewPassword,
            },
        });
        return { message: "Password changed successfully" };
    }
}
