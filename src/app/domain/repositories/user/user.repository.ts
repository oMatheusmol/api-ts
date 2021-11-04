import { getManager } from 'typeorm';
import BaseRepository from '../base.repository';
import IUserGET from './interface/IUserGET.interface';
import fs from 'fs';
import path from 'path';

export default class UserRepository extends BaseRepository {
  public async get(empresa: string): Promise<IUserGET> {
    const entityManager = getManager(empresa);
    const sqlText = this.getSqlText('../sql/users/user.get.sql');

    let query = await entityManager.query(sqlText);
    return query;
  }
}
