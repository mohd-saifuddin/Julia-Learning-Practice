# function histogram(s)
#     d = Dict()
#     for c in s
#         if c ∉ keys(d)
#             d[c] = 1
#         else
#             d[c] += 1
#         end
#     end
#     return d
# end

# s = "Truth is freedom!"
# println(histogram(s))

# h = histogram("ae")
# println(h)
# println(get(h, 'a', 0))
# println(get(h, 'e', 0))

function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    return d
end

s = "Truth is freedom!"
println(histogram(s))
