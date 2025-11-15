FROM debian:latest

RUN apt-get update && apt-get install -y bash cowsay fortune-mod netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*
ENV PATH="/usr/games:${PATH}"
WORKDIR /app
COPY ./wisecow/wisecow.sh /app
RUN chmod +x /app/wisecow.sh
EXPOSE 4499
ENTRYPOINT [ "/app/wisecow.sh" ]
