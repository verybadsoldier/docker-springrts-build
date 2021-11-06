echo "Copying artficats to publish dir: '${PUBLISH_DIR}'..."

cp "${BUILD_DIR}/${bin_name}" "${BUILD_DIR}/${dbg_name}" "${BUILD_DIR}/buildoptions.txt" "${PUBLISH_DIR}"
