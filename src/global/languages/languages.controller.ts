import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { languages } from '@prisma/client';
import { LanguagesService } from './languages.service';
import { CreateLanguageDto } from './dto/create-language.dto';
import { UpdateLanguageDto } from './dto/update-language.dto';

@Controller('')
export class LanguagesController {
  constructor(private readonly languagesService: LanguagesService) {}

  @Post()
  create(@Body() createLanguageDto: CreateLanguageDto): Promise<languages> {
    return this.languagesService.create(createLanguageDto);
  }

  @Get()
  findAll(): Promise<languages[]> {
    return this.languagesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<languages | null> {
    return this.languagesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateLanguageDto: UpdateLanguageDto,
  ): Promise<languages> {
    return this.languagesService.update(+id, updateLanguageDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<languages> {
    return this.languagesService.remove(+id);
  }
}
