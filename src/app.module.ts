import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { HomeModule } from './home/home.module';
import { CountriesModule } from './home/global/countries/countries.module';

@Module({
  imports: [DatabaseModule, HomeModule, CountriesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
