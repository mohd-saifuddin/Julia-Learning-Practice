# Ch-13 & Ex-13

using Plots

include("./../julialearndir.jl")

using .JuliaLearnDir


# Ex 13.1

function ex13_1()
    file = open(getjuliadir() * "Textfiles/testfile.txt", "r")
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
    file = open(getjuliadir() * "Textfiles/alice_wonderland.txt", "r")
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
    for word in eachline(getjuliadir() * "Textfiles/words.txt")
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
    for line in eachline(getjuliadir() * "Textfiles/words.txt")
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


# Ex 13.8 - Markvov Analysis

readthebook(fileloc) = [word for line in eachline(fileloc) for word in split(line)]

function makepairs(booklist)
    pairs = []
    for current in 1:length(booklist)-1
        push!(pairs, (booklist[current], booklist[current+1]))
    end
    return pairs
end

function constructlookup(pairs)
    lookup = Dict()
    for (word1, word2) in pairs
        if word1 ∈ keys(lookup)
            push!(lookup[word1], word2)
        else
            lookup[word1] = [word2]
        end
    end
    return lookup
end

function inputthemodel(booklist)
    firstword = rand(booklist)
    while islowercase(first(firstword))
        firstword = rand(booklist)
    end
    return firstword
end

function markovmodel(lookup, firstword, howmany=20)
    markovchain = [firstword]
    for count in 1:howmany
        push!(markovchain, rand(lookup[markovchain[end]]))
    end
    predictedsentence = join(markovchain, " ")
    return predictedsentence
end

fileloc = getjuliadir() * "Textfiles/emma.txt"
lookup = fileloc |> readthebook |> makepairs |> constructlookup
firstword = fileloc |> readthebook |> inputthemodel
howmany = rand(50:75)
predictedsentence = markovmodel(lookup, firstword, howmany)
println(predictedsentence)


# Ex 13.9 Zipf's Law

function cleanthewords(allwords)
    allwordsmodifiled = []
    pattern = r"[\[\] .,/`~!@#$%^&*()=+{}:;'\"<>?|\\]"
    for word in allwords
        append!(allwordsmodifiled, split.(lowercase(word), pattern))
    end
    filter!(x->x≠"", allwordsmodifiled)
    return allwordsmodifiled
end

function zipfstructure(hist)
    hist = reverse(sort(collect(hist), by=x->x[2]))
    zipflist = []
    rank = 1
    for (word, freq) in hist
        push!(zipflist, (word, log(rank), log(freq)))
        rank += 1
    end
    return zipflist
end

function zipfprinter(zipflist, num::Int64=20)
    f = firstindex(zipflist)
    l = lastindex(zipflist)
    println()
    for zipf in zipflist[f:num]
        println(zipf)
    end
    println()
    for zipf in zipflist[l-num:l]
        println(zipf)
    end
end

function plotzipflaw(xs, ys)
    title = "Zipf's Law"
    label = "Frequency"
    size = (1000, 700)
    lw = 3
    labelx = "Rank"
    zipfplot = plot(xs, ys, lw=lw, title=title, label=label, size=size)
    xlabel!(zipfplot, labelx)
    savefig(zipfplot, getjuliadir() * "DataStructures/zipfplot.png")
    println("$title graph saved successfully.")
end

fileloc = getjuliadir() * "Textfiles/zipfexercisebook.txt"
zipflist = fileloc |> readthebook |> cleanthewords |> wordhistogram |> zipfstructure
zipfprinter(zipflist)

xs = getfield.(zipflist, 2)
ys = getfield.(zipflist, 3)
plotzipflaw(xs, ys)
