#!/bin/sh
set -e

REPO="https://github.com/xizheyin/reachsec"
TMPDIR=$(mktemp -d)
CHECKOUT_DIR="$TMPDIR/reachsec"

echo "Cloning reachsec..."
git clone --recurse-submodules "$REPO" "$CHECKOUT_DIR"

echo "Installing reachsec..."
cargo install --path "$CHECKOUT_DIR" --bin reachsec

echo "Installing nightly toolchain..."
rustup toolchain install nightly-2025-08-09
rustup component add rustc-dev llvm-tools-preview --toolchain nightly-2025-08-09

echo "Installing call-cg4rs..."
cargo +nightly-2025-08-09 install --path "$CHECKOUT_DIR/callgraph4rs" --force

rm -rf "$TMPDIR"

echo ""
echo "Installation complete. Run 'reachsec check --path .' to get started."
