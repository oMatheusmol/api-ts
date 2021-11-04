import Exception from './exception';
import HttpStatusCode from '../helpers/http-status-code';
export default class UnprocessableEntityException extends Exception {
    constructor(message) {
        super(message, HttpStatusCode.UNPROCESSABLE_ENTITY);
    }
}