FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy the pre-built Vite output
COPY dist/ /usr/share/nginx/html/

# Copy our custom nginx config (listens on 3000, handles React Router)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]