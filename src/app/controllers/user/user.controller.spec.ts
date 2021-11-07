import UserRepository from '../../domain/repositories/user/user.repository';
import IUserGET from '../../domain/repositories/user/interface/IUser.get.interface';
import IUserPOST from '../../domain/repositories/user/interface/IUser.post.interface';
import IUserPATCH from '../../domain/repositories/user/interface/IUser.patch.interface';

describe('Users, GET', () => {
  it('should get user', async () => {
    const iExpect = {
      userID: 28,
      name: 'Matheus',
      email: 'matheus@hotmail.com',
      username: 'matheusmol',
      password: 'teste',
    };
    const sut = new UserRepository();
    const result: IUserGET = await sut.get(iExpect);

    expect(iExpect).toMatchObject(result);
  });
});

// describe('Users, POST', () => {
//   it('should create user', async () => {
//     const Idata: IUserPOST = {
//       name: 'Matheus',
//       email: 'matheusmol@hotmail.com',
//       username: 'matheusmol',
//       password: 'teste',
//     };
//     const sut = new UserRepository();
//     const result = await sut.post(Idata);

//     expect(result).toStrictEqual({ message: 'User created successfully' });
//   });
// });

describe('Users, PATCH', () => {
  it('should update user', async () => {
    const Idata: IUserPATCH = {
      userID: 28,
      email: 'matheus@hotmail.com',
      username: 'matheusmol',
    };
    const sut = new UserRepository();
    const result = await sut.patch(Idata);

    expect(result).toStrictEqual({ message: 'User updated successfully' });
  });
});

describe('Users, DELETE', () => {
  it('should delete user', async () => {
    const Idata: IUserPATCH = {
      userID: 9,
    };
    const sut = new UserRepository();
    const result = await sut.delete(Idata);

    expect(result).toStrictEqual({ message: 'User deleted successfully' });
  });
});
