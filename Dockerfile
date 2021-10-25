FROM cypress/base:14

USER root

RUN node --version
RUN echo "force new chrome here"

# install Chromebrowser
RUN \
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  apt-get update -y && \
  apt-get -fy install xdg-utils fonts-liberation zip && \
  dpkg -i google-chrome-stable_current_amd64.deb && \
  apt-get -fy install

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# versions of local tools
RUN node -v
RUN npm -v
RUN yarn -v
RUN google-chrome --version
RUN zip --version
RUN git --version

# a few environment variables to make NPM installs easier
# good colors for most applications
ENV TERM xterm
# avoid million NPM install messages
ENV npm_config_loglevel warn
# allow installing when the main user is root
ENV npm_config_unsafe_perm true
