FROM amd64/rust:alpine 

ARG BUILD_ARCH=x86_64
ENV BUILD_ARCH=${BUILD_ARCH}

ENV BUILD_TARGET=${BUILD_ARCH}-unknown-linux-musl

RUN apk add musl-dev

WORKDIR /work

COPY . .

# BUILD IT!
RUN cargo build --release --locked --target=${BUILD_TARGET}
