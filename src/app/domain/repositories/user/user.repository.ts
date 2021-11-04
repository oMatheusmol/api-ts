import { getManager } from 'typeorm';
import BaseRepository from '../base.repository';

export default class ReservaRepository extends BaseRepository {

  public async get(empresa: string): Promise<any> {
    const entityManager = getManager(empresa);
    const sqlText = this.getSqlText('../sql/users/user.get.sql');

    let query = await entityManager.query(sqlText);
    return 'true';
  }
  o
}
