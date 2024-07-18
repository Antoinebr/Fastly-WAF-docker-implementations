# Use the official Debian base image
FROM debian:11

ENV DEBIAN_FRONTEND noninteractive


# Install Apache2
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y wget  && \
    apt-get install -y apt-utils && \
    apt-get install -y gnupg  && \
    apt-get install -y gpg && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | gpg --dearmor -o /usr/share/keyrings/sigsci.gpg


RUN echo "deb [signed-by=/usr/share/keyrings/sigsci.gpg] https://apt.signalsciences.net/release/debian/ bullseye main" |  tee /etc/apt/sources.list.d/sigsci-release.list

RUN apt-get update

RUN apt-get -y install sigsci-agent 

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the port Apache2 runs on
EXPOSE 80

# Copy entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Keep the container running
CMD ["sigsci-agent"]