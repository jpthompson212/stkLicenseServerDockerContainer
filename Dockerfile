FROM centos:centos7
LABEL maintainer="support@agi.com"

ARG INSTALL_PATH=/usr/local/bin

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
ENV PATH="${PATH}:/usr/local/bin/daemon/NetworkDaemon/FLEXlm/v11.16/LINUX_2_6_INTEL/"

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
RUN yum update -y  && \
    yum install -y redhat-lsb-core

ADD daemon.tar.Z ${INSTALL_PATH}

#########################################
##              VOLUMES                ##
#########################################
VOLUME [ "/var/flexlm" ]

#########################################
##            EXPOSE PORTS             ##
#########################################
EXPOSE 2080
EXPOSE 27000-27009

ENTRYPOINT ["lmgrd", "-z", "-c", "/var/flexlm"]