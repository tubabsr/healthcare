FROM node:16 as build

WORKDIR /app

#ENV NODE_OPTIONS=--openssl-legacy-provider

COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/* /usr/share/nginx/html
EXPOSE 80
