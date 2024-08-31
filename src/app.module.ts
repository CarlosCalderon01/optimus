import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { DatabasenestModule } from './generate/databasenest/databasenest.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [PrismaModule, UsersModule, DatabasenestModule, DatabaseModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
