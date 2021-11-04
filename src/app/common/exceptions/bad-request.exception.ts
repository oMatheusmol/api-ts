'use strict';
import Exception from './exception';
import HttpStatusCode from '../helpers/http-status-code';
export default class BadRequestException extends Exception {
    constructor(message) {
        super(message, HttpStatusCode.BAD_REQUEST);
    }
}