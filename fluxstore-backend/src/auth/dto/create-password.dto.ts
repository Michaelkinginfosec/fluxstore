import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsNotEmpty, IsString, IsStrongPassword, MinLength } from "class-validator";


export class CreatePasswordDto{
    @ApiProperty()
    @IsString()
    @IsNotEmpty()
    @IsEmail()
    email:string

        
    @ApiProperty()
    @IsString()
    @IsNotEmpty()
    @IsStrongPassword()
    @MinLength(6)
    password:string
}