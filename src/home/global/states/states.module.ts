import { Module } from '@nestjs/common';
import { StatesService } from './states.service';
import { StatesController } from './states.controller';
import { PrismaService } from '../../../database/prisma.service';

@Module({
  imports: [],
  controllers: [StatesController],
  providers: [StatesService, PrismaService],
  exports: [StatesService],
})
export class StatesModule {}
