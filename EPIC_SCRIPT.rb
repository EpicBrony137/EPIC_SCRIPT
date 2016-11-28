class ESFuctions
	
	def print(object)
		if object.chars.first == '"'
			if object.chars.last == '"'
				puts object.gsub('\"', '"').gsub('"', "")
			else
				puts "Error 0001: print can only use a string or array"
			end
		elsif object.chars.first == '['
			if object.chars.last == ']'
				for a in 0..(object.split(", ").length)
					if object.split(", ").at(a).chars.first == '"'
						if object.split(", ").at(a).chars.last == '"'
							puts object.split(", ").at(a).gsub('\"', '"').gsub('"', "")
						end
					end
				end
			else
				puts "Error 0001: print can only use a string or array"
			end
		else
			puts "Error 0001: print can only use a string or array"
		end
	end
	
end

class EPICSCRIPT
	
	def initialize(filename)
		@filename = filename
	end
	
	def exe
		file = File.open(@filename, "a+")
		filea = IO.readlines file
		for i in 0..(filea.length - 1)
			line = filea.at(i)
			if line.split.at(0) == "print"
				ESFuctions.print(line.sub("print ", ""))
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
	end
	
end

