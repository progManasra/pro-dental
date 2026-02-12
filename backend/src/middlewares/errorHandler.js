const { logger } = require('../logger');

function errorHandler() {
  return (err, req, res, next) => {
    const status = err.statusCode || err.status || 500;

    logger.error(
      {
        event: 'http_error',
        requestId: req.requestId,
        method: req.method,
        path: req.originalUrl,
        status,
        error: {
          message: err.message,
          stack: err.stack,
        },
      },
      'http_error'
    );

    res.status(status).json({
      ok: false,
      requestId: req.requestId,
      message: err.message || 'Internal Server Error',
    });
  };
}

module.exports = { errorHandler };
