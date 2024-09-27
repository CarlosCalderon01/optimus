import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateTypeDocumentDto } from './dto/create-type-document.dto';
import { UpdateTypeDocumentDto } from './dto/update-type-document.dto';

@Injectable()
export class TypeDocumentsService {
  constructor(private prisma: PrismaService) {}

  async create(createTypeDocumentDto: CreateTypeDocumentDto) {
    return this.prisma.type_documents.create({
      data: createTypeDocumentDto,
    });
  }

  async findAll() {
    return this.prisma.type_documents.findMany();
  }

  async findOne(id: number) {
    return this.prisma.type_documents.findUnique({
      where: { id },
    });
  }

  async update(id: number, updateTypeDocumentDto: UpdateTypeDocumentDto) {
    return this.prisma.type_documents.update({
      where: { id },
      data: updateTypeDocumentDto,
    });
  }

  async remove(id: number) {
    return this.prisma.type_documents.delete({
      where: { id },
    });
  }
}
