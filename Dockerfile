FROM registry.access.redhat.com/ubi8/ubi
 

WORKDIR /pacman 
RUN dnf -y  module install nodejs:18/common 

RUN dnf -y install npm jq  && dnf clean all && npm install mongodb    
 
COPY . /pacman  
RUN chmod -R 777  /pacman
RUN cd frontend && npm install 
 
EXPOSE 8080 
COPY  frontend/pacman.sh /usr/local/bin/
ENTRYPOINT ["pacman.sh"]

