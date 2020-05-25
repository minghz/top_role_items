FROM elixir:1.9

RUN mkdir app/
COPY . /app

WORKDIR app/

RUN mix local.hex --force
RUN mix do compile
