FROM centos:6.6
MAINTAINER Hector Vergara <hvergara@gmail.com>

ADD build.sh /tmp/build.sh
RUN sh /tmp/build.sh

EXPOSE 1026
CMD service mongod start && contextBroker -fg
