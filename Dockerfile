# src : https://docs.konghq.com/gateway/3.5.x/plugin-development/distribution/
FROM kong/kong-gateway:latest

# Ensure any patching steps are executed as root user
USER root

# Add custom plugin to the image
COPY kong/ kong
COPY testplugin-0.1-1.rockspec testplugin-0.1-1.rockspec

COPY scripts/ ./scripts
RUN ["chmod", "+x", "./scripts/docker-entrypoint.sh"]

# Copy configs to directory where Kong looks for effective configs
COPY ./conf/ /etc/kong/

# Give user kong persmission `/usr/local/bin` so to install lua plugin.
RUN chown -R kong:kong /usr/local/bin

# Ensure kong user is selected for image execution
USER kong

# Run kong
ENTRYPOINT ["./scripts/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 8444
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD kong health
CMD ["kong", "docker-start"]
