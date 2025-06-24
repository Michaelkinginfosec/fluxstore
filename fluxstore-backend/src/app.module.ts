import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';


@Module({
  imports: [AuthModule,
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    MongooseModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (config) => ({
        uri: config.get('DATABASE_CONNECTION_STRING'),
      }),

      inject: [ConfigService],
      
    }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
