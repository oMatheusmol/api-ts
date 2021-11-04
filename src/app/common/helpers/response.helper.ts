'use strict';
import Exception from '../exceptions/exception';
//import log from '../../../infra/logger/logger';
import HttpStatusCode from './http-status-code';
import { Request, Response } from 'express';

/**
 * @author Matheus Mol
 */

/**
 * Padrão de resposta da API
 */
export default class ResponseHelper {
  /// default key => data
  static response(res: Response, data: any, code: number) {
    if (data != null && data.data) {
      res.status(code).json(data);
    } else {
      res.status(code).send({ data: data });
    }
    return;
  }

  /// default key => data
  static error(res: Response, err: Error, code: number) {
    if (err instanceof Exception) {
      const resData = {
        code: err.code,
        message: err.message,
        status: err.status,
      };
      this.response(res, resData, code || err.code);
    } else {
      //log.error(err);
      const data = {
        code: code || HttpStatusCode.INTERNAL_SERVER_ERROR,
        message: err,
        status: 'INTERNAL_SERVER_ERROR',
      };
      this.response(res, data, code);
    }
  }
}
