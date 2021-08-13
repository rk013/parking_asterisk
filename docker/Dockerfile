FROM centos:centos7.9.2009

LABEL maintainer="Alexandr Shander <alexmasc05@gmail.com>"

COPY otgrepo.repo /etc/yum.repos.d/

RUN rpm --import https://mirror.ps.kz/epel/RPM-GPG-KEY-EPEL-7 && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum install -y epel-release && \
    yum install -y asterisk-13.37.0 asterisk-sip-13.37.0 \
    asterisk-curl-13.37.0 asterisk-mp3-13.37.0 asterisk-ael-13.37.0 \
    asterisk-lua-13.37.0 asterisk-sqlite-13.37.0 asterisk-voicemail-13.37.0 \
    asterisk-devel-13.37.0 asterisk-pjsip-13.37.0 \
    && yum clean all

WORKDIR /

ENV ASTSAFE_FOREGROUND=True

ENTRYPOINT ["/usr/sbin/safe_asterisk"]

CMD ["start"]
