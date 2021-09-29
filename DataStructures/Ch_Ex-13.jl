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
    hist = reverse(sort(collect(hist), by = x -> x[2]))
    return hist
end

allwords = getallwordsfrombook()
println(length(allwords))
println(wordhistogram(allwords))


# Ex 13.3

function get20most(hist, num = 20)
    i = 1
    for (word, freq) in hist[begin:num]
        println(word, "\t", freq)
        i += 1
    end
end

allwords = getallwordsfrombook()
hist = wordhistogram(allwords)
num = 10
get20most(hist, num)
