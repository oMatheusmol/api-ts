import { Request, Response, Router } from 'express';
import AuthService from '../../service/auth.service';

const AuthRouter = Router();
const ControllerName = '/fca_login';

AuthRouter.post(`${ControllerName}/auth/login`, async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;

    const user = await AuthService.login(username, password);
    if (!user) {
      throw new Error('User not authorized');
    }
    res.status(200).send(user);
  } catch (err) {
    res.status(401).send({ error: err.message });
  }
});
export default AuthRouter;
