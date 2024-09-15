import { Module } from '@nestjs/common';
import { CountriesModule } from './global/countries/countries.module';
import { LanguagesModule } from './global/languages/languages.module';

@Module({
  imports: [CountriesModule, LanguagesModule],
  controllers: [],
  providers: [],
})
export class HomeModule {}
