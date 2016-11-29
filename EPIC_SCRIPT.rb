$vars = Hash.new

def objid(thing)
	if thing.chars.first == '"'
		if thing.chars.last == '"'
			return "string"
		end
	elsif thing.chars.first == '['
		if thing.chars.last == ']'
			return "array"
		end
	elsif $vars.has_key?(thing) == True
		return "variable"
	else 
		return "error 0002: Varible not found or not an object"
	end
end

class ESFuctions
	
	def print(object)
		# NOT TESTED
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
	
	def var(var)
		nameandobj = var.split(" = ")
		$vars.store(nameandobj.at(0), nameandobj.at(1))
	end
	
	def cal(eq)
		# NOT TESTED
		expresa = eq.split(/[+\-*/]/)
		expresb = eq.split(/[^+\-*/]/)
		expresd = Array.new
		for c in 0..(expresa.length - 1)
			expresd.push(expresa.at(i) + " " + expresb.at(i) + " ")
		end
		# ONLY SPITS OUT THE EQUASHION, NOT THE AWNSER YET, MIGHT HAVE TO USE eval()
		puts expresd.join("")
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
				ESFuctions.cal(line.sub("cal ", ""))
			elsif line.split.at(0) == "var"
				ESFuctions.var(line.sub("var ", "")))
			end
		end
	end
	
end

