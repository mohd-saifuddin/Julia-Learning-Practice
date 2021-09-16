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



