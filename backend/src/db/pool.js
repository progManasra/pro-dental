const mysql = require('mysql2/promise');
const { env } = require('../config/env');
const { logger } = require('../logger');

let pool;

function getPool() {
  if (!pool) {
    pool = mysql.createPool({
      host: env.MYSQL_HOST,
      port: env.MYSQL_PORT,
      user: env.MYSQL_USER,
      password: env.MYSQL_PASSWORD,
      database: env.MYSQL_DB,
      waitForConnections: true,
      connectionLimit: 10
    });
    logger.info({ db: env.MYSQL_DB, host: env.MYSQL_HOST }, 'MySQL pool created');
  }
  return pool;
}

module.exports = { getPool };
