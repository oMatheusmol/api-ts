import { getManager } from 'typeorm';

export default class ReservaRepository {

  public async get(empresa: string): Promise<any> {
    const entityManager = getManager(empresa);

    let query = await entityManager.query(
      `
      select * from Users
      `
    );
    return query;
  }
 
}
