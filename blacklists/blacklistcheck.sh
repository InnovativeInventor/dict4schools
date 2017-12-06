cat blacklist_light.txt > blacklist_check_medium.txt
cat blacklist_medium.txt >> blacklist_check_medium.txt
sort -u blacklist_check_medium.txt > blacklist_medium.txt

cat blacklist_medium.txt > blacklist_check_full.txt
cat blacklist_full.txt >> blacklist_check_full.txt
sort -u blacklist_check_full.txt > blacklist_full.txt

rm blacklist_check_medium.txt
rm blacklist_check_full.txt

echo "Done checking blacklists!"
