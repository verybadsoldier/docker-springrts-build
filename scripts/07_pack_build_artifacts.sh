cd /spring/build

tag_name_short="{${BRANCH_NAME}\}"$(git describe --abbrev=7)
tag_name="{${BRANCH_NAME}}"$(git describe --abbrev=7)_windows-64
bin_name=spring_bar_$tag_name-minimal-portable.7z
dbg_name=spring_bar_$tag_name-minimal-symbols.tgz
echo "::set-output name=tag_name_short::$tag_name_short"
echo "::set-output name=tag_name::$tag_name"
echo "::set-output name=bin_name::$bin_name"
echo "::set-output name=dbg_name::$dbg_name"
cd ./bin-dir
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ../$bin_name ./* -xr\!*.dbg
touch empty.dbg
DEBUGFILES=$(find ./ -name '*.dbg')
tar cvfz ../$dbg_name ${DEBUGFILES}