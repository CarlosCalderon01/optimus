import { Controller, Get } from '@nestjs/common';

@Controller('')
export class GlobalController {
  @Get()
  getHome() {
    return 'Information global';
  }
}
