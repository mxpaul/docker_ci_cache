ARG BINARY_PATH_BUILD=/tmp/checkpg

FROM golang:1.16.5 as appbuild
ARG BINARY_PATH_BUILD
WORKDIR /code
COPY . .
RUN make EXECUTABLE=$BINARY_PATH_BUILD build

FROM gruebel/upx:latest as upx
ARG BINARY_PATH_BUILD
COPY --from=appbuild $BINARY_PATH_BUILD $BINARY_PATH_BUILD
#RUN /usr/bin/upx --brute $BINARY_PATH_BUILD
RUN /usr/bin/upx $BINARY_PATH_BUILD

FROM scratch
ARG BINARY_PATH_BUILD
COPY --from=upx $BINARY_PATH_BUILD /checkpg
CMD [ "/checkpg" ]

