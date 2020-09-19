rg --line-regexp "[A-Z]*[a-z]*" ../spell/en.dic >> ~/.aspell.en.pws
COUNT=$(wc -l < ~/.aspell.en.pws)
ACTUAL=$((COUNT - 1))
echo "Actual length: $ACTUAL, file length: $COUNT"
