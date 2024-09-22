import { Module } from '@nestjs/common';
import { CountriesModule } from './global/countries/countries.module';
import { LanguagesModule } from './global/languages/languages.module';
import { TypeDocumentsModule } from './global/type-documents/type-documents.module';
import { StatesModule } from './global/states/states.module';

@Module({
  imports: [
    CountriesModule,
    LanguagesModule,
    TypeDocumentsModule,
    StatesModule,
  ],
  controllers: [],
  providers: [],
})
export class HomeModule {}
