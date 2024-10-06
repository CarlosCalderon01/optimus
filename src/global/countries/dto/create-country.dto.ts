
Codigo 1:
export class CreateCountryDto {
  name: string;
  iso3166_2: string;
  iso3166_3: string;
  num_code: number;
  phone_code: string;
}

codigo 2:

import { countries } from '@prisma/client';

export type CreateCountryDto = Omit<countries, 'id' | 'createdAt' | 'updatedAt'>


/*

- Reference:

  https://docs.nestjs.com/techniques/validation#mapped-types

  https://github.com/typestack/class-validator

*/
