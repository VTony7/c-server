FROM ubuntu:20.04 AS build-env
USER root
COPY . /app/
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils build-essential locales && \
    localedef -f UTF-8 -i C C.UTF-8
ENV LANG C.UTF-8
ENV TZ UTC
ENV TERM xterm

#RUN apt-get install -y vim less
RUN make && rm server.o server.d

FROM alpine:latest
COPY --from=build-env /app /app
WORKDIR /app
ENTRYPOINT ["./server"]
CMD ["/"]
