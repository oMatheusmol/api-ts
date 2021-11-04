import { Router } from 'express';
import UserRepository from '../../domain/repositories/user/user.repository';
import BaseController from '../base.controller';
const router = Router();

export default new (class UserController extends BaseController {
  constructor() {
    super(new UserRepository());
  }
})();
