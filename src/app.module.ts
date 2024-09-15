import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { HomeModule } from './home/home.module';

@Module({
  imports: [DatabaseModule, HomeModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
