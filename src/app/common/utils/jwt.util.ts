'use strict';

import jwt from 'jsonwebtoken';
//import cert from '../../../infra/config/auth.json';

export default class JwtUtil {

    static sign(data, exp) {
        return new Promise(function (resolve, reject) {
            // validade de 1 dia
            // data.expiresIn = 86400;
            // jwt.sign(data, cert.secret, { expiresIn: exp || '1d' }, function (err, token) {
            //     if (err) {
            //         reject(err);
            //     } else {
            //         resolve(token);
            //     }
            // });
        });
    }

    static verify(token, secretOrPublicKey, callback) {
        try {
            const decoded = jwt.verify(token, secretOrPublicKey, callback);
            return decoded;
        } catch (err) {
            console.log(err.message);
            return false;
        }
    }

    static decode(token) {
        try {
            const decoded = jwt.decode(token);
            return decoded;
        } catch (err) {
            return null;
        }
    }
}