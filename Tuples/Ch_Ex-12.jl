function printall(args...)
    println(args)
end

printall(1, 2.0, '3')


# Ex 12.1

function sumall(args...)
    return sum(args)
end

println(sumall(1, 2, 3, 4))
