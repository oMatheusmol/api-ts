import Exception from './exception';
import HttpStatusCode from '../helpers/http-status-code';
export default class NotFoundException extends Exception {
    constructor(message) {
        super(message, HttpStatusCode.NOT_FOUND);
    }
}