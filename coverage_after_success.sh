set -euxo pipefail
# cargo coveralls --verbose
cargo tarpaulin --ciserver travis-ci --coveralls $TRAVIS_JOB_ID
