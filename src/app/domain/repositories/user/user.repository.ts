import { getManager } from 'typeorm';
import BaseRepository from '../base.repository';
import IUserGET from './interface/IUserGET.interface';
import fs from 'fs';
import path from 'path';

export default class UserRepository extends BaseRepository {
  //Promise<IUserGET
  public async get(): Promise<IUserGET> {
    const conn = await this.openConnection();
    const sqlText = this.getSqlText('../sql/users/user.get.sql');
    const result = await conn.request().query(sqlText);
    return result.recordset[0];
  }
}
