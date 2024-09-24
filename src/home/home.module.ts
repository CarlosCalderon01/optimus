import { Module } from '@nestjs/common';
import { HomeController } from './home.controller';
import { GlobalModule } from './global/global.module';
import { RouterModule } from '@nestjs/core';

@Module({
  imports: [
    RouterModule.register([
      {
        path: 'home', // Define el prefijo /home
        children: [
          {
            path: 'global', // Define el prefijo /home/global
            module: GlobalModule, // Asocia el GlobalModule a esta ruta
          },
        ],
      },
    ]),
    GlobalModule,
  ],
  controllers: [HomeController],
})
export class HomeModule {}
