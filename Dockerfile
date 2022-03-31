FROM lambci/lambda-base-2:build

WORKDIR /work

# install rust toolchain
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y

ENV PATH=/root/.cargo/bin:$PATH

COPY . .

#RUN cargo build --release --locked --target=x86_64-unknown-linux-gnu
