import { Response } from 'express';
import { databaseConnect } from '../../infra/database/Database';

export const ConnectionMiddleware = async (req: any, res: Response) => {
  try {
    const { empresa } = req.headers;

    await databaseConnect(empresa);
  } catch (err) {
    res.status(401).send({ Error: err.message });
  }
};
