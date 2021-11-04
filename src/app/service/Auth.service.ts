import GenerateUserToken from '../common/utils/generateToken.util';

class AuthService {
  public async login(username: string, password: string): Promise<any> {
    const user = { username, password };

    if (!user) {
      throw new Error('Usuário não encontrado');
    }

    if (password !== user.password || username !== user.username) {
      throw new Error('Username ou senha incorretos');
    }

    user.password = undefined;

    console.info(`User ${user.username.toUpperCase()} logado.`);

    return { user, token: GenerateUserToken(username) };
  }
}

export default new AuthService();
