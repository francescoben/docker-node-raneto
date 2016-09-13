FROM node:6.1.0-slim
MAINTAINER Francesco Benigno <ben.francesco@gmail.com>

# Set variables
ENV RANETO_INSTALL_DIR /srv/raneto
ENV PORT=80

# Get Raneto from sources
RUN cd /tmp \
    && curl -SLO "https://github.com/francescoben/Raneto/archive/master.tar.gz" \
    && mkdir -p $RANETO_INSTALL_DIR \
    && tar -xzf "master.tar.gz" -C $RANETO_INSTALL_DIR --strip-components=1 \
    && rm "master.tar.gz"

# Install Raneto and his dependencies
WORKDIR $RANETO_INSTALL_DIR
RUN npm install

# Expose port 80
EXPOSE 80

# Let's go
CMD ["npm", "start"]