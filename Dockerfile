FROM centos:6.6
MAINTAINER Hector Vergara <hvergara@gmail.com>

RUN yum install -y wget tar sudo bzip2 rpm-build logrotate git
RUN sed -i "s/requiretty/\!requiretty/" /etc/sudoers

RUN mkdir -p /home/vagrant
RUN git clone https://github.com/telefonicaid/fiware-orion.git /home/vagrant/fiware-orion

WORKDIR /home/vagrant/fiware-orion
RUN sh ./scripts/bootstrap/centos65.sh

RUN make install

EXPOSE 1026
CMD service mongod start && contextBroker -fg