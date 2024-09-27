import { IsNotEmpty, IsString, IsInt } from 'class-validator';

export class CreateStateDto {
  @IsInt()
  @IsNotEmpty()
  country_id: number;

  @IsString()
  @IsNotEmpty()
  name: string;
}
