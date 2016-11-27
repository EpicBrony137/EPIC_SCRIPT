filename = gets.chomp
file = File.open(filename, "a+")
filea = IO.readlines file
for i in 0..(filea.length - 1)
    line = filea.at(i)
    if line.split.at(0) == "print"
        if line.sub("print ", "").chars.first == '"'
            if line.sub("print ", "").chars.last == '"'
                puts line.sub("print ", "")
            else
                puts "Error 1: print can only use a string or array"
            end
        elsif line.sub("print ", "").chars.first == '['
            if line.sub("print ", "").chars.last == ']'
                puts line.sub("print ", "").split(", ").join("\n") 
            else
                puts "Error 1: print can only use a string or array"
            end
        end
    elsif line.split.at(0) == "cal"
        expres = line.sub("cal ", "")
        expresa = line.split(/[+\-*/]/)
        expresb = line.split(/[^+\-*/]/)
        expresd = Array.new
        for c in 0..(expresa.length - 1)
            expresd.push(expresa.at(i) + " " + expresb.at(i) + " ")
        end
        puts expresd.join("")
    end
end
