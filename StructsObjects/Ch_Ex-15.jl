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


mutable struct MPoint
    x
    y
end

function movepoint!(p, dx, dy)
    p.x += dx
    p.y += dy
    return nothing
end

origin = MPoint(0.0, 0.0)
println(origin)
movepoint!(origin, 1, 2)
println(origin)


"""
Represents a rectangle.

fields: `width`, `height`, `corner`.
"""
struct Rectangle
    width
    height
    corner
end

function moverectangle!(rect, dx, dy)
    return movepoint!(rect.corner, dx, dy)
end

width = 100.0
height = 200.0
corner = MPoint(0.0, 0.0)
box = Rectangle(width, height, corner)
println(box)

dx = 1.0
dy = 2.0
moverectangle!(box, dx, dy)
println(box)

dx = 10.0
dy = 20.0
moverectangle!(box, dx, dy)
println(box)


findcenter(rect) = Point(((rect.corner.x + rect.width) ÷ 2), ((rect.corner.y + rect.height) ÷ 2))

width = 100.0
height = 200.0
corner = MPoint(10.0, 20.0)
rect = Rectangle(width, height, corner)
println(rect)
center = findcenter(rect)
println(center)


# Ex 15.2

mp1 = MPoint(1.0, 2.0)
mp2 = deepcopy(mp1)
println(mp1 ≡ mp2)
println(mp1 == mp2)

p1 = Point(1.0, 2.0)
p2 = deepcopy(p1)
println(p1 ≡ p2)
println(p1 == p2)


# Ex 15.3

struct Circle
    center
    radius
end

center = Point(150, 100)
radius = 75
c1 = Circle(center, radius)
println(c1)

function pointincircle(circle, point)
    distance = distancebetweenpoints(circle.center, point)
    println(distance)
    return circle.radius == distance
end

point = Point(5, 4)
center = Point(1, 1)
radius = 5
circle = Circle(center, radius)

println(pointincircle(circle, point))

point = Point(5, 4)
center = Point(0, 0)
radius = 5
circle = Circle(center, radius)

println(pointincircle(circle, point))

point = Point(2, 2)
center = Point(1, 1)
radius = 5
circle = Circle(center, radius)

println(pointincircle(circle, point))
