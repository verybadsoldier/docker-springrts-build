cd /spring/build

rm -rf buildoptions.txt || true
touch ./buildoptions.txt
echo "MYARCHTUNE=$MYARCHTUNE" >> ./buildoptions.txt
echo "MYCFLAGS=$MYCFLAGS" >> ./buildoptions.txt
echo "MYRWDIFLAGS=$MYRWDIFLAGS" >> ./buildoptions.txt
echo "$MYCXX_FLAGS" >> ./buildoptions.txt
