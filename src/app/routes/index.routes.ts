import express, { Router } from 'express';
import path from 'path';
import ReservasRoutes from './Reservas.routes';

const router = Router();

router.use('/reservas', ReservasRoutes);

export default router;
