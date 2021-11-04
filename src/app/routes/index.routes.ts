import express, { Router } from 'express';
import path from 'path';
import userRoutes from './user.routes';

const router = Router();

router.use('', userRoutes);

export default router;
