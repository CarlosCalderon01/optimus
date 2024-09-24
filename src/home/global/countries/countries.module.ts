import { Module } from '@nestjs/common';
import { CountriesController } from './countries.controller';
import { CountriesService } from './countries.service';
import { PrismaService } from '../../../database/prisma.service';

@Module({
  imports: [],
  controllers: [CountriesController],
  providers: [CountriesService, PrismaService],
  exports: [CountriesService],
})
export class CountriesModule {}
