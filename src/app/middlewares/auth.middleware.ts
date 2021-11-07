import { Response } from 'express';
import { verify } from 'jsonwebtoken';
import { get } from 'config';

export const AuthMiddleware = (req: any, res: Response) => {
  const token = req.headers['x-api-key'];
  const secret: string = get('AUTH.SECRET');
  //exist token
  if (token) {
    //pre validation
    // Verify token
    const isValid = verify(token, secret, (err, decoded) => {
      //invalid token (expired or other)
      if (err) {
        req.tokenError = `Token ${err.message}`;
        throw new Error('Token is required. Access Denied');
      } else {
        // Save session in request
        req.security = decoded.data;
        return true;
      }
    });
    return isValid;
  } else {
    //token error
    throw new Error('Token is required. Access Denied');
  }
};
