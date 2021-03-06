#!/bin/bash
set -euo pipefail

OUTPUT_DIR=./target/bin/release

mkdir -p $OUTPUT_DIR
INPUT=./target/thumbv8m.main-none-eabi/release/v1026-demo-app
IMAGE_NAME="v1026-demo-app"
cargo +nightly build --release --target=thumbv8m.main-none-eabi
arm-none-eabi-size $INPUT
arm-none-eabi-objcopy -O ihex $INPUT $OUTPUT_DIR/${IMAGE_NAME}.hex
arm-none-eabi-objdump -tC $INPUT > $OUTPUT_DIR/${IMAGE_NAME}.sym
arm-none-eabi-objdump -dC $INPUT > $OUTPUT_DIR/${IMAGE_NAME}.S
arm-none-eabi-objcopy -O binary $INPUT $OUTPUT_DIR/${IMAGE_NAME}.bin
