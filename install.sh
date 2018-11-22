set -exo pipefail

main() {
    rustup component add rust-src
    SYSROOT=$(rustc --print sysroot)
    if [[ ! "$SYSROOT" =~ "$TARGET" ]]; then
        rustup target add $TARGET
    else
        echo "Target $TARGET is already installed"
    fi

    if [ ! -z $ENABLE_CLIPPY ]; then
        rustup component add clippy-preview
    fi
}

main
