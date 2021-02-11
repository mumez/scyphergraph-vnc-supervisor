FROM mumez/pharo-vnc-supervisor
LABEL maintainer="Masashi Umezawa <ume@softumeya.com>"

ARG SCYPHERGRAPH_DIR=/root/scyphergraph
ARG REPOS_URL=github://mumez/SCypherGraph:main/src

RUN setup.sh && \
    save-pharo.sh metacello install ${REPOS_URL} BaselineOfSCypherGraph && \
    cp -r /root/data ${SCYPHERGRAPH_DIR}

RUN wget https://github.com/mumez/SmallBolt/releases/download/stable/libseabolt17.so && \
    chmod a+x libseabolt17.so && \
    cp libseabolt17.so ${SCYPHERGRAPH_DIR}

# RUN wget https://github.com/neo4j-drivers/seabolt/releases/download/v1.7.4/seabolt-1.7.4-Linux-ubuntu-16.04.tar.gz  && \
#    tar xvfz seabolt-1.7.4-Linux-ubuntu-16.04.tar.gz --strip-components=1 -C /

ENV PHARO_HOME=${SCYPHERGRAPH_DIR}
VOLUME [ "${SCYPHERGRAPH_DIR}","/root/tmp" ]

COPY ./config/startup.st ${SCYPHERGRAPH_DIR}/config/
ENV PHARO_START_SCRIPT=${SCYPHERGRAPH_DIR}/config/startup.st