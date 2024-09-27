import { Controller, Get, Req } from '@nestjs/common';
import { Request } from 'express';
import { AppService } from './app.service';

@Controller('')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(@Req() request: Request): string {
    const currentUrl = request.url; // get actually path
    return `you stay in path: ${currentUrl}`;
  }
}

// import { Controller, Get } from '@nestjs/common';
// import { AppService } from './app.service';

// @Controller('')
// export class AppController {
//   constructor(private readonly appService: AppService) {}

//   @Get()
//   getHello(): string {
//     return this.appService.getHello();
//   }
// }
