import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../database/prisma.service';
import { countries } from '@prisma/client';

@Injectable()
export class CountriesService {
  constructor(private prisma: PrismaService) {}

  async create(data: Omit<countries, 'id'>): Promise<countries> {
    return this.prisma.countries.create({ data });
  }

  async findAll(): Promise<countries[]> {
    return this.prisma.countries.findMany();
  }

  async findOne(id: number): Promise<countries | null> {
    return this.prisma.countries.findUnique({ where: { id } });
  }

  async update(id: number, data: Partial<countries>): Promise<countries> {
    return this.prisma.countries.update({ where: { id }, data });
  }

  async remove(id: number): Promise<countries> {
    return this.prisma.countries.delete({ where: { id } });
  }
}
