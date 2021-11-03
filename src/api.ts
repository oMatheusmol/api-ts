import 'reflect-metadata';
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { json, urlencoded } from 'body-parser';
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import AuthController from './Auth/Auth.controller';
import Controllers from './Server/Controllers';
import path from 'path';
import { ControllerMiddleware } from './Server/Middlewares/Controller.middleware';

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
    
    const swaggerDocument = YAML.load(path.resolve(__dirname,'./Swagger/swagger.yaml'));
    this.app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
  }

  controllers() {
    this.app.use('/login', AuthController);
    this.app.use('/user', ControllerMiddleware, Controllers);
  }
}

export default new AppController().app;
