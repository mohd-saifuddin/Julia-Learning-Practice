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
    juliadir = "/home/msaifuddin/Desktop/Julia-Learning-Practice/"
    pattern = r"[\[\] .,/`~!@#$%^&*()-_=+{}:;''\"<>?|\\]"
    alicedata = ""
    for line in eachline(juliadir * "alice_wonderland.txt")
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
    datadict = reverse(sort(collect(datadict), by = x -> x[2]))
    for (letter, freq) in datadict
        println("$letter $freq")
    end
end

strdata = readthestoryfile()
mostfrequent(strdata)
