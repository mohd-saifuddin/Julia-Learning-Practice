struct Point
    x
    y
end

p1 = Point(3, 4)
p2 = Point(4.5, 3.2)
println(p1)
println(p2)
println("$(typeof(p1)), $(typeof(p2))")


# Ex 15.1

function distancebetweenpoints(p1::Point, p2::Point)
    return sqrt((p2.x - p1.x)^2 + (p2.y - p1.y)^2)
end

p1 = Point(5, 4)
p2 = Point(1, 1)
distance = distancebetweenpoints(p1, p2)
println(distance)
