import sys

blacklist_words = []

with open("blacklists/blacklist_full.txt") as f:
    for each_word in f:
        blacklist_words.append(each_word.rstrip())

for count, each_input in enumerate(sys.stdin):
    if not each_input.rstrip() in blacklist_words:
        print(each_input.rstrip())
        blacklist_words.append(each_input.rstrip())
