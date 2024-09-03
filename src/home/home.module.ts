import { Module } from '@nestjs/common';
import { CountriesModule } from './global/countries/countries.module';

@Module({
  imports: [CountriesModule],
})
export class HomeModule {}
