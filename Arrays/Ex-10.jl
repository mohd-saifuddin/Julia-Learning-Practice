# Ex 10.1

function nestedsum(arr)
    rst = Any[]
    grab(seq) = for ele in seq
                    if isa(ele, Array)
                        grab(ele)
                    else
                        push!(rst, ele)
                    end
                end
    grab(arr)
    return sum(rst)
end

arr = [1, [1], [1, 1, [1]], [[1]], 1]
println(nestedsum(arr))


# Ex 10.2

function cumulsum(arr)
    rst = Any[]
    cumsum = 0
    for ele in arr
        cumsum += ele
        push!(rst, cumsum)
    end
    return rst
end

arr = collect(1:1:10)
println(cumulsum(arr))


# Ex 10.3

function interior(arr)
    return arr[firstindex(arr)+1:lastindex(arr)-1]
end

arr = collect(1:1:10)
println(arr)
println(interior(arr))
println(arr)


# Ex 10.4

function interior!(arr)
    deleteat!(arr, firstindex(arr))
    deleteat!(arr, lastindex(arr))
    return nothing
end

arr = collect(1:1:10)
println(arr)
println(interior!(arr))
println(arr)


# Ex 10.5

function issort(arr)
    if length(arr) ≤ 1
        return true
    elseif arr[1] <= arr[2]
        issort(arr[2:end])
    else
        return false
    end
end

arr = []
println(issort(arr))

arr = [1]
println(issort(arr))

arr = [1, 2, 3, 4, 4, 5, 10]
println(issort(arr))

arr = [21, 2, 1, 4]
println(issort(arr))

arr = ['a', 'b', 'v', 'z']
println(issort(arr))


# Ex 10.6

function isanagram(str1, str2)
    pattern = r"[\[\] .,/`~!@#$%^&*()-_=+{}:;''\"<>?|\\]"
    str1 = collect(replace.(lowercase(str1), pattern => ""))
    str2 = collect(replace.(lowercase(str2), pattern => ""))
    if sort(str1) == sort(str2)
        return true
    else
        return false
    end
end

str1 = "A Decimal point!"
str2 = "I'm a dot in place."
println(isanagram(str1, str2))


# Ex 10.7

function hasduplicates(arr)
    if length(arr) ≤ 1
        return false
    else
        sort!(arr)
        if arr[1] == arr[2]
            return true
        else
            deleteat!(arr, 1)
            return hasduplicates(arr)
        end
    end
end

arr = [1, 2, 3, 4, 5, 6, 7, 5, 1, 8]
println(hasduplicates(arr))

arr = collect(1:1:10)
println(hasduplicates(arr))

arr = []
println(hasduplicates(arr))

arr = [42]
println(hasduplicates(arr))


# Ex 10.8

function birthday_paradox(n_students, classrooms)
    random_brithdays() = [rand(1:365) for i in range(1, length=n_students)]
    duplicate_birth_count = 0
    for i in range(1, length=classrooms)
        if hasduplicates(random_brithdays())
            duplicate_birth_count += 1
        end
    end
    probability = round((duplicate_birth_count / classrooms) * 100, digits=5)
    println("In $classrooms classrooms with $n_students students, around $probability% students have same birthdays.")
end

n_students = 23
classrooms = 1000
birthday_paradox(n_students, classrooms)


# EX 10.9

function wordstoarrpush()
    juliadir = "/home/msaifuddin/Desktop/Julia-Learning-Practice/"
    arr = []
    for line in eachline(juliadir * "words.txt")
        push!(arr, line)
    end
    return arr
end

@time wordstoarrpush()

function wordstoarridiom()
    juliadir = "/home/msaifuddin/Desktop/Julia-Learning-Practice/"
    arr = []
    for line in eachline(juliadir * "words.txt")
        arr = [arr..., line]
    end
    return arr
end

# @time wordstoarridiom()


# Ex 10.10

function inbisect(arr, target, low, high)
    if low > high
        return false
    elseif low == high
        if arr[low] == target
            return true
        else
            return false
        end
    else
        mid = (low + high) ÷ 2
        if arr[mid] == target
            return true
        elseif arr[mid] < target
            low = mid + 1
            inbisect(arr, target, low, high)
        else
            high = mid - 1
            inbisect(arr, target, low, high)
        end
    end
end

arr = wordstoarrpush()
target = "zymurgy"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))

arr = wordstoarrpush()
target = "aa"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))

arr = wordstoarrpush()
target = "lion"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))

arr = wordstoarrpush()
target = "sketch"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))

arr = wordstoarrpush()
target = "tricks"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))

arr = wordstoarrpush()
target = "abcdefghij"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))


# Ex 10.11

function reversepairs()
    wordarr = wordstoarrpush()
    i = low = firstindex(wordarr)
    n = high = lastindex(wordarr)
    reversepair_count = 0
    while i <= n
        target = wordarr[i][end:-1:begin]
        if inbisect(wordarr, target, low, high)
            println(wordarr[i], " ==> ", target)
            reversepair_count += 1
        end
        i += 1
    end
    println(reversepair_count)
end

reversepairs()


# Ex 10.12.1

function interlock2words(word1, word2)
    interlocked = ""
    size_of_word1 = length(word1)
    size_of_word2 = length(word2)
    if size_of_word1 ≥ size_of_word2
        i = 1
        while i ≤ size_of_word2
            interlocked *= (word1[i] * word2[i])
            i += 1
        end
        interlocked *= word1[i:end]
    elseif size_of_word1 ≤ size_of_word2
        i = 1
        while i ≤ size_of_word1
            interlocked *= (word1[i] * word2[i])
            i += 1
        end
        interlocked *= word2[i:end]
    else
        return nothing
    end
    return interlocked
end

word1 = "shoe"
word2 = "cold"
println(interlock2words(word1, word2))

word1 = "SolarSystem"
word2 = "BlackHole"
println(interlock2words(word1, word2))

word1 = "Milyway"
word2 = "Andromeda"
println(interlock2words(word1, word2))

function findallinterlock2words()
    interlocked_count = 0
    wordarr = wordstoarrpush()
    low = firstindex(wordarr)
    high = lastindex(wordarr)
    for word1 in wordarr
        for word2 in wordarr
            target = interlock2words(word1, word2)
            if inbisect(wordarr, target, low, high)
                interlocked_count += 1
                println(word1, " + ", word2, " = ", target)
            end
        end
    end
    println(interlocked_count)
end

# findallinterlock2words()
