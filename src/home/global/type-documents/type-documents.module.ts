import { Module } from '@nestjs/common';
import { TypeDocumentsService } from './type-documents.service';
import { TypeDocumentsController } from './type-documents.controller';
import { PrismaService } from 'src/database/prisma.service';

@Module({
  controllers: [TypeDocumentsController],
  providers: [TypeDocumentsService, PrismaService],
})
export class TypeDocumentsModule {}
