import Exception from './exception';
import HttpStatusCode from '../helpers/http-status-code';
export default class ForbiddenException extends Exception {
    constructor(message) {
        super(message, HttpStatusCode.FORBIDDEN);
    }
}