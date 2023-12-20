FROM node:18.11 as build
WORKDIR /build
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build


FROM nginx:1.23
WORKDIR /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/dist ./
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
