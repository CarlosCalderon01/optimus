import { Module } from '@nestjs/common';
import { RouterModule } from '@nestjs/core';
import { GlobalController } from './global.controller';
// import all master-table modules
import { CountriesModule } from './countries/countries.module';
import { StatesModule } from './states/states.module';
import { LanguagesModule } from './languages/languages.module';
import { TypeDocumentsModule } from './type-documents/type-documents.module';

@Module({
  imports: [
    RouterModule.register([
      {
        path: 'global',
        children: [
          {
            path: 'countries',
            module: CountriesModule,
          },
          {
            path: 'states',
            module: StatesModule,
          },
          {
            path: 'languages',
            module: LanguagesModule,
          },
          {
            path: 'type-documents',
            module: TypeDocumentsModule,
          },
        ],
      },
    ]),
    CountriesModule,
    StatesModule,
    LanguagesModule,
    TypeDocumentsModule,
  ],
  controllers: [GlobalController],
  providers: [],
})
export class GlobalModule {}
