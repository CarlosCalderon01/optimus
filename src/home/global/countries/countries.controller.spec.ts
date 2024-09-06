import { CountriesController } from './countries.controller';
import { CountriesService } from './countries.service';
import { PrismaService } from '../../../database/prisma.service';
import { DatabaseModule } from '../../../database/database.module';
import { INestApplication } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';

// Descripción del bloque de pruebas para el CountriesController
describe('CountriesController', () => {
  // Declaración de variables que se usarán en las pruebas
  let controller: CountriesController; // Para almacenar la instancia del controlador que se va a probar
  let prismaService: PrismaService; // Para acceder a Prisma y manipular la base de datos durante las pruebas
  let app: INestApplication; // Para manejar la aplicación de NestJS

  // Se ejecuta antes de todas las pruebas (una vez) para configurar el entorno de prueba
  beforeAll(async () => {
    // Creación de un módulo de pruebas con los componentes necesarios para las pruebas
    const module: TestingModule = await Test.createTestingModule({
      imports: [DatabaseModule], // Importa el módulo de base de datos necesario
      controllers: [CountriesController], // Incluye el CountriesController para la prueba
      providers: [CountriesService, PrismaService], // Registra los servicios necesarios como proveedores
    }).compile(); // Compila el módulo para que esté listo para las pruebas

    // Crea una instancia de la aplicación NestJS y la inicializa
    app = module.createNestApplication();
    await app.init();

    // Obtiene una instancia del controlador a partir del módulo de pruebas
    controller = module.get<CountriesController>(CountriesController);

    // Obtiene una instancia del PrismaService para interactuar con la base de datos
    prismaService = module.get<PrismaService>(PrismaService);

    // Limpia la tabla 'countries' en la base de datos antes de las pruebas
    await prismaService.countries.deleteMany();
  });

  // Se ejecuta después de todas las pruebas para cerrar conexiones y limpiar
  afterAll(async () => {
    // Desconecta el servicio de Prisma de la base de datos
    await prismaService.$disconnect();

    // Cierra la aplicación de NestJS
    await app.close();
  });

  // Caso de prueba individual que verifica si el controlador está correctamente definido
  it('should be defined', () => {
    // Comprueba que el controlador no sea undefined y que se haya instanciado correctamente
    expect(controller).toBeDefined();
  });
});

/*

- la configuración del módulo y la inicialización
        de la base de datos se realizan una sola vez antes de ejecutar todas las pruebas
            Además, se utiliza app.close() para cerrar la aplicación de NestJS adecuadamente,
                lo que asegura una correcta limpieza de recursos.

    Para mantener un equilibrio entre eficiencia y calidad en tus pruebas,
        podrías usar beforeAll en la mayoría de los casos para optimizar el rendimiento
            y reservar beforeEach para pruebas específicas que requieren un estado limpio,
            sobre todo cuando trabajes en módulos donde la base de datos o los servicios
            sean alterados en cada test.

*/
