FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build - build folder will be created in working directory

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html