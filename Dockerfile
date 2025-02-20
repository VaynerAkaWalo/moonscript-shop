FROM openresty/openresty:alpine

RUN apk add --no-cache lua5.1 luarocks5.1 lua5.1-dev openssl-dev gcc musl-dev make git

RUN luarocks-5.1 install lpeg
RUN luarocks-5.1 install lapis
RUN luarocks-5.1 install moonscript
RUN luarocks-5.1 install pgmoon
RUN luarocks-5.1 install luabitop

WORKDIR /app

COPY . .

EXPOSE 8080

CMD lapis migrate && lapis server development
