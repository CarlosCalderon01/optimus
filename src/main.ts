import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Habilitar la validación global
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // elimina los campos que no están en el DTO
      forbidNonWhitelisted: true, // lanza error si se envían campos no definidos en el DTO
      transform: true, // transforma los tipos de datos
    }),
  );

  // http://localhost:3000/
  await app.listen(3000);
}
bootstrap();
