FROM debian:10
RUN mkdir /BeamMP
WORKDIR /BeamMP
RUN apt-get update && apt-get install -y --no-install-recommends liblua5.3 libz-dev rapidjson-dev libcurl4-openssl-dev curl wget ca-certificates

RUN curl -s https://api.github.com/repos/BeamMP/BeamMP-Server/releases/latest | grep "browser_download_url.*BeamMP-Server.*" | cut -d : -f 2,3 | tr -d \" | wget -O /BeamMP/BeamMP-Server -i -

RUN chmod +x BeamMP-Server

EXPOSE 30814/tcp
EXPOSE 30814/udp


ENTRYPOINT ["/BeamMP/BeamMP-Server"]
