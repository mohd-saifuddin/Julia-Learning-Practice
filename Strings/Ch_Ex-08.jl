my_banana_char = '🍌'
println(typeof(my_banana_char))
my_banana_string = "🍌"
println(typeof(my_banana_string))

fruits = "🍌 🍎 🍐"
println("LENGTH of fruits: ", length(fruits))
println(fruits[length(fruits)])
println("SIZE of fruits: ", sizeof(fruits))
println(nextind(fruits, 1))
println(nextind(fruits, 5))
println(nextind(fruits, 6))

println("1. String Banana SIZE: ", sizeof("🍌"))
println("2. Char Banana SIZE: ", sizeof('🍌'))

println("3. String Banana LENGTH: ", length("🍌"))
println("4. Char Banana LENGTH: ", length('🍌'))

println("5. String I SIZE: ", sizeof("I"))
println("6. Char I SIZE: ", sizeof('I'))

println("7. String I LENGTH: ", length("I"))
println("8. Char I LENGTH: ", length('I'))

statement = "I seek 🍌 growth!"
if length(statement) == sizeof(statement)
    println("Equal")
    println("$statement", " ", length(statement), " ", sizeof(statement))
else
    println("Not Equal")
    println("LENGTH: ", length(statement))
    println("SIZE: ", sizeof(statement))
end

listjl = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
println(length(listjl))
println(sizeof(listjl))

listjl = [1]
println(length(listjl))
println(sizeof(listjl))

f_index = firstindex(fruits)
while f_index <= sizeof(fruits)
    letter = fruits[f_index]
    println(letter)
    global f_index = nextind(fruits, f_index)
end
println(f_index)

f_index = firstindex(fruits)
while f_index <= length(fruits)
    letter = fruits[f_index]
    println(letter)
    global f_index = nextind(fruits, f_index)
end
println(f_index)

for letter in fruits
    println(letter)
end


prefixes = "JKLMNOPQ"
suffix = "ack"

for prefix in prefixes
    if prefix == 'O' || prefix == 'Q'
        println(prefix * "u" * suffix)
    else
        println(prefix * suffix)
    end
end

str_var = "Julius Caesar"
println("1. ", str_var)
println("2. ", str_var[1:6])
println("3. ", str_var[:6])     # first argument is not mandatory, the statement returns 6th character
# println("4. ", str_var[8:])   # last argument is mandatory, throws an error
println("5. ", str_var[8:end])
println("6. ", str_var[8:6])    # returns an empty string ("")
println("7. ", str_var[:])      # returns a complete string

#=
`find` function present in the Julia text ebook.

function find(word, letter)
    index = firstindex(word)
    while index <= sizeof(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end
    return -1
end

word = "banana"
letter = 'n'
println(find(word, letter))
=#

function find(word, letter, index)
    while index <= sizeof(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end
    return -1
end

word = "banana"
letter = 'n'
index = 4
println(find(word, letter, index))

x² = 1
println(x²)

x₂ = 2
println(x₂)

println(x² == x₂)


function customcount(word, letter, index)
    counter = 0
    while index <= sizeof(word)
        if word[index] == letter
            counter = counter + 1
        end
        index = nextind(word, index)
    end
    return counter
end

word = "🍌🍌🍌🍌 🐒 🍌🍌🍌🍌"
letter = '🍌'
index = 1
println(customcount(word, letter, index))

# println("na" ∈ "banana") # ∈ works only for characters
println('a' ∈ "banana")

str = "Hello, World!"
for char in str
    println("$char --> $(typeof(char))")
end


function inboth(word1, word2)
    for letter ∈ word1
        if letter ∈ word2
            print(letter, " ")
        end
    end
    println()
end
println()

inboth("apples", "oranges")
println()


function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end
    i = firstindex(word1)
    j = lastindex(word2)
    while j >= 0 && i <= length(word1)
        @show i, j
        if word1[i] != word2[j]
            return false
        end
        i = nextind(word1, i)
        j = prevind(word2, j)
    end
    return true
end

word1 = "stop"
word2 = "pots"
println(isreverse(word1, word2))


function ispalindrome(word)
    return word == word[end:-1:begin]
end

word = "Hello"
println(ispalindrome(word))

word = "racecar"
println(ispalindrome(word))


function rotateword(word, num)
    rotatedword = ""
    for letter in word
        rotatedword = rotatedword * Char(Int(letter) + num)
    end
    return rotatedword
end

word = "HAL"
num = 1
println(rotateword(word, num))

word = "cheer"
num = 7
println(rotateword(word, num))

