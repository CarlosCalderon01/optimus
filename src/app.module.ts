import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { MasterTableModule } from './master-table/master-table.module';

@Module({
  imports: [PrismaModule, MasterTableModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
