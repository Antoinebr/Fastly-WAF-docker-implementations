# Use the official Debian base image
FROM debian:latest

# Install dependencies
RUN apt-get update \
    && apt-get install -y wget unzip zip apt-transport-https gnupg git 

# Add Signal Sciences repository and install the agent
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | gpg --dearmor -o /usr/share/keyrings/sigsci.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/sigsci.gpg] https://apt.signalsciences.net/release/debian/ bullseye main" | tee /etc/apt/sources.list.d/sigsci-release.list \
    && apt-get update \
    && apt-get install -y sigsci-agent

RUN apt-get install nodejs npm -y

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

# Keep the container running
CMD ["sigsci-agent"]
