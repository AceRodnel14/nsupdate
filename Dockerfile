FROM ubuntu:latest

RUN apt -y update && apt -y upgrade
RUN apt -y install wget dnsutils

COPY bindupdate.sh /bin/bindupdate.sh

CMD ["/bin/bash", "bindupdate.sh"]
#ENTRYPOINT ["/bin/bash", "/bin/bindupdate.sh"]
