import Exception from './exception';
import HttpStatusCode from '../helpers/http-status-code';
export default class UnauthorizedException extends Exception {
    constructor(message) {
        super(message, HttpStatusCode.UNAUTHORIZED);
    }
}