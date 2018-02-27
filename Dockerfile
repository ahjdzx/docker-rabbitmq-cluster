FROM rabbitmq:3.7.2-management
MAINTAINER xin.zhangwebapi@ele.me

RUN rabbitmq-plugins enable --offline rabbitmq_sharding \
    && rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange \
    && rabbitmq-plugins enable --offline rabbitmq_federation \ 
    && rabbitmq-plugins enable --offline rabbitmq_federation_management \ 
    && rabbitmq-plugins enable --offline rabbitmq_random_exchange \ 
    # && rabbitmq-plugins enable --offline rabbitmq_shovel \ 
    # && rabbitmq-plugins enable --offline rabbitmq_shovel_management \ 
    && rabbitmq-plugins enable --offline rabbitmq_tracing \
    && rabbitmq-plugins enable --offline rabbitmq_event_exchange \ 
    && rabbitmq-plugins enable rabbitmq_mqtt

COPY rabbitmq-cluster /usr/local/bin/
COPY pre-entrypoint.sh /
COPY rabbitmq.conf /etc/rabbitmq/

EXPOSE 5672 15672 25672 4369 9100 9101 9102 9103 9104 9105
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster"]
