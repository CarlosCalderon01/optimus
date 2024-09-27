// PACKAGE
import { Module } from '@nestjs/common';
import { RouterModule } from '@nestjs/core';
// LOCAL
import { AppService } from './app.service';
import { AppController } from './app.controller';
// MODULE
import { GlobalModule } from './global/global.module';
import { AccountsModule } from './accounts/accounts.module';
import { BusinessModule } from './business/business.module';
import { UsersModule } from './users/users.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [
    RouterModule.register([
      {
        path: '',
        children: [
          {
            path: 'global',
            module: GlobalModule,
          },
          {
            path: 'accounts',
            module: AccountsModule,
          },
          {
            path: 'business',
            module: BusinessModule,
          },
          {
            path: 'users',
            module: UsersModule,
          },
          {
            path: 'database',
            module: DatabaseModule,
          },
        ],
      },
    ]),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
