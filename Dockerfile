FROM mumez/pharo-vnc-supervisor
LABEL maintainer="Masashi Umezawa <ume@softumeya.com>"

ARG SCYPHERGRAPH_DIR=/root/scyphergraph
ARG REPOS_URL=github://mumez/SCypherGraph:main/src

RUN setup.sh && \
    save-pharo.sh metacello install ${REPOS_URL} BaselineOfSCypherGraph && \
    cp -r /root/data ${SCYPHERGRAPH_DIR}

RUN cp /root/build/libseabolt17.so ${SCYPHERGRAPH_DIR}

# Or you can download libseabolt17.so from the official seabolt repository
# RUN wget https://github.com/neo4j-drivers/seabolt/releases/download/v1.7.4/seabolt-1.7.4-Linux-ubuntu-16.04.tar.gz  && \
#    tar xvfz seabolt-1.7.4-Linux-ubuntu-16.04.tar.gz --strip-components=1 -C / && \
#    ln -s /usr/local/lib/libseabolt17.so ${SCYPHERGRAPH_DIR}/libseabolt17.so

ENV PHARO_HOME=${SCYPHERGRAPH_DIR}
VOLUME [ "${SCYPHERGRAPH_DIR}","/root/tmp" ]

COPY ./config/startup.st ${SCYPHERGRAPH_DIR}/config/
ENV PHARO_START_SCRIPT=${SCYPHERGRAPH_DIR}/config/startup.st