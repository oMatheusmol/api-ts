import { Response, NextFunction } from 'express';
import { AuthMiddleware } from './auth.middleware';


export const ControllerMiddleware = async (req: any, res: Response, next: NextFunction) => {
  try {
    AuthMiddleware(req, res)
    
    return next();
  } catch (err) {
    res.status(401).send({ Error: err.message });
  }
};
