# Ch-11 and Ex-11

function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    return d
end

s = "Truth is freedom!"
println(histogram(s))
