BUILDDIR="/spring/build"
rm $BUILDDIR/${{ steps.pack-artifacts.outputs.bin_name }}
rm $BUILDDIR/${{ steps.pack-artifacts.outputs.dbg_name }}
rm -rf $BUILDDIR/bin-dir
find $BUILDDIR -type f -iname "*.a" -delete
find $BUILDDIR -type f -iname "*.dbg" -delete
CLEANLIST_LIN=$(find $BUILDDIR -maxdepth 1 -name '*.so')" "$(find $BUILDDIR -maxdepth 1 -name 'spring*' -executable)" "$(find $BUILDDIR -maxdepth 1 -name 'pr-downloader')" "$(find $BUILDDIR/AI/Skirmish -name libSkirmishAI.so)" "$(find $BUILDDIR/AI/Interfaces -name libAIInterface.so)
CLEANLIST_WIN=$(find $BUILDDIR -maxdepth 1 -name '*.dll')" "$(find $BUILDDIR -maxdepth 1 -name '*.exe')" "$(find $BUILDDIR/AI/Skirmish -name SkirmishAI.dll)" "$(find $BUILDDIR/AI/Interfaces -name AIInterface.dll)" "$(find $BUILDDIR -name pr-downloader_shared.dll)
CLEANLIST=$CLEANLIST_LIN" "$CLEANLIST_WIN
rm -f $CLEANLIST || true