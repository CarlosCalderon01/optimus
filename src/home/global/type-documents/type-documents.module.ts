import { Module } from '@nestjs/common';
import { TypeDocumentsService } from './type-documents.service';
import { TypeDocumentsController } from './type-documents.controller';
import { PrismaService } from 'src/database/prisma.service';

@Module({
  imports: [],
  controllers: [TypeDocumentsController],
  providers: [TypeDocumentsService, PrismaService],
  exports: [TypeDocumentsService],
})
export class TypeDocumentsModule {}
