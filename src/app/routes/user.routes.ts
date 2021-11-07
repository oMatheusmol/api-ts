import { Request, Response, Router } from 'express';
import controller from '../controllers/user/user.controller';
const router = Router();

router.get('', async (req: Request, res: Response) => controller.get(req, res));
router.post('', async (req: Request, res: Response) => controller.post(req, res));
router.patch('', async (req: Request, res: Response) => controller.patch(req, res));
router.delete('', async (req: Request, res: Response) => controller.deleteById(req, res));

export default router;
