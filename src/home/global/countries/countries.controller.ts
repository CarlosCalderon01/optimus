import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Patch,
  Delete,
} from '@nestjs/common';
import { CountriesService } from './countries.service';
import { countries } from '@prisma/client';

@Controller('countries')
export class CountriesController {
  constructor(private readonly countriesService: CountriesService) {}

  @Post()
  create(@Body() data: Omit<countries, 'id'>): Promise<countries> {
    return this.countriesService.create(data);
  }

  @Get()
  findAll(): Promise<countries[]> {
    return this.countriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<countries | null> {
    return this.countriesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() data: Partial<countries>,
  ): Promise<countries> {
    return this.countriesService.update(+id, data);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<countries> {
    return this.countriesService.remove(+id);
  }
}
