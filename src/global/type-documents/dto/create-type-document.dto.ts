import { IsNotEmpty, Length, IsOptional } from 'class-validator';

export class CreateTypeDocumentDto {
  @IsNotEmpty({ message: 'Name is required' })
  @Length(2, 50, {
    message: 'The name must be between 2 and 50 characters long.',
  })
  name: string;

  @IsOptional()
  @Length(0, 255, {
    message: 'The description cannot exceed 255 characters',
  })
  description?: string;
}
