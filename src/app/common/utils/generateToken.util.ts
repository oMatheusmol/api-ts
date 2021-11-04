import { sign } from 'jsonwebtoken';
import { get } from 'config';

export default function GenerateUserToken(username: string) {
  const secret: string = get('AUTH.SECRET');
  const token = sign({ username }, secret, { expiresIn: '1d' });

  return token;
}
