import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../database/prisma.service';
import { CreateLanguageDto } from './dto/create-language.dto';
import { UpdateLanguageDto } from './dto/update-language.dto';
import { languages } from '@prisma/client';

@Injectable()
export class LanguagesService {
  constructor(private prisma: PrismaService) {}

  async create(createLanguageDto: CreateLanguageDto): Promise<languages> {
    return this.prisma.languages.create({
      data: createLanguageDto,
    });
  }

  async findAll(): Promise<languages[]> {
    return this.prisma.languages.findMany();
  }

  async findOne(id: number): Promise<languages | null> {
    return this.prisma.languages.findUnique({
      where: { id },
    });
  }

  async update(
    id: number,
    updateLanguageDto: UpdateLanguageDto,
  ): Promise<languages> {
    return this.prisma.languages.update({
      where: { id },
      data: updateLanguageDto,
    });
  }

  async remove(id: number): Promise<languages> {
    return this.prisma.languages.delete({
      where: { id },
    });
  }
}
