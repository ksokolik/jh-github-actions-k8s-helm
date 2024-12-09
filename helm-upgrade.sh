#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
if [ -d "${cs}-${suffix}" ]; then
helm dep up ./${cs}-${suffix}
helm upgrade --install ${cs} ./${cs}-${suffix} --namespace jh-github-actions
fi
helm dep up ./jhgithubactions-${suffix}
helm upgrade --install jhgithubactions ./jhgithubactions-${suffix} --namespace jh-github-actions


