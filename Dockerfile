FROM mariadb:12

# Dummy Dockerfile for learning: we don't care about credentials security
ENV MARIADB_ROOT_PASSWORD=123

RUN apt update -y && apt upgrade -y && apt install neovim

EXPOSE 3306
