FROM node:12.22

WORKDIR /app

COPY app/package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

# Command to run when the container is ready
# Separate arguments as separate values in the array
CMD ["npm", "run", "start"]
