# ---- Builder ----
FROM node:20-alpine AS builder
WORKDIR /app

# Install dependencies first (better caching)
COPY package*.json ./
RUN npm ci

# Copy source
COPY . .

# ---- Runtime ----
FROM node:20-alpine
WORKDIR /app

ENV NODE_ENV=production

# Copy only what we need from builder (avoids host node_modules)
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src

EXPOSE 8091
CMD ["node", "src/server.js"]
