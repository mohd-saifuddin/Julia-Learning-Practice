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
