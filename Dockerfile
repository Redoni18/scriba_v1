FROM oven/bun:1.1.42

WORKDIR /scriba

# Install OpenSSL and other necessary libraries
RUN apt-get update && apt-get install -y \
    openssl \
    libssl-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and bun.lockb
COPY package.json bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application
COPY . .

# Generate Prisma client
RUN bunx prisma generate

# Start the application
CMD ["bun", "run", "src/index.ts"]

