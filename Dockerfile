FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "builder"]


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html  # i want to copy something from builder phase from /app/build to /usr/share/nginx/html