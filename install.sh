#!/bin/sh
set -e

echo "Installing reachsec..."
cargo install reachsec

echo "Installing nightly toolchain..."
rustup toolchain install nightly
rustup component add rustc-dev llvm-tools-preview --toolchain nightly

echo "Installing call-cg4rs..."
cargo +nightly install call-cg4rs

echo ""
echo "Installation complete. Run 'reachsec check --path .' to get started."
