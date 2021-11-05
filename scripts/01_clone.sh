set -e

cd /

BASE_DIR=spring

# Do not use git depth parameter cause git describe later will not work as expected

git config --global user.name  "BAR Docker Spring Engine"
git config --global user.email "bar@springrts.de"

rm -rf "${BASE_DIR}"

git clone --recursive "${SPRING_URL}"/spring -b "${BRANCH_NAME}" "${BASE_DIR}"

cd "${BASE_DIR}"

#git fetch --tags --all
git clone "${AUX_URL}"/mingwlibs64.git mingwlibs64

cd AI/Skirmish/BARb
git clone -b profile "${AUX_URL}"/BARbarIAn.git profile
