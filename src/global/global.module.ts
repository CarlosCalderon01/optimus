import { Module } from '@nestjs/common';
import { RouterModule } from '@nestjs/core';
import { GlobalController } from './global.controller';
// import alls master-table
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
            path: 'languages',
            module: StatesModule,
          },
          {
            path: 'states',
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

// import { Module } from '@nestjs/common';
// //
// import { GlobalController } from './global.controller';
// import { RouterModule } from '@nestjs/core';
// // import { CountriesController } from './countries/countries.controller';
// // import { StatesController } from './states/states.controller';
// // import { LanguagesController } from './languages/languages.controller';
// // import { TypeDocumentsController } from './type-documents/type-documents.controller';
// //
// import { CountriesModule } from './countries/countries.module';
// // import { StatesModule } from './states/states.module';
// // import { LanguagesModule } from './languages/languages.module';
// // import { TypeDocumentsModule } from './type-documents/type-documents.module';

// @Module({
//   imports: [
//     // CountriesModule,
//     // StatesModule,
//     // LanguagesModule,
//     // TypeDocumentsModule,
//     RouterModule.register([
//       {
//         path: 'global',
//         module: CountriesModule,
//       },
//     ]),
//     CountriesModule,
//   ],
//   controllers: [
//     GlobalController,
//     // CountriesController,
//     // StatesController,
//     // LanguagesController,
//     // TypeDocumentsController,
//   ],
//   providers: [],
// })
// export class GlobalModule {}
