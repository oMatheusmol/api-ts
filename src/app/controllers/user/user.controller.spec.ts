import UserRepository from '../../domain/repositories/user/user.repository';
import IUserGET from '../../domain/repositories/user/interface/IUserGET.interface';

describe('Users, GET', () => {
  it('should get user data', async () => {
    const iExpect: IUserGET = {
      userID: 1,
      name: 'teste',
      email: 'teste@test.com',
      username: 'admin',
      password: 'admin'
    }
    const sut = new UserRepository();
    const result = await sut.get();

    expect(iExpect).toMatchObject(result);
  })
  
  it('should ok', async () => {
    const name = 'matheus'

    expect(name).toBe('matheus');
  })
});
