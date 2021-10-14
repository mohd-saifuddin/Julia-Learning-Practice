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

