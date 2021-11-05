cd /

BASE_DIR=spring

# Do not use git depth parameter cause git describe later will not work as expected

git config --global user.name  "BAR Docker Spring Engine"
git config --global user.email "bar@springrts.de"

rm -rf "${BASE_DIR}"

SPRING_URL="https://github.com/${GITHUB_SPRING_USER}/spring"

echo "---------------------------------"
echo "Cloning SpringRTS from: ${SPRING_URL}"
echo "Using branch: ${BRANCH_NAME}"
echo "---------------------------------"

git clone --recursive "${SPRING_URL}" -b "${BRANCH_NAME}" "${BASE_DIR}"

cd "${BASE_DIR}"

#git fetch --tags --all
git clone "https://github.com/${GITHUB_AUX_USER}/mingwlibs64.git" mingwlibs64

cd AI/Skirmish/BARb
git clone -b profile "https://github.com/${GITHUB_AUX_USER}/BARbarIAn.git" profile
