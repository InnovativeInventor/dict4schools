# Just edit this if you want to change the blacklist strength
blacklist="blacklists/blacklist_full.txt"

echo "Checking blacklists"
cd blacklists
bash blacklistcheck.sh
cd ../

echo "Compiling safedict_simple.txt and safedict_complex.txt"
echo "Progress:"
pv sources/2of12.txt -i 1 | LC_ALL=C fgrep -i -F -w -v -f $blacklist | tee safedict_simple.txt >> safedict_full_temp.txt &
pv sources/eff_wordlist.txt -i 1 | LC_ALL=C fgrep -i -F -w -v -f $blacklist | tee safedict_simple.txt >> safedict_full_temp.txt &
pv sources/english-words/words_alpha.txt -i 1 | LC_ALL=C fgrep -i -F -w -v -f $blacklist | tee safedict_complex.txt  >> safedict_full_temp.txt &
wait
echo "Compiling safedict_full.txt"
sort -u safedict_full_temp.txt > safedict_full.txt

rm safedict_full_temp.txt
rm "*.xz"
xz -k safedict_full.txt &
xz -k safedict_complex.txt &
xz -k safedict_simple.txt &
wait
mv safedict_full.txt.xz compressed/safedict_full.txt.xz
mv safedict_complex.txt.xz compressed/safedict_complex.txt.xz
mv safedict_simple.txt.xz compressed/safedict_simple.txt.xz

echo "Done!"
