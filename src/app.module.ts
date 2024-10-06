import { Module } from '@nestjs/common';
import { RouterModule } from '@nestjs/core';
import { AppService } from './app.service';
import { AppController } from './app.controller';
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
            path: '',
            module: AccountsModule,
          },
          {
            path: '',
            module: BusinessModule,
          },
          {
            path: 'global',
            module: GlobalModule,
          },
          {
            path: '',
            module: UsersModule,
          },
          {
            path: '',
            module: DatabaseModule,
          },
        ],
      },
    ]),
    AccountsModule,
    BusinessModule,
    GlobalModule,
    UsersModule,
    DatabaseModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
