# Just edit this if you want to change the blacklist strength
blacklist="blacklists/blacklist_full.txt"

echo "Checking blacklists"
cd blacklists
bash blacklistcheck.sh
cd ../

echo "Compiling safedict_simple.txt and safedict_complex.txt"
echo "Progress:"
pv sources/2of12.txt | tee safedict_simple_temp.txt >> safedict_full_temp.txt &
pv sources/eff_wordlist.txt | tee safedict_simple_temp.txt >> safedict_full_temp.txt &
pv sources/google-10000-english/20k.txt | tee safedict_simple_temp.txt >> safedict_full_temp.txt &
pv sources/google-10000-english/google-10000-english.txt | tee safedict_simple_temp.txt >> safedict_full_temp.txt &
pv sources/english-words/words_alpha.txt | tee safedict_complex_temp.txt >> safedict_full_temp.txt &
pv sources/personal.txt | tee safedict_complex_temp.txt >> safedict_full_temp.txt &

cat sources/technical.txt >> safedict_uncensored_temp.txt

cat safedict_simple_temp.txt >> safedict_complex_tmp.txt
cat safedict_complex_tmp.txt >> safedict_full_tmp.txt
cat safedict_full_tmp.txt >> safedict_uncensored_tmp.txt

wait
echo "Compiling safedict_full.txt"
sort -u safedict_full_temp.txt | python3 remove.py > safedict_full.txt
sort -u safedict_simple_temp.txt | python3 remove.py > safedict_simple.txt
sort -u safedict_complex.txt | python3 remove.py > safedict_complex.txt
sort -u safedict_uncensored_temp.txt | python3 remove.py > safedict_uncensored.txt

rm *_temp.txt
rm "*.xz"
xz -k safedict_full.txt &
xz -k safedict_complex.txt &
xz -k safedict_simple.txt &
wait
mv safedict_full.txt.xz compressed/safedict_full.txt.xz
mv safedict_complex.txt.xz compressed/safedict_complex.txt.xz
mv safedict_simple.txt.xz compressed/safedict_simple.txt.xz
cp safedict_full.txt spell/en.utf-8.add
cp safedict_full.txt spell/en.dic
cp safedict_uncensored.txt spell/uncensored/en.utf-8.add
cp safedict_uncensored.txt spell/uncensored/en.dic
echo "Done!"
