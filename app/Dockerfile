FROM elixir:1.8.1

ENV NODE_VERSION 10.x

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
&& apt-get install -y nodejs wget

RUN npm install npm@latest -g

RUN mix local.hex --force && \
mix archive.install hex phx_new 1.4.3 --force && \
mix local.rebar --force

RUN mix archive.install hex phx_new 1.4.5

WORKDIR /srv
