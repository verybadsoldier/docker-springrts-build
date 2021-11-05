git config --global user.name  "GitHub Action"
git config --global user.email "action@github.com"

git clone --recursive https://github.com/verybadsoldier/spring.git -b BAR105 spring

cd /spring

git fetch --tags --all; \
git clone https://github.com/verybadsoldier/mingwlibs64.git mingwlibs64; \
cd AI/Skirmish/BARb; \
git clone -b profile --single-branch https://github.com/verybadsoldier/BARbarIAn.git profile

cd /spring

if [ -d ./mingwlibs ]; then
        WORKDIR=$(pwd)/mingwlibs
fi
if [ -d ./mingwlibs64 ]; then
        WORKDIR=$(pwd)/mingwlibs64
fi

LIBDIR=$WORKDIR/dll
INCLUDEDIR=$WORKDIR/include
MYARCHTUNE="" #${{ github.event.inputs.archtune-flags }}"
MYCFLAGS="" #${{ github.event.inputs.compilation-flags }}"
MYRWDIFLAGS="" #${{ github.event.inputs.relwithdeb-flags }}"
cmake \
-DCMAKE_TOOLCHAIN_FILE=/my.cmake \
-DMARCH_FLAG="${MYARCHTUNE}" \
-DCMAKE_CXX_FLAGS="${MYCFLAGS}" \
-DCMAKE_C_FLAGS="${MYCFLAGS}" \
-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="${MYRWDIFLAGS}" \
-DCMAKE_C_FLAGS_RELWITHDEBINFO="${MYRWDIFLAGS}" \
-DCMAKE_BUILD_TYPE=RELWITHDEBINFO \
-DAI_TYPES=NATIVE \
-B ./build-windows64/ \
.