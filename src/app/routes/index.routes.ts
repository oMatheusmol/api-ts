import express, { Router } from 'express';
import path from 'path';
import userRoutes from './user.routes';
import AuthRouter from './auth.routes';

const router = Router();

router.use('', userRoutes);
router.use('', AuthRouter);

export default router;
