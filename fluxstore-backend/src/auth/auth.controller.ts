import { Body, Controller, Patch, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiCreatedResponse, ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { SignUpDto } from './dto/signup.dto';
import { LoginDto } from './dto/login.dto';
import { ForgotPasswordDto } from './dto/forgot-password.dto';
import { VerifyOTPDto } from './dto/verify-otp.dto';
import { CreatePasswordDto } from './dto/create-password.dto';
import { MessageDto } from './dto/message.dto';

@ApiTags("Auth")
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('signup')
  @ApiOperation({ summary: 'Sign up' })
  @ApiCreatedResponse({description: 'Signup successful.',type:MessageDto,})
  @ApiResponse({ status: 400, description: 'Bad Request.' })
  @ApiResponse({ status: 500, description: 'Internal Server Error.' })
  async signUp(@Body() data: SignUpDto): Promise<{message: string}>{
    return await this.authService.signUp(data)
  }

  @Post('login')
  @ApiOperation({ summary: 'Login' })
  @ApiCreatedResponse({description: 'Login successful.',type: LoginDto,})
  @ApiResponse({ status: 400, description: 'Bad Request.' })
  @ApiResponse({ status: 500, description: 'Internal Server Error.' })
  async login(@Body() data: LoginDto): Promise<{data: { user: any; access_token: string }}>{
    return await this.authService.login(data)
  }

  @Post('forgot-password')
  @ApiOperation({ summary: 'Forgot Password' })
  @ApiCreatedResponse({description: 'OTP Verification Code Sent ', type: MessageDto,})
  @ApiResponse({ status: 400, description: 'Bad Request.' })
  @ApiResponse({ status: 500, description: 'Internal Server Error.' })
  async forgotPassword(@Body() data:ForgotPasswordDto):Promise<{message: string}>{
    return await this.authService.forgotPassword(data);
  }

  @Post('verify-otp')
  @ApiOperation({ summary: 'Verify OTP Code' })
  @ApiCreatedResponse({description: 'OTP verification successful ', type: MessageDto,})
  @ApiResponse({ status: 400, description: 'Bad Request.' })
  @ApiResponse({ status: 500, description: 'Internal Server Error.' })
  async verifyOTP(@Body() data: VerifyOTPDto): Promise<{message:string}>{
    return await this.authService.verifyOTP(data);
  }

  @Patch('reset-password')
  @ApiOperation({ summary: 'Reset Password' })
  @ApiCreatedResponse({description: 'Password Reset successully', type: MessageDto,})
  @ApiResponse({ status: 400, description: 'Bad Request.' })
  @ApiResponse({ status: 500, description: 'Internal Server Error.' })
  async createPassword(@Body() data: CreatePasswordDto): Promise<{message:string}>{
    return await this.authService.createPassword(data);
  }

}
