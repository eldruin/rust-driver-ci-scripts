set -euxo pipefail

cargo install cargo-tarpaulin || echo "cargo-tarpaulin already installed"
cargo install cargo-update    || echo "cargo-update already installed"
#cargo install cargo-travis   || echo "cargo-travis already installed"
cargo install-update -a
