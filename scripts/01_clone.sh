UBUNTU_VER=20.04

# Do not use git depth parameter cause git describe later will not work as expected

git config --global user.name  "Docker SpringRTS Build"
git config --global user.email "springbuild@springrts.de"

rm -rf "${SPRING_DIR}"

SPRING_URL="https://github.com/${GITHUB_SPRING_USER}/spring"

echo "---------------------------------"
echo "Cloning SpringRTS from: ${SPRING_URL}"
echo "Using branch: ${BRANCH_NAME}"
echo "---------------------------------"

git clone --recursive "${SPRING_URL}" -b "${BRANCH_NAME}" "${SPRING_DIR}"

cd "${SPRING_DIR}"

if [ "${PLATFORM}" == "windows-64" ]; then
    git clone "https://github.com/${GITHUB_AUX_USER}/mingwlibs64.git" mingwlibs64
elif [ "${PLATFORM}" == "linux-64" ]; then
    git clone https://github.com/${GITHUB_AUX_USER}/spring-static-libs.git -b $UBUNTU_VER spring-static-libs
else
    echo "Unsupported platform: '${PLATFORM}'"
    exit 1
fi

cd AI/Skirmish/BARb
git clone -b profile "https://github.com/${GITHUB_AUX_USER}/BARbarIAn.git" profile
