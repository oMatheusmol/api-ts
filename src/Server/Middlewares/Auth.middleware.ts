import { Response } from 'express';
import { verify } from 'jsonwebtoken';
import { get } from 'config';

export const AuthMiddleware = (req: any, res: Response) => {
  try {
    const authHeader = req.headers.authorization;
    const tokenSecret: string = get('SERVER.AUTH.SECRET');

    if (!authHeader) {
      throw new Error('No token provided.');
    }

    const tokenParts = authHeader.split(' ');

    if (!(tokenParts.length === 2)) {
      throw new Error('Token error');
    }

    const [schema, token] = tokenParts;

    if (!/^Bearer$/i.test(schema))
      return req.res.status(401).send({ error: 'Token unformatted' });

    verify(token, tokenSecret, async (err: any, decoded: any) => {
      try {
        if (err) {
          throw new Error('Token invalid.');
        }

        req.userId = decoded.id;
      } catch (error) {
        res.status(401).send({ Error: error.message });
      }
    });
  } catch (err) {
    res.status(401).send({ Error: err.message });
  }
};
