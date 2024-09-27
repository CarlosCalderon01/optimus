import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Configuración básica de Swagger
  const config = new DocumentBuilder()
    .setTitle('API Documentation')
    .setDescription('API description')
    .setVersion('1.0')
    .build();

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

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document); // Documentación accesible en /api
}
bootstrap();
