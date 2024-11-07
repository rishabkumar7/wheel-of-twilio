FROM node:20-alpine

RUN apk add --no-cache libc6-compat
RUN apk add --no-cache python3 py3-pip make g++
WORKDIR /app
COPY package.json pnpm-lock.yaml* ./
RUN yarn global add pnpm && pnpm i --frozen-lockfile;

COPY . .

RUN pnpm build

WORKDIR /app/.next/standalone

EXPOSE 3000

CMD ["node", "server.js"]