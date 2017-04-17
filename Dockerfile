FROM alpine:3.5

ENV KOTLIN_VERSION   1.1.1
ENV PATH             /kotlinc/bin:$PATH

RUN set -x \
    && apk update \
    && apk --no-cache add \
        bash \
        openjdk8-jre \
        wget \
    && apk --no-cache add --virtual .builddeps \
        curl \
        unzip \
    && curl -sL -o out.zip https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip \
    && unzip out.zip \
    ## cleanup
    && rm out.zip \
    && apk del .builddeps