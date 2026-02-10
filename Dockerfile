# Multi-stage build for SvelteKit with pnpm

# Stage 1: Dependencies
FROM node:lts-alpine AS deps
WORKDIR /app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package files
COPY package.json pnpm-lock.yaml ./
# Copy workspace file if it exists
COPY pnpm-workspace.yaml* ./

# Install dependencies (including dev dependencies for build)
RUN pnpm install --frozen-lockfile

# Stage 2: Build
FROM node:lts-alpine AS builder
WORKDIR /app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy dependencies from deps stage
COPY --from=deps /app/node_modules ./node_modules

# Copy all project files
COPY . .

# Build the application
RUN pnpm run build && \
    ls -la /app && \
    echo "Build directory contents:" && \
    ls -la /app/build || echo "Warning: /app/build not found"

# Stage 3: Production
FROM node:lts-alpine AS runner
WORKDIR /app

# Set to production environment
ENV NODE_ENV=production
ENV PORT=3000

# Create non-root user for security
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 sveltekit

# Install pnpm for production dependencies
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package files
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/pnpm-lock.yaml ./pnpm-lock.yaml

# Install production dependencies only
RUN pnpm install --prod --frozen-lockfile

# Copy built application
COPY --from=builder --chown=sveltekit:nodejs /app/build ./build
COPY --from=builder --chown=sveltekit:nodejs /app/package.json ./package.json

# Switch to non-root user
USER sveltekit

# Expose the port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Start the application
CMD ["node", "build"]
