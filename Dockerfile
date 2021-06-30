FROM golang:1.16.5 as appbuild
WORKDIR /code
CMD [ "/checkpg" ]
COPY . .
RUN make EXECUTABLE=/checkpg build

#FROM gruebel/upx:latest as upx
#ARG BINARY_PATH_BUILD
#COPY --from=appbuild $BINARY_PATH_BUILD $BINARY_PATH_BUILD
##RUN /usr/bin/upx --brute $BINARY_PATH_BUILD
#RUN /usr/bin/upx $BINARY_PATH_BUILD

FROM scratch
COPY --from=appbuild  /checkpg /checkpg
CMD [ "/checkpg" ]

