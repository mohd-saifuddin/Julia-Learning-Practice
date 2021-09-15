function flattening(arr)
	rst = Any[]
	grab(seq) = for ele in seq 
					if isa(ele, Array) 
						grab(ele) 
					else 
						push!(rst, ele) 
					end
				end
	grab(arr)
	return rst
end

arr = [1, [1], [1, 1, [1]], [[1]], 1]

@show flattening(arr)

@time flattening(arr)



