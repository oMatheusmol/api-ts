import { get } from 'config';
import app from './api';
import http from 'http';
import https from 'https';
import * as dotenv from 'dotenv';
dotenv.config();

const port = get('SERVER.PORT');
const environment = process.env.NODE_ENV.toUpperCase();

const startup = async () => {
  console.info(`Using Environment: ${environment}`);
  console.info(`Process ID: ${process.pid}`);
  console.info('Starting API...');
  

  const options = {};

  const server = Object.keys(options).length > 0 ? https.createServer(options, app) : http.createServer(app);

  server.listen(port, () =>
    console.log(`API running in port: ${port}`)
  );

};

(
  async () => {
  try {
    await startup();
  } catch (err) {
    console.error('Error in API Connection: ', err.message);
    process.exit(1);
  }
}
)();
