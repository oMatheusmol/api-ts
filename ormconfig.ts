import config from 'config';

export default {
  type: config.get('DATABASE.TYPE'),
  host: config.get('DATABASE.HOST'),
  port: config.get('DATABASE.PORT'),
  username: config.get('DATABASE.USER'),
  password: config.get('DATABASE.PASSWORD'),
  database: config.get('DATABASE.NAME'),
  entities: [__dirname + '/src/**/*.model.{js,ts}'],
  migrations: [__dirname + '/src/database/migrations/*.{js,ts}'],
  cli: {
    migrationsDir: './src/database/migrations',
  },
  extra: {
    insecureAuth: true,
  },
  options: {
    enableArithAbort: false,
    // instanceName: config.get('DATABASE.INSTANCE_NAME'),
  },
};
