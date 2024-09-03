import { Test, TestingModule } from '@nestjs/testing';
import { CountriesService } from './countries.service';
import { PrismaService } from '../../../database/prisma.service';

describe('CountriesService', () => {
  let service: CountriesService;
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CountriesService, PrismaService],
    }).compile();

    service = module.get<CountriesService>(CountriesService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should create a country', async () => {
    const country = await service.create({
      name: 'Test Country',
      iso3166_2: 'TC',
      iso3166_3: 'TCO',
      num_code: 123,
      phone_code: '+123',
    });

    expect(country).toBeDefined();
    expect(country.name).toBe('Test Country');
  });

  it('should return all countries', async () => {
    const countries = await service.findAll();
    expect(Array.isArray(countries)).toBe(true);
  });

  it('should return a single country by ID', async () => {
    const country = await service.create({
      name: 'Single Country',
      iso3166_2: 'SC',
      iso3166_3: 'SCO',
      num_code: 234,
      phone_code: '+234',
    });

    const found = await service.findOne(country.id);
    expect(found).toBeDefined();
    expect(found.name).toBe('Single Country');
  });

  it('should update a country', async () => {
    const country = await service.create({
      name: 'Update Country',
      iso3166_2: 'UC',
      iso3166_3: 'UCO',
      num_code: 345,
      phone_code: '+345',
    });

    const updated = await service.update(country.id, {
      name: 'Updated Country',
    });
    expect(updated.name).toBe('Updated Country');
  });

  it('should remove a country', async () => {
    const country = await service.create({
      name: 'Remove Country',
      iso3166_2: 'RC',
      iso3166_3: 'RCO',
      num_code: 456,
      phone_code: '+456',
    });

    const removed = await service.remove(country.id);
    expect(removed).toBeDefined();
  });
});
