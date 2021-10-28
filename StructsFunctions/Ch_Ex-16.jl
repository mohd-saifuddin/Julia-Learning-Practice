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
