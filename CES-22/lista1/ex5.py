def words_until_sam(list):
    n = 0;
    for word in list:
        n += 1
        if word == 'sam':
            return n
    return 0


def test(list):
    print(str(list) + ' => ' + str(words_until_sam(list)))


print("if 'sam' does not occur, returns 0")
test(['apple', 'tree', 'k'])
test(['a', 'b', 'c', 'd'])
test([''])
test([])

test(['f', 'tree', 'k', 'sam'])
test(['sam', 'f', 'tree', 'k'])
test(['f', 'tree', 'sam', 'k'])
test(['', 'sam', 'f', 'tree', 'sam', 'k'])
