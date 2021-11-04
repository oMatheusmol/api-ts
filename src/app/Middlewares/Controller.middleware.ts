import { Response, NextFunction } from 'express';
import { ConnectionMiddleware } from './conection.middleware';
//import { AuthMiddleware } from './auth.middleware';

export const ControllerMiddleware = async (req: any, res: Response, next: NextFunction) => {
  try {
    await ConnectionMiddleware(req, res);
    //AuthMiddleware(req, res)

    return next();
  } catch (err) {
    res.status(401).send({ Error: err.message });
  }
};
