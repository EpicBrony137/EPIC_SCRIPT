filename = gets.chomp
file = File.open(filename, "a+")
filea = IO.readlines file
for i in 0..filea.length
    line = filea.at(i)
    puts line
    puts line.split.at(0)
    if line.split.at(0) == "print"
        puts line.sub("print", "")
    end
end
