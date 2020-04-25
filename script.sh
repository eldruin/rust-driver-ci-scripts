set -exo pipefail

main() {
    export CARGO_OPTIONS="$CARGO_OPTIONS --target $TARGET"
    if [[ ! $TARGET =~ .*linux.* ]]; then
        sed -i "s/linux-embedded-hal/#linux-embedded-hal/g" Cargo.toml
        sed -i "s/embedded-hal-mock/#embedded-hal-mock/g" Cargo.toml
    fi
    sed -i "s/criterion/#criterion/g" Cargo.toml

    if [ ! -z $NO_DEFAULT_FEATURES ]; then
       export CARGO_OPTIONS="$CARGO_OPTIONS --no-default-features"
    fi

    if [ ! -z $FEATURES ]; then
       export CARGO_OPTIONS="$CARGO_OPTIONS --features $FEATURES"
    fi

    cargo check $CARGO_OPTIONS
    cargo build $CARGO_OPTIONS
    if [ -z $DISABLE_EXAMPLES ] && [[ $TARGET =~ .*linux.* ]]; then
        cargo build $CARGO_OPTIONS --examples
    fi
    cargo doc $CARGO_OPTIONS

    if [ -z $DISABLE_TESTS ] && [[ $TARGET =~ .*linux.* ]]; then
        cargo test $CARGO_OPTIONS
    fi

    if [ -z $DISABLE_CLIPPY ] && [[ $TRAVIS_RUST_VERSION =~ .*stable.* ]]; then
        cargo clippy
    fi
}

main
