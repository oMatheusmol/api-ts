import GenerateUserToken from '../common/utils/generateToken.util';
import config from 'config';

class AuthService {
  public async login(username: string, password: string): Promise<any> {

    const user = config.get('AUTH.LOGIN')
    const pass = config.get('AUTH.PASSWORD')

    if (password !== pass || username !== user) {
      throw new Error('Username ou senha incorretos');
    }

    console.info(`User ${user.toUpperCase()} logado.`);

    return { user, token: GenerateUserToken(username) };
  }
}

export default new AuthService();
