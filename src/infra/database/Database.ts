import { createConnections } from 'typeorm';
import config from 'config';

export const databaseConnect = async (empresa) => {
  try {
    let database = config.get(`DATABASE`)[empresa];

    if (process.env.DATABASE_NAME === undefined) {
      let options = Object.entries(config.get(`DATABASE`)).map((data: any) => {
        return {
          name: data[0],
          type: data[1].TYPE,
          host: data[1].HOST,
          port: data[1].PORT,
          username: data[1].USER,
          password: data[1].PASSWORD,
          database: data[1].NAME,
          entities: ['./src/**/*.model.ts'],
          extra: {
            insecureAuth: true,
          },
          options: {
            enableArithAbort: false,
            cryptoCredentialsDetails: {
              minVersion: 'TLSv1',
            },
          },
        };
      });

      console.log('Starting Database connections');
      await createConnections(options);

      console.log('Databases connected...');
    }

    process.env['DATABASE_NAME'] = database.NAME;
  } catch (err) {
    console.error('Error in Database Connection: ', err.message);
  }
};
