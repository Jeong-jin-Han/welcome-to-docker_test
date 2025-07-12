FROM node:alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Install git
RUN apk add --no-cache git

# Prepare SSH directory for tests
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Keep container alive for exec in tests
CMD ["tail", "-f", "/dev/null"]