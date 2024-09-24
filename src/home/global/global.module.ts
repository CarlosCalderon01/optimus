import { Module } from '@nestjs/common';
//
import { GlobalController } from './global.controller';
// import { CountriesController } from './countries/countries.controller';
// import { StatesController } from './states/states.controller';
// import { LanguagesController } from './languages/languages.controller';
// import { TypeDocumentsController } from './type-documents/type-documents.controller';
//
// import { CountriesModule } from './countries/countries.module';
// import { StatesModule } from './states/states.module';
// import { LanguagesModule } from './languages/languages.module';
// import { TypeDocumentsModule } from './type-documents/type-documents.module';

@Module({
  imports: [
    // CountriesModule,
    // StatesModule,
    // LanguagesModule,
    // TypeDocumentsModule,
  ],
  controllers: [
    GlobalController,
    // CountriesController,
    // StatesController,
    // LanguagesController,
    // TypeDocumentsController,
  ],
  providers: [],
})
export class GlobalModule {}
