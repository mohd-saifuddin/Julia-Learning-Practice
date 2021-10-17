# Ch-12 & Ex-12

include("./../julialearndir.jl")

using .JuliaLearnDir


function printall(args...)
    println(args)
end

printall(1, 2.0, '3')


# Ex 12.1

function sumall(args...)
    return sum(args)
end

println(sumall(1, 2, 3, 4))


function hasmatch(t1, t2)
    for (x, y) in zip(t1, t2)
        if x == y
            return true
        end
    end
    return false
end

t1 = [1, 2, 3]
t2 = [4, 5, 3]
println(hasmatch(t1, t2))

t1 = [1, 2, 3]
t2 = [1, 5, 6]
println(hasmatch(t1, t2))

t1 = [1, 2, 3]
t2 = [4, 2, 6]
println(hasmatch(t1, t2))

t1 = [1, 2, 3]
t2 = [4, 5, 6]
println(hasmatch(t1, t2))


# Ex 12.2

function readthestoryfile()
    pattern = r"[\[\] .,/`~!@#$%^&*()-_=+{}:;''\"<>?|\\]"
    alicedata = ""
    for line in eachline(getjuliadir() * "Textfiles/alice_wonderland.txt")
        alicedata *= replace.(lowercase(line), pattern => "")
    end
    return alicedata
end

function histogram(str)
    d = Dict()
    for c in str
        d[c] = get(d, c, 0) + 1
    end
    return d
end

function mostfrequent(strdata)
    datadict = histogram(strdata)
    datadict = reverse(sort(collect(datadict), by=x->x[2]))
    for (letter, freq) in datadict
        println("$letter $freq")
    end
end

strdata = readthestoryfile()
mostfrequent(strdata)


# Ex 12.3.1, Ex 12.3.2

function wordstodict()
    worddict = Dict()
    for line in eachline(getjuliadir() * "Textfiles/words.txt")
        if line ∉ keys(worddict)
            worddict[line] = nothing
        end
    end
    return worddict
end

function isanagram(word1, word2)
    if word1 == word2
        return false
    else
        pattern = r"[\[\] .,/`~!@#$%^&*()-_=+{}:;''\"<>?|\\]"
        word1 = collect(replace.(lowercase(word1), pattern => ""))
        word2 = collect(replace.(lowercase(word2), pattern => ""))
        if sort(word1) == sort(word2)
            return true
        else
            return false
        end
    end
end

function allanagramns(wordarr)
    anagramdict = Dict()
    for word1 in wordarr
        anagramslist = []
        for word2 in wordarr
            if isanagram(word1, word2)
                push!(anagramslist, word2)
            else
                continue
            end
        end
        if length(anagramslist) ≥ 1
            anagramdict[word1] = anagramslist
        end
    end
    anagramdict = reverse(sort(collect(anagramdict), by=x->length(x[2])))
    return anagramdict
end

l = 1
h = 15000
wordarr = collect(keys(wordstodict()))[l:h]
println(allanagramns(wordarr))
