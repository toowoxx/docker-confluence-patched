from atlassian/confluence:7.12.2

run mkdir /tmp/patch
workdir /tmp/patch

run apt update && apt install -y zip

run curl https://confluence.atlassian.com/doc/files/1077906215/1077916296/2/1629936383093/cve-2021-26084-update.sh > workaround-patch.sh
run chmod +x workaround-patch.sh

run sed -i -e 's/^INSTALLATION_DIRECTORY=.*$/INSTALLATION_DIRECTORY=\/opt\/atlassian\/confluence/' workaround-patch.sh
run ./workaround-patch.sh 

workdir /
run rm -rf /tmp/patch

