## Origins
This is was created from the 12dict project by Alan Beale and dwyl/english-words. Only blacklisted words were removed.

## Blacklist strengths
Light - Removes all obscene words and profanity.

Medium - Removes all negative slang, derogatory phrases, profanity, and references to dangerous items (substances, weapons, etc). Will not remove words that might be offensive.

Full - Removes anything remotely controversial, including all references to religion, and everything included in medium. In addition, any word not suitable for a baby is removed. All potentially offensive words are removed. In addition, any nuisance words (like one-letter entries except for 'a' and 'i') will be removed.

## dict4schools strengths
Simple has words that an ordinary person would know.
Complex has most words in the English language (not including coined words)
Full is a combination of simple and complex, with repeats taken out.

## Compiling
Just run `bash blacklist.sh` in the dict4schools folder (make sure you've got all of the submodules). Make sure you have `pv` installed.

## Extras
For spellcheckers (such as in Vim), use `spell/en.utf-8.add` which contains the full dict4schools list. An example config is as follows:

```
set spelllang=en
set spellfile=~/git/dict4schools/spell/en.utf-8.add
setlocal spell
```

## Credits & Contributions
Contributions are always welcome! Just submit a pull request or create a new issue. This is in use in some projects, and any new additions to improve dict4schools are welcome.

Too many friends and strangers have helped in the creation of the blacklist to name.
[tsbuilderboy](https://github.com/tsbuilderboy) added the vast majority of the blacklist words.
