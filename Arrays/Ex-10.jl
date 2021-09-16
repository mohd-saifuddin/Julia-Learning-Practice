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
