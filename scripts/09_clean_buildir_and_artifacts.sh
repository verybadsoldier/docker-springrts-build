set -e

rm "${BUILD_DIR}/${bin_name}"
rm "${BUILD_DIR}/${dbg_name}"
rm -rf "${BUILD_DIR}/bin-dir"
find "${BUILD_DIR}" -type f -iname "*.a" -delete
find "${BUILD_DIR}" -type f -iname "*.dbg" -delete
CLEANLIST_LIN=$(find "${BUILD_DIR}" -maxdepth 1 -name '*.so')" "$(find "${BUILD_DIR}" -maxdepth 1 -name 'spring*' -executable)" "$(find "${BUILD_DIR}" -maxdepth 1 -name 'pr-downloader')" "$(find "${BUILD_DIR}/AI/Skirmish" -name libSkirmishAI.so)" "$(find "${BUILD_DIR}/AI/Interfaces" -name libAIInterface.so)
CLEANLIST_WIN=$(find "${BUILD_DIR}" -maxdepth 1 -name '*.dll')" "$(find "${BUILD_DIR}" -maxdepth 1 -name '*.exe')" "$(find "${BUILD_DIR}/AI/Skirmish" -name SkirmishAI.dll)" "$(find "${BUILD_DIR}/AI/Interfaces" -name AIInterface.dll)" "$(find "${BUILD_DIR}" -name pr-downloader_shared.dll)
CLEANLIST=$CLEANLIST_LIN" "$CLEANLIST_WIN
rm -f $CLEANLIST || true