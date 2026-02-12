const { createApp } = require('./app');
const { env } = require('./config/env');
const { logger } = require('./logger');

const app = createApp();

app.listen(env.API_PORT, () => {
  logger.info(
    {
      event: 'server_started',
      service: 'pro-dental-api',
      port: env.API_PORT,
    },
    'server_started'
  );
});
