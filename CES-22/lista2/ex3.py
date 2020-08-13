def test(bool):
    print(bool)
    return bool


def cleanword(str):
    return ''.join(ch for ch in str if ch.isalnum())


def has_dashdash(str):
    for i in range(len(str)-1):
        if str[i] == '-' and str[i+1] == '-':
            return True
    return False


def extract_words(str):
    return [cleanword(wrd).lower() for wrd in str.split()]


def wordcount(wrd, lst):
    return sum([1 if wrd == lstelem else 0 for lstelem in lst])


def wordset(lst):
    lst.sort()
    i=0
    j=len(lst)
    while i<j-1:
        if lst[i+1] == lst[i]:
            lst.pop(i)
        else:
            i+=1
        j = len(lst)
    return lst


def longestword(lst):
    lens = [len(string) for string in lst]
    if len(lens) > 0:
        return max([len(string) for string in lst])
    return 0


test(cleanword("what?") == "what")
test(cleanword("'now!'") == "now")
test(cleanword("?+='w-o-r-d!,@$()'") == "word")

test(has_dashdash("distance--but"))
test(not has_dashdash("several"))
test(has_dashdash("spoke--"))
test(has_dashdash("distance--but"))
test(not has_dashdash("-yo-yo-"))

test(extract_words("Now is the time! 'Now', is the time?\nYes, now.") ==['now','is','the','time','now','is','the','time','yes','now'])
test(extract_words("she tried to curtsey as she spoke--\nfancy") ==['she','tried','to','curtsey','as','she','spoke','fancy'])

test(wordcount("now",["now","is","time","is","now","is","is"]) == 2)
test(wordcount("is",["now","is","time","is","now","the","is"]) == 3)
test(wordcount("time",["now","is","time","is","now","is","is"]) == 1)
test(wordcount("frog",["now","is","time","is","now","is","is"]) == 0)

test(wordset(["now", "is", "time", "is", "now", "is","is"]) ==["is", "now", "time"])
test(wordset(["I", "a", "a", "is", "a", "is", "I", "am"])==["I", "a", "am", "is"])
test(wordset(["or", "a", "am", "is", "are", "be", "but","am"]) ==["a", "am", "are", "be", "but", "is", "or"])

test(longestword(["a", "apple", "pear", "grape"]) == 5)
test(longestword(["a", "am", "I", "be"]) == 2)
test(longestword(["this","supercalifragilisticexpialidocious"]) == 34)
test(longestword([ ]) == 0)