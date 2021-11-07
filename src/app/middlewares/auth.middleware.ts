import { Response } from 'express';
import { verify } from 'jsonwebtoken';
import { get } from 'config';
import IDecode from './interface/IDecode.interface';

export const AuthMiddleware = (req: any, res: Response) => {
  const token = req.headers['x-api-key'];
  const secret: string = get('AUTH.SECRET');
  if (token) {
    verify(token, secret, (err:any, decoded:IDecode) => {
      if (err) throw new Error('Token is required. Access Denied');
      return req.security = decoded;
    });
  } else {
    throw new Error('Token is required. Access Denied');
  }
};
