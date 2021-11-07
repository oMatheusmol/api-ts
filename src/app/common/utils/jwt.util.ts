'use strict';

import {verify} from 'jsonwebtoken';
import { get } from 'config';
import { Request, Response } from 'express';
//import cert from '../../../infra/config/auth.json';

export default class JwtUtil {

    static verifyApiKey = async (req:Request, res:Response, next) => {
        // Get auth header value
        const token: any = req.headers['x-api-key'];
      
        //exist token
        if (token) {
          //pre validation
          if (!token.length > 1 && !token.length < 170) {
            req.tokenError = `Token jwt invalid`;
            return false;
          }
          // Verify token
          const secret: string = get('AUTH.SECRET');
          const isValid = verify(token, secret, (err, decoded) => {
            //invalid token (expired or other)
            if (err) {
              req.tokenError = `Token ${err.message}`;
              return false;
            } else {
              // Save session in request
              req.security = decoded.data;
              return true;
            }
          });
          return next();
        } else {
          //token error
          throw new Error('Token is required. Access Denied');
        }
      };
  static verifyToken: any;
      
}