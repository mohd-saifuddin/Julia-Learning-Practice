using Printf
using Dates


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


function timetoint(time)
    minutes = (time.hour * 60) + time.minute
    seconds = (minutes * 60) + time.second
    return seconds
end

function inttotime(seconds)
    (minutes, second) = divrem(seconds, 60)
    (hour, minute) = divrem(minutes, 60)
    return MyTime(hour, minute, second)
end

time = MyTime(11, 59, 234232)
seconds = timetoint(time)
time = inttotime(seconds)
@printf "%02d:%02d:%02d --> %d\n" time.hour time.minute time.second seconds
@printf "%d --> %02d:%02d:%02d\n" seconds time.hour time.minute time.second


# Ex 16.6

function multime(time, number)
    seconds = timetoint(time) * number
    return inttotime(seconds)
end

time = MyTime(1, 1, 1)
number = 11
printtime(multime(time, number))

function calculate_pace(finishtime, miles)
    return multime(finishtime, 1/miles)
end

finishtime = MyTime(1, 20, 40)
miles = 10
pace = calculate_pace(finishtime, miles)
@printf "Average pace to travel %.2f miles is %02d:%02d:%02d\n" miles pace.hour pace.minute pace.second


# Ex 16.7

function printdayofweek()
    println("Current date: $(Date(now()))")
    println("Day of the week: $(dayofweek(now()))")
end

printdayofweek()


function timenextbrithday(bday)
    println("\nBirthday: $(Date(bday))")
    current = now()
    nbday = DateTime(year(current)+1, month(bday), day(bday))
    println("Next birthday: $(Date(nbday))")
    age = year(current) - year(bday)
    println("Age: $(age)")
    difference = (nbday - current).value
    a_second = (1 / 1000)
    a_minute = (1 / 60) * a_second
    an_hour = (1 / 60) * a_minute
    a_day = (1 / 24) * an_hour
    daysleft = difference * a_day
    println("Days left: $(round(Int, daysleft))")
    hoursleft = difference * an_hour
    println("Hours left: $(round(Int, hoursleft))")
    minutesleft = difference * a_minute
    println("Minutes left: $(round(Int, minutesleft))")
    secondsleft = difference * a_second
    println("Seconds left: $(round(Int, secondsleft))")
end

bday = DateTime(1998, 10, 3)
timenextbrithday(bday)
