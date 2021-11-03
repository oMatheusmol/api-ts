import { Request, Response, Router } from 'express';
import ReservaRepository from '../../Reservas/Reservas.repository';
import BaseController from './base.controller';
const router = Router();

export default new class ReservasController extends BaseController {
  constructor() {
    super(new ReservaRepository());
  }
}
