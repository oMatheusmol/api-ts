import 'reflect-metadata';
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { json, urlencoded } from 'body-parser';
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import AuthController from '../controllers/auth/auth.controller';
import Controllers from '../routes/index.routes';
import path from 'path';
import { ControllerMiddleware } from './controller.middleware';

class AppController {
  constructor(public app = express()) {
    this.middlewares();
    this.controllers();
  }

  middlewares() {
    this.app.use(helmet());
    this.app.use(cors());
    this.app.use(urlencoded({ extended: false }));
    this.app.use(json());

    const swaggerDocument = YAML.load(path.resolve(__dirname, '../docs/swagger.yaml'));
    this.app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
    
  }

  controllers() {
    this.app.use('/login', AuthController);
    this.app.use('/user', ControllerMiddleware, Controllers);
  }
}

export default new AppController().app;
