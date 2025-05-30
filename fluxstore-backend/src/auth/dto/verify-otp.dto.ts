import { ApiProperty } from "@nestjs/swagger"
import { IsEmail, IsNotEmpty, IsString } from "class-validator"

export class VerifyOTPDto {
       @ApiProperty()
        @IsString()
        @IsNotEmpty()
        @IsEmail()
        email:string
    
        @ApiProperty()
        @IsString()
        @IsNotEmpty()
        code:string
}