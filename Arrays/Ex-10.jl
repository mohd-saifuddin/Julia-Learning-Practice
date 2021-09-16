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


