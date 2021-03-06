# Build Phase

FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# from above all files will be created in a folder called 'build'

# Run Phase .. FROM statements means new block

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# Start nginx runs by default


