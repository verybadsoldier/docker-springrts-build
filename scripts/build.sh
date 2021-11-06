set -e

. /scripts/00_setup.sh

while getopts b:u:a:p: flag
do
    case "${flag}" in
        b) BRANCH_NAME=${OPTARG};;
        u) GITHUB_SPRING_USER=${OPTARG};;
        a) GITHUB_AUX_USER=${OPTARG};;
        p) PLATFORM=${OPTARG};;
        \:) printf "argument missing from -%s option\n" $OPTARG
            exit 2
            ;;
        \?) printf "unknown option: -%s\n" $OPTARG
            exit 2
            ;;
    esac
done

if [ "${PLATFORM}" != "windows-64" ] && [ "${PLATFORM}" != "linux-64" ]; then
    echo "Unsupported platform: '${PLATFORM}'"
    exit 1
fi

echo "---------------------------------"
echo "Starting buildchain for platform: ${PLATFORM}"
echo "---------------------------------"


. /scripts/01_clone.sh
. "/scripts/02_configure_${PLATFORM}.sh"
. /scripts/03_compile.sh
. /scripts/04_fill_portable_dir.sh
. /scripts/05_fill_debugsymbol_dir.sh
. /scripts/06_fill_build_options_file.sh
. /scripts/07_pack_build_artifacts.sh
. /scripts/08_copy_to_publish_dir.sh
