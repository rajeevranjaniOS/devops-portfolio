# Use lightweight Nginx image


####################################################
# DevOps Portfolio Website
# Production Dockerfile
####################################################

# Use official lightweight Nginx image
FROM nginx:1.29-alpine

# Maintainer Information
LABEL org.opencontainers.image.authors="Rajeev Ranjan"

LABEL application="DevOps Portfolio"

LABEL version="1.0"

LABEL description="Production-ready DevOps Portfolio Website"

# Remove default Nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy portfolio website
COPY . /usr/share/nginx/html

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80


HEALTHCHECK --interval=30s --timeout=3s \
CMD wget --quiet --tries=1 --spider http://localhost || exit 1

# Start nginx
CMD ["nginx","-g","daemon off;"]
