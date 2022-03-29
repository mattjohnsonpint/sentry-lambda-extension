#!/bin/bash
set -eux

cat >> "$(pwd)/target/sentry-lambda-extension" << EOF
#!/bin/bash
set -eux
echo "I am the extension"
EOF

chmod +x "$(pwd)/target/sentry-lambda-extension"