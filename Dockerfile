FROM node:alpine 
#remved 'as builder' from above line
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD npm run build

FROM nginx
EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
