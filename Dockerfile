FROM ubuntu:22.04

RUN apt-get update && apt-get install -y jq

COPY inference_stub.sh /inference_stub.sh
RUN chmod +x /inference_stub.sh

ENTRYPOINT ["/inference_stub.sh"]

