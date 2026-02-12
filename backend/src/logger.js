// const winston = require("winston");

// const logger = winston.createLogger({
//   level: process.env.LOG_LEVEL || "info",
//   format: winston.format.combine(
//     winston.format.timestamp(),
//     winston.format.json()
//   ),
//   transports: [new winston.transports.Console()],
// });

// module.exports = logger;
const pino = require("pino");

const logger = pino({
  level: process.env.LOG_LEVEL || "info",
  base: null, // اختياري: يمنع إضافة pid/hostname تلقائياً لو بدك لوج أنظف
  timestamp: pino.stdTimeFunctions.epochTime, // نفس شكل الوقت اللي ظهر عندك (رقم)
});

module.exports = { logger };
