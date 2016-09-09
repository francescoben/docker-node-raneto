FROM node:6.1.0-slim
MAINTAINER Francesco Benigno <ben.francesco@gmail.com>

# Set variables
ENV RANETO_INSTALL_DIR /srv/raneto

# Get Raneto from sources
RUN cd /tmp \
    && curl -SLO "https://github.com/francescoben/Raneto/archive/master.tar.gz" \
    && mkdir -p $RANETO_INSTALL_DIR \
    && tar -xzf "master.tar.gz" -C $RANETO_INSTALL_DIR --strip-components=1 \
    && rm "master.tar.gz"

# Install gulp to manage Raneto dependencies
RUN npm install --global gulp-cli

# Install and configure Raneto
WORKDIR $RANETO_INSTALL_DIR
RUN npm install \
    && gulp

# Let's go
ENV PORT=80
EXPOSE 80
CMD ["npm", "start"]