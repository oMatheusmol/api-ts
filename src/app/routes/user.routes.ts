import { Request, Response, Router } from 'express';
import controller from '../controllers/user/user.controller';
const router = Router();

router.get('', async (req: Request, res: Response) => controller.get(req, res));

export default router;
