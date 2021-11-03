// 'use strict';
// const fs = require('fs');
// const path = require('path');
// const config = require('config');
// const dateformat = require('dateformat');
// const logger = require('tracer').console({
//     format: '[{{timestamp}}]<{{title}}> {{message}} (in {{file}}:{{line}})',
//     dateformat: 'yyyy-mm-dd HH:MM:ss',
//     preprocess: function (data) {
//         data.title = data.title.toUpperCase()
//     },
//     transport: function (data) {
//         if (config.get('ENV') === 'production') {
//             let fileName = dateformat(new Date(), 'yyyy-mm-dd-HH-mm');
//             const dirLog = path.join(__dirname, '../../../logs');
//             if (!fs.existsSync(dirLog)) {
//                 fs.mkdirSync(dirLog);
//             }
//             fs.createWriteStream(path.join(dirLog, `./${fileName}.txt`), {
//                 flags: "a",
//                 encoding: "utf8"
//             }).write(data.rawoutput + "\n");
//         }
//         console.log(data.output);
//     }
// });
// module.exports = class Log {
//     static log(err) {
//         logger.log(err);
//     }
//     static trace(err) {
//         logger.trace(err);
//     }
//     static debug(err) {
//         logger.debug(err);
//     }
//     static info(err) {
//         logger.info(err);
//     }
//     static warn(err) {
//         logger.warn(err);
//     }
//     static error(err) {
//         logger.error(err);
//     }
// }