# scyphergraph-vnc-supervisor

A Docker image for running SCypherGraph with VNC and supervisord.
It is an exmaple of how to customize 'pharo-vnc-supervisor' Docker image.

## Usages

- Run the container: `bash run.sh`
- Open your web browser and access: http://127.0.0.1:6901/?password=vncpassword
- Connect to existing Neo4j via [SCypherGraph](https://github.com/mumez/SCypherGraph) classes (this container does not include Neo4j itself).
