import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../database/prisma.service';
import { CreateStateDto } from './dto/create-state.dto';
import { UpdateStateDto } from './dto/update-state.dto';

@Injectable()
export class StatesService {
  constructor(private prisma: PrismaService) {}

  async create(createStateDto: CreateStateDto) {
    return this.prisma.states.create({
      data: createStateDto,
    });
  }

  async findAll() {
    return this.prisma.states.findMany();
  }

  async findOne(id: number) {
    return this.prisma.states.findUnique({
      where: { id },
    });
  }

  async update(id: number, updateStateDto: UpdateStateDto) {
    return this.prisma.states.update({
      where: { id },
      data: updateStateDto,
    });
  }

  async remove(id: number) {
    return this.prisma.states.delete({
      where: { id },
    });
  }
}
