'use strict';

import ResponseHelper from '../common/helpers/response.helper';
import HttpStatusCode from '../common/helpers/http-status-code';
import { Request, Response } from 'express';

/**
 * Request service HTTP route
 */
export default class BaseController {
  _repository: any;

  constructor(repository) {
    //initialize service object
    this._repository = repository;
  }

  async get(req: any, res: any) {
    try {
      req.body.userID = Number(req.headers.userid);
      const results = await this._repository.get(req.body);
      ResponseHelper.response(res, results, HttpStatusCode.OK);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }
  async getById(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const result = await this._repository.getById(id);
      ResponseHelper.response(res, result, HttpStatusCode.OK);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }

  async post(req: Request, res: Response) {
    try {
      const result = await this._repository.post(req.body);
      ResponseHelper.response(res, result, HttpStatusCode.CREATED);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }

  async put(req: Request, res: Response) {
    try {
      req.body.id = req.query.id;
      const result = await this._repository.put(req.body);
      ResponseHelper.response(res, result, HttpStatusCode.OK);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }

  async patch(req: Request, res: Response) {
    try {
      const body = req.body;
      const result = await this._repository.patch(body);
      ResponseHelper.response(res, result, HttpStatusCode.OK);
    } catch (err) {
      if (err instanceof DOMException) {
        ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
      } else {
        ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
      }
    }
  }

  async deleteById(req: Request, res: Response) {
    try {
      const id = req.query.id;
      const result = await this._repository.deleteById(id);
      ResponseHelper.response(res, result, HttpStatusCode.OK);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }

  async sendSuccess(res: Response, result: any) {
    try {
      ResponseHelper.response(res, result, HttpStatusCode.OK);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }

  async sendError(res: Response, result: any) {
    try {
      ResponseHelper.response(res, result, HttpStatusCode.BAD_REQUEST);
    } catch (err) {
      ResponseHelper.error(res, err, HttpStatusCode.INTERNAL_SERVER_ERROR);
    }
  }
}
