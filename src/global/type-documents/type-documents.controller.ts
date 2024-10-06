import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { TypeDocumentsService } from './type-documents.service';
import { CreateTypeDocumentDto } from './dto/create-type-document.dto';
import { UpdateTypeDocumentDto } from './dto/update-type-document.dto';

@Controller('')
export class TypeDocumentsController {
  constructor(private readonly typeDocumentsService: TypeDocumentsService) {}

  @Post()
  create(@Body() createTypeDocumentDto: CreateTypeDocumentDto) {
    return this.typeDocumentsService.create(createTypeDocumentDto);
  }

  @Get()
  findAll() {
    return this.typeDocumentsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.typeDocumentsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateTypeDocumentDto: UpdateTypeDocumentDto,
  ) {
    return this.typeDocumentsService.update(+id, updateTypeDocumentDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.typeDocumentsService.remove(+id);
  }
}
