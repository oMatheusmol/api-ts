import BaseRepository from '../base.repository';
import IUserGET from './interface/IUser.get.interface';
import IUserPOST from './interface/IUser.post.interface';
import mssql from 'mssql';
import IUserPATCH from './interface/IUser.patch.interface';

export default class UserRepository extends BaseRepository {
  public async get(data:IUserGET): Promise<any> {
    try {
      const conn = await this.openConnection();
      const sqlText = this.getSqlText('../sql/users/user.get.sql');
      const result = await conn.request().input('UserID', mssql.Int, data.userID).query(sqlText);

      return result.recordset[0];
    } catch (e) {
      return this.handleError(e, 'users', 'get');
    }
  }

  public async post(data: IUserPOST): Promise<any> {
    try {
      const conn = await this.openConnection();
      const sqlText = this.getSqlText('../sql/users/user.post.sql');
      const result = await conn
        .request()
        .input('Name', mssql.VarChar, data.name)
        .input('Email', mssql.VarChar, data.email)
        .input('Password', mssql.VarChar, data.password)
        .input('Username', mssql.VarChar, data.username)
        .query(sqlText);

      return { message: 'User created successfully' };
    } catch (e) {
      return this.handleError(e, 'users', 'post');
    }
  }

  public async patch(data: IUserPATCH): Promise<any> {
    try {
      const conn = await this.openConnection();
      const sqlText = this.getSqlText('../sql/users/user.patch.sql');
      const result = await conn
        .request()
        .input('UserID', mssql.VarChar, data.userID)
        .input('Name', mssql.VarChar, data.name)
        .input('Email', mssql.VarChar, data.email)
        .input('Password', mssql.VarChar, data.password)
        .input('Username', mssql.VarChar, data.username)
        .query(sqlText);

      return { message: 'User updated successfully' };
    } catch (e) {
      return this.handleError(e, 'users', 'post');
    }
  }
}
