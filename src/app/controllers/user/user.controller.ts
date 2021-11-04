import { Router } from 'express';
import ReservaRepository from '../../domain/repositories/user/user.repository';
import BaseController from '../base.controller';
const router = Router();

export default new class ReservasController extends BaseController {
  constructor() {
    super(new ReservaRepository());
  }
}
