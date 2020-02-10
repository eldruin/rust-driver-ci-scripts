set -euxo pipefail

cargo tarpaulin -v --ciserver travis-ci --coveralls $TRAVIS_JOB_ID || cargo coveralls --verbose
