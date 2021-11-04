'use strict';
import ObjectUtil from '../../common/utils/object.util';
import HttpStatusCode from '../helpers/http-status-code';

export default class Exception extends Error {
  code: number;
  status: string;
  message: string;
  data: object;
  constructor(err: any, status: number) {
    super(err || 'INTERNAL_SERVER_ERROR');

    let errorMsg = err;
    if (typeof err === 'string') {
      errorMsg = err;
    } else if (err.message) {
      errorMsg = err.message;
    } else if (err.response && err.response.data && typeof err.response.data.message === 'object') {
      errorMsg = JSON.stringify(err.response.data.message);
    } else if (err.isAxiosError && err.response) {
      errorMsg =
        err.message + `\n ${typeof err.response.data === 'object' ? JSON.stringify(err.response.data) : err.response.data}`;
    } else {
      //eh um objeto mas nao eh uma exception
      this.data = typeof err === 'object' ? err : undefined;
    }
    this.message = errorMsg;
    this.code = status || 500;
    this.status = ObjectUtil.getKeyFromObject(HttpStatusCode, this.code);
  }
}
