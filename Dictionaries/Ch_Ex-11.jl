# Ch-11 & Ex-11

function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    return d
end

function printhist(h)
    for c in keys(h)
        println(c, " ", h[c])
    end
end

s = "Freedom!"
h = histogram(s)
printhist(h)

