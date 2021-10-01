# Ch-13 & Ex-13

juliadir = "/home/msaifuddin/Desktop/Julia-Learning-Practice/"

# Ex 13.1

function ex13_1()
    file = open(juliadir * "testfile.txt", "r")
    for line in eachline(file)
        newstr = ""
        for char in lowercase(line)
            if isletter(char)
                newstr *= char
            else
                continue
            end
        end
        println("\"$line\" --> \"$newstr\"")
    end
    close(file)
end

ex13_1()


# Ex 13.2

function getallwordsfrombook()
    file = open(juliadir * "alice_wonderland.txt", "r")
    lines = readlines(file)
    close(file)
    newlines = []
    for line in lines
        append!(newlines, split(line))
    end
    allwords = []
    for word in newlines
        newword = ""
        for char in lowercase(word)
            if isletter(char)
                newword *= char
            else
                continue
            end
        end
        push!(allwords, newword)
    end
    return allwords
end

function wordhistogram(allwords)
    hist = Dict()
    for word in allwords
        hist[word] = get(hist, word, 0) + 1
    end
    return hist
end

allwords = getallwordsfrombook()
println(length(allwords))
println(wordhistogram(allwords))


# Ex 13.3

function get20most(hist, num::Int64=20)
    hist = reverse(sort(collect(hist), by=x->x[2]))
    for (word, freq) in hist[begin:num]
        println(word, "\t", freq)
    end
end

allwords = getallwordsfrombook()
hist = wordhistogram(allwords)
num = 10
get20most(hist, num)


# Ex 13.4

function wordstoarr()
    wordlist = []
    for word in eachline(juliadir * "words.txt")
        push!(wordlist, word)
    end
    return wordlist
end

function ex13_4(uniquewords, wordlist)
    for word in uniquewords
        if word ∉ wordlist
            println(word)
        end
    end
end

allwords = getallwordsfrombook()
uniquewords = keys(wordhistogram(allwords))
wordlist = wordstoarr()
ex13_4(uniquewords, wordlist)


# Ex 13.5

function choosefromhist(hist)
    temparr = []
    for (word, freq) in hist
        for i in 1:freq
            push!(temparr, word)
        end
    end
    return rand(temparr)
end

allwords = getallwordsfrombook()
hist = wordhistogram(allwords)
println(choosefromhist(hist))


# EX 13.6

function bookwordstodict()
    allwords = getallwordsfrombook()
    bookdict = Dict()
    for word in allwords
        bookdict[word] = nothing
    end
    return bookdict
end

function wordstodict()
    worddict = Dict()
    for line in eachline(juliadir * "words.txt")
        worddict[line] = nothing
    end
    return worddict
end

function subtract(d1, d2)
    return setdiff(d1, d2)
end

d1 = bookwordstodict()
d2 = wordstodict()
println(subtract(d1, d2))
