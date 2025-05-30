import { Injectable, OnModuleInit } from "@nestjs/common";
import { PrismaClient } from "@prisma/client";

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit{
    onModuleInit() {
        this.$connect().then(()=> console.log("connected to database")).catch((error)=> console.log("error connecting to database", error ))
    }
}