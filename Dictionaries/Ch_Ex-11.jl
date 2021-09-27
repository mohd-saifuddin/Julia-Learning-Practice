# Ch-11 & Ex-11

function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    return d
end

function printhist(h)
    h_keys = sort(collect(keys(h)))
    for c in h_keys
        println(c, " ", h[c])
    end
end

s = "freedom"
h = histogram(s)
println(h)
printhist(h)


function reverselookup(d, v)
    for k in keys(d)
        if d[k] == v
            return k
        end
    end
    error("LookupError")
end

s = "freedom"
h = histogram(s)
v = 1
println(reverselookup(h, v))

s = "freedom"
h = histogram(s)
v = 2
println(reverselookup(h, v))

s = "freedom"
h = histogram(s)
v = 1
println(findall(isequal(v), h))

s = "freedom"
h = histogram(s)
v = 3
println(findall(isequal(v), h))


function invertdict_1(d)
    inverse = Dict()
    for key in keys(d)
        val = d[key]
        if val ∉ keys(inverse)
            inverse[val] = [key]
        else
            push!(inverse[val], key)
        end
    end
    return inverse
end

s = "freedomss"
h = histogram(s)
println(h)
println(invertdict_1(h))

function invertdict_2(d)
    inverse = Dict()
    for val in unique(values(d))
        inverse[val] = findall(isequal(val), d)
    end
    return inverse
end

s = "freedomss"
h = histogram(s)
println(h)
println(invertdict_2(h))


known = Dict(0 => 0, 1 => 1)

function fibonacci(n)
    if n >= 0
        if n ∈ keys(known)
            return known[n]
        else
            res = fibonacci(n-1) + fibonacci(n-2)
            known[n] = res
            return res
        end
    else
        return nothing
    end
end

n = 10
println(fibonacci(n))

n = -1
println(fibonacci(n))


# Ex 11.2

function wordstodict()
    path = "/home/msaifuddin/Desktop/Julia-Learning-Practice"
    worddict = Dict()
    for line in eachline(path * "/words.txt")
        if line ∉ keys(worddict)
            worddict[line] = 1
        end
    end
    return worddict
end

function checkthekey(worddict, targetkey)
    return targetkey ∈ keys(worddict)
end

function wordstoarr()
    path = "/home/msaifuddin/Desktop/Julia-Learning-Practice"
    arr = []
    for line in eachline(path * "/words.txt")
        push!(arr, line)
    end
    return arr
end

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

worddict = wordstodict()
targetkey = "zymurgy"
println(checkthekey(worddict, targetkey))
println("Search Dict")
@time checkthekey(worddict, targetkey)

worddict = wordstodict()
targetkey = "aa"
println(checkthekey(worddict, targetkey))
println("Search Dict")
@time checkthekey(worddict, targetkey)

worddict = wordstodict()
targetkey = "lion"
println(checkthekey(worddict, targetkey))
println("Search Dict")
@time checkthekey(worddict, targetkey)

worddict = wordstodict()
targetkey = "sketch"
println(checkthekey(worddict, targetkey))
println("Search Dict")
@time checkthekey(worddict, targetkey)

worddict = wordstodict()
targetkey = "abcdefghij"
println(checkthekey(worddict, targetkey))
println("Search Dict")
@time checkthekey(worddict, targetkey)

arr = wordstoarr()
target = "zymurgy"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))
println("Search Array")
@time inbisect(arr, target, low, high)

arr = wordstoarr()
target = "aa"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))
println("Search Array")
@time inbisect(arr, target, low, high)

arr = wordstoarr()
target = "lion"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))
println("Search Array")
@time inbisect(arr, target, low, high)

arr = wordstoarr()
target = "sketch"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))
println("Search Array")
@time inbisect(arr, target, low, high)

arr = wordstoarr()
target = "abcdefghij"
low = firstindex(arr)
high = lastindex(arr)
println(inbisect(arr, target, low, high))
println("Search Array")
@time inbisect(arr, target, low, high)


# Ex 11.4

known_ack = Dict()

function ack(m, n)
    if (m, n) ∈ keys(known_ack)
        return known_ack[(m, n)]
    else
        if m == 0
            result = n + 1
            known_ack[(m, n)] = result
            return result
        elseif m > 0 && n == 0
            result = ack(m-1, 1)
            known_ack[(m, n)] = result
            return result
        elseif m > 0 && n > 0
            result = ack(m-1, ack(m, n-1))
            known_ack[(m, n)] = result
            return result
        end
    end
end

l = 0
h = 3
for m in l:h
    for n in l:h
        println(ack(m, n))
    end
end

println(known_ack)
