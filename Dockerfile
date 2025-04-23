# 1. Build Stage
# ----------------------
    FROM node:20-alpine AS builder

    # Set working directory
    WORKDIR /app
    
    # Copy package files
    COPY package*.json ./
    
    # Install dependencies
    RUN npm install
    
    # Copy the rest of the application code
    COPY . .
    
    # Build the application (if applicable)
    # RUN npm run build
    
    # 2. Production Stage
    # ----------------------
    FROM node:20-alpine
    
    # Set working directory
    WORKDIR /app
    
    # Copy built files from the builder stage
    COPY --from=builder /app .
    
    # Expose the application port (replace 3000 with your app's port)
    EXPOSE 3000
    
    # Start the application
    CMD ["npm", "start"]
    