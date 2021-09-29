juliadir = "/home/msaifuddin/Desktop/Julia-Learning-Practice/"

fin = open(juliadir * "words.txt")
word = readline(fin)
println(word, sizeof(word), length(word))
word = readline(fin)
println(word, sizeof(word), length(word))

# for line in eachline("words.txt")
#     println(line)
# end


# 9.1

function morethan20()
    for line in eachline(juliadir * "words.txt")
        if sizeof(line) > 20
            println(line)
        end
    end 
end

# morethan20()
# println()


# 9.2

function hasno_e(word_or_line)
    return 'e' ∉ lowercase(word_or_line)
end

word_or_line = "apple"
println(hasno_e(word_or_line))

word_or_line = "applE"
println(hasno_e(word_or_line))

word_or_line = "appl"
println(hasno_e(word_or_line))
println()

function calculate_no_e_percentage()
    total_lines = countlines(juliadir * "words.txt")
    count_hasno_e = 0
    for line in eachline(juliadir * "words.txt")
        if hasno_e(line)
            count_hasno_e = count_hasno_e + 1
        end
    end
    println(count_hasno_e)
    percentage_no_e = round((count_hasno_e / total_lines) * 100; digits = 2)
    return "$percentage_no_e%"
end

# println(calculate_no_e_percentage())
# println()


# 9.3

function avoids(word, forbidden)
    for letter in word
        if letter ∈ forbidden
            return false
        end
    end
    return true
end

function word_forbidden()
    print("Enter 'forbidden' charaters: "); forbidden = readline()
    count_not_forbidden = 0
    for line in eachline(juliadir * "words.txt")
        if avoids(line, forbidden)
            count_not_forbidden = count_not_forbidden + 1
        end
    end
    return count_not_forbidden
end

# println(word_forbidden())
# println()


# 9.4

function useonly(word, beingused)
    for letter in word
        if letter ∉ beingused
            return false
        end
    end
    return true
end

function word_usedby()
    print("Enter 'available' characters: "); beingused = readline()
    for line in eachline(juliadir * "words.txt")
        if useonly(line, beingused)
            println(line)
        end
    end
end

# word_usedby()
# println()


# 9.5

function useall(word, required)
    useonly(required, word)
end

function word_usedbyall()
    print("Enter 'required' characters: "); required = readline()
    count_usedbyall = 0
    for line in eachline(juliadir * "words.txt")
        if useall(line, required)
            println(line)
            count_usedbyall = count_usedbyall + 1
        end
    end
    println(count_usedbyall)
end

# word_usedbyall()
# println()


# 9.6

function isabecedarian(word)
    if length(word) ≤ 1
        return true
    end
    i = firstindex(word)
    j = nextind(word, i)
    if word[i] > word[j]
        return false
    end
    isabecedarian(word[j:end])
end

function alphabetical_words()
    for line in eachline(juliadir * "words.txt")
        if isabecedarian(line)
            println(line)
        end
    end
end

# alphabetical_words()


# 3 Consecutive Doubles

function consecutive_3_doubles()
    for line in eachline(juliadir * "words.txt")
        i = firstindex(line)
        n = lastindex(line)
        duo_count = 0
        while i < n
            if line[i] == line[i+1]
                duo_count += 1
                if duo_count == 3
                    println(line)
                end
                i += 2
            else
                duo_count = 0
                i += 1
            end
        end
    end
end

consecutive_3_doubles()
println()
