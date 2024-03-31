FROM node:16.20.2-slim as build
WORKDIR /app
RUN npm install -g @angular/cli@13
COPY package.json package-lock.json /app/
RUN npm install
COPY . .
RUN ng build --prod

FROM nginx:alpine
COPY --from=build /app/dist/angular-app /usr/share/nginx/html