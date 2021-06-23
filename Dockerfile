FROM debian:stable-slim

RUN apt-get update -y \
  && apt-get install -y curl gnupg \
  && gpg --keyserver keyserver.ubuntu.com --recv-keys FE3348877809386C

ENV LITECOIN_VERSION=0.18.1

RUN curl -so litecoin-core.tar.gz https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
  && curl -so litecoin-signatures.asc https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-linux-signatures.asc \
  && gpg --verify litecoin-signatures.asc \
  && grep $(sha256sum litecoin-core.tar.gz | awk '{ print $1 }') litecoin-signatures.asc \
  && tar -xzf litecoin-core.tar.gz -C /usr/local/bin

ENV PATH="/usr/local/bin/litecoin-${LITECOIN_VERSION}/bin:${PATH}"

VOLUME ["/opt/litecoin"]

EXPOSE 9332 9333 19332 19333 19444

CMD ["litecoind"]