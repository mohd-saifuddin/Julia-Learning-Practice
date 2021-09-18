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


