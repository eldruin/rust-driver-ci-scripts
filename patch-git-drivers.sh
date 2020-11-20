for DRIVER in $DRIVERS;
do
    sed -i "s/$DRIVER\s*=\s*\"[0-9|.]*\"/$DRIVER = \{ git = \"https:\/\/github.com\/eldruin\/$DRIVER-rs\" \}/g" Cargo.toml
done