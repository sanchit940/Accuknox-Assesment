FROM debian:latest

RUN apt update && apt install -y bash cowsay fortune netcat-openbsd
ENV PATH="$PATH:/usr/games"
WORKDIR /app

COPY ./wisecow/wisecow.sh /app


RUN chmod +x /app/wisecow.sh
EXPOSE 4499
ENTRYPOINT [ "/app/wisecow.sh" ]
