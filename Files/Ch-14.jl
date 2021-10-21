function walk(dirname)
    for name in readdir(dirname)
        path = joinpath(dirname, name)
        if isfile(path)
            println(path)
        else
            walk(path)
        end
    end
end

dirname = homedir() * "/Desktop/Julia-Learning-Practice/"
println(dirname)
walk(dirname)


# Ex 14.2

function sed(pstr, rstr, f1, f2)
    try
        f1data = read(f1, String)
        f1data = replace.(f1data, pstr => rstr)
        f2file = open(f2, "w")
        write(f2file, f1data)
        close(f2file)
    catch exc
        println("Root cause ⤑ $exc")
    finally
        println("Success!")
    end
end

pstr = "Sapians"
rstr = "Humans"
f1 = "file1.txt"
f2 = "file2.txt"
sed(pstr, rstr, f1, f2)
