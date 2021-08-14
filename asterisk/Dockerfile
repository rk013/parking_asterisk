FROM alexshander/asterisk:18.3-alpine

LABEL maintainer="Alexandr Shander <alexmasc05@gmail.com"

RUN rm -f /etc/asterisk/*
    
COPY --chown=asterisk:asterisk ./configs/ /etc/asterisk

COPY --chown=root:root ./odbc/ /etc/

COPY --chown=asterisk:asterisk entrypoint.sh /

USER asterisk

ENTRYPOINT ["/entrypoint.sh"]
