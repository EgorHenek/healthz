FROM rust:1.70 as build

WORKDIR /app
COPY . /app
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=build /app/target/release/healthz /
COPY Rocket.toml .
CMD ["./healthz"]
