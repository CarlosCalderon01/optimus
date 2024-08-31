import {
  Injectable,
  OnModuleInit,
  INestApplication,
  OnModuleDestroy,
} from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  // Se conecta automáticamente a la base de datos al inicializarse (onModuleInit).
  async onModuleInit() {
    await this.$connect();
  }

  // se desconecta de la base de datos al destruirse (onModuleDestroy).
  async onModuleDestroy() {
    await this.$disconnect();
  }

  // Cierra la aplicación NestJS limpiamente antes de salir (enableShutdownHooks)
  async enableShutdownHooks(app: INestApplication) {
    process.on('beforeExit', async () => {
      console.log('Aplicación se está cerrando...');
      await app.close();
    });
  }
}

/*

    Injectable:
        Este decorador convierte a PrismaService en un proveedor que puede ser inyectado en otras partes de la aplicación utilizando el sistema de inyección de dependencias de NestJS.

    OnModuleInit y OnModuleDestroy:
        Son interfaces de ciclo de vida de NestJS. OnModuleInit se utiliza para realizar tareas al inicio del módulo, y OnModuleDestroy se utiliza para realizar tareas al destruir el módulo, como liberar recursos.

    INestApplication:
        Este es el tipo para la instancia de la aplicación NestJS. Se usa para interactuar con la aplicación NestJS directamente, por ejemplo, para cerrarla de manera programada.

    PrismaClient:
        La clase base generada por Prisma que proporciona métodos para interactuar con la base de datos.

    PrismaService extends PrismaClient:
        La clase PrismaService extiende de PrismaClient, lo cual le permite utilizar todos los métodos de PrismaClient para interactuar con la base de datos.

    implements OnModuleInit, OnModuleDestroy:
        Al implementar estas interfaces, PrismaService está obligado a definir los métodos onModuleInit y onModuleDestroy:

    onModuleInit():
        Este método es llamado automáticamente cuando el módulo que contiene este servicio es inicializado.
            Aquí, await this.$connect(); establece una conexión a la base de datos usando Prisma.
            Asegura que la conexión esté lista antes de que otros componentes del módulo intenten acceder a la base de datos.

    onModuleDestroy():
        Este método es llamado automáticamente cuando el módulo que contiene este servicio está siendo destruido. Aquí, await this.$disconnect(); cierra la conexión con la base de datos, liberando recursos y asegurando una correcta finalización de las operaciones pendientes.

    enableShutdownHooks(app: INestApplication):
        Este método es un gancho para configurar acciones personalizadas cuando la aplicación NestJS está a punto de cerrarse:

    this.$on('beforeExit', async () => { await app.close(); });:
        Escucha el evento beforeExit, que es emitido por Prisma antes de que la aplicación salga. Cuando se detecta este evento, se cierra la aplicación NestJS con await app.close();. Esto es útil para asegurar que todos los procesos, como las conexiones de base de datos y otros recursos, se cierren limpiamente cuando la aplicación termine.

*/
