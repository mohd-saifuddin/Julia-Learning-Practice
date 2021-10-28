using Printf


"""
Represents the time of the day.

fields: hour, minute, second
"""
struct MyTime
    hour
    minute
    second
end

time = MyTime(11, 59, 30)
println(time)


# Ex 16.1

function printtime(time)
    @printf "%02d:%02d:%02d\n" time.hour time.minute time.second
end

time = MyTime(11, 59, 9)
printtime(time)


# Ex 16.2

function isafter(t1, t2)
    return (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second)
end

t1 = MyTime(12, 0, 0)
printtime(t1)
t2 = MyTime(11, 59, 59)
printtime(t2)

println(isafter(t1, t2))
