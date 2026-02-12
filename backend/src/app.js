const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const { errorHandler } = require('./middlewares/errorHandler');
const { setupSwagger } = require('./config/swagger');
const { dbPing } = require('./db/health');
const adminBoardRoutes = require('./modules/admin_board/admin_board.routes');
const { logger } = require('./logger'); // ✅ مهم

const { metricsMiddleware, metricsHandler } = require('./metrics'); // ✅ أضف دي


function createApp() {
  const app = express();

  app.use(helmet());
  app.use(cors());
  app.use(express.json({ limit: '1mb' }));
  app.use(metricsMiddleware); // ✅ أضف دي
  app.get('/metrics', metricsHandler);


  
  // ✅ Request ID (عشان التتبع)
  app.use((req, res, next) => {
    req.requestId =
      req.headers['x-request-id'] ||
      `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
    res.setHeader('x-request-id', req.requestId);
    next();
  });

  // ✅ Access logs (JSON structured)
  app.use((req, res, next) => {
    const start = Date.now();

    res.on('finish', () => {
      logger.info(
        {
          event: 'http_request',
          requestId: req.requestId,
          method: req.method,
          path: req.originalUrl,
          status: res.statusCode,
          duration_ms: Date.now() - start,
          ip: req.ip,
          userAgent: req.headers['user-agent'],
        },
        'http_request'
      );
    });

    next();
  });

  setupSwagger(app);

  app.get('/health', async (req, res) => {
    const dbOk = await dbPing().catch(() => false);

    logger.info(
      {
        event: 'health_check',
        requestId: req.requestId,
        db: dbOk,
      },
      'health_check'
    );

    res.json({ ok: true, db: dbOk });
  });

  app.use('/api/v1/auth', require('./modules/auth/auth.routes'));
  app.use('/api/v1/users', require('./modules/users/users.routes'));
  app.use('/api/v1/schedules', require('./modules/schedules/schedules.routes'));
  app.use('/api/v1/appointments', require('./modules/appointments/appointments.routes'));
  app.use('/api/v1/admin', adminBoardRoutes);

  // Error handler (آخر شي)
  app.use(errorHandler());

  return app;
}

module.exports = { createApp };
