# Use the official Ubuntu base image
FROM ubuntu:24.04

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y apt-transport-https && \
    apt-get install -y wget && \
    apt-get install -y gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | gpg --dearmor -o /usr/share/keyrings/sigsci.gpg

RUN  echo "deb [signed-by=/usr/share/keyrings/sigsci.gpg] https://apt.signalsciences.net/release/ubuntu/ noble main" | tee /etc/apt/sources.list.d/sigsci-release.list

RUN apt-get update

RUN apt-get install -y sigsci-agent

RUN apt-get install -y nginx-module-sigsci-nxo=1.24.0\*

RUN awk 'NR==1{print "load_module /usr/share/nginx/modules/ngx_http_sigsci_nxo_module-1.24.0.so;"; print "";}1' /etc/nginx/nginx.conf > temp && mv temp /etc/nginx/nginx.conf

# Create entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the port the agent will run on
EXPOSE 80

# Copy entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

