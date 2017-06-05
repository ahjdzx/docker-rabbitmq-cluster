FROM rabbitmq:3.6.10-management
MAINTAINER xin.zhangwebapi@ele.me

RUN rabbitmq-plugins enable --offline rabbitmq_sharding

COPY rabbitmq-cluster /usr/local/bin/
COPY pre-entrypoint.sh /

EXPOSE 5672 15672 25672 4369 9100 9101 9102 9103 9104 9105
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster"]
