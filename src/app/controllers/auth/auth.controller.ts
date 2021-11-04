import { Request, Response, Router } from 'express';
import authService from '../../service/auth.service';

const AuthRouter = Router();

AuthRouter.post('', async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;

    const user = await authService.login(username, password);
    if (!user) {
      throw new Error('User not authorized');
    }
    res.status(200).send(user);
  } catch (err) {
    res.status(401).send({ error: err.message });
  }
});
export default AuthRouter;
