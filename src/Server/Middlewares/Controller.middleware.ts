import { Response, NextFunction } from 'express';
import { ConnectionMiddleware } from './Empresa.middleware';
import { AuthMiddleware } from './Auth.middleware';


export const ControllerMiddleware = async (req: any, res: Response, next: NextFunction) => {
  try {
    await ConnectionMiddleware(req, res)
    //AuthMiddleware(req, res)
    
    return next();
  } catch (err) {
    res.status(401).send({ Error: err.message });
  }
};
