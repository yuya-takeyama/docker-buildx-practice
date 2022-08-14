FROM node:16-alpine

WORKDIR /app

RUN apk add --no-cache -U yarn

COPY package.json yarn.lock ./
RUN \
  --mount=type=cache,target=/app/node_modules \
  --mount=type=cache,target=/usr/local/share/.cache/yarn \
  time yarn --ignore-scripts
