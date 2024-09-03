import { Test, TestingModule } from '@nestjs/testing';
import { CountriesController } from './countries.controller';
import { CountriesService } from './countries.service';
import { PrismaService } from '../../../database/prisma.service';
import { DatabaseModule } from '../../../database/database.module';
import { INestApplication } from '@nestjs/common';

describe('CountriesController', () => {
  let controller: CountriesController;
  let prismaService: PrismaService;
  let app: INestApplication;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      imports: [DatabaseModule],
      controllers: [CountriesController],
      providers: [CountriesService, PrismaService],
    }).compile();

    controller = module.get<CountriesController>(CountriesController);
    prismaService = module.get<PrismaService>(PrismaService);

    await prismaService.countries.deleteMany();
  });

  afterAll(async () => {
    await prismaService.$disconnect();
    await prismaService.enableShutdownHooks(app);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
