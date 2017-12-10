cat blacklist_light.txt > blacklist_check_medium.txt
cat blacklist_medium.txt >> blacklist_check_medium.txt
sort blacklist_check_medium.txt | uniq -d > blacklist_medium.txt

cat blacklist_medium.txt > blacklist_check_full.txt
cat blacklist_full.txt >> blacklist_check_full.txt
sort blacklist_check_full.txt | uniq -d > blacklist_full.txt

rm blacklist_check_medium.txt
rm blacklist_check_full.txt

echo "Done checking blacklists!"
