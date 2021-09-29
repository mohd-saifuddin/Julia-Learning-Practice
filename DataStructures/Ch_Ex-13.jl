# Ch-13 & Ex-13


# Ex 13.1

function ex13_1()
    file = open("ch13testfile.txt", "r")
    for line in eachline(file)
        newstr = ""
        for char in lowercase(line)
            if isletter(char)
                newstr *= char
            else
                continue
            end
        end
        println("\"$line\" --> \"$newstr\"")
    end
    close(file)
end

ex13_1()
