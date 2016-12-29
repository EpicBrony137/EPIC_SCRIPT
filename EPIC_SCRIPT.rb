$vars = Hash.new

def objid(thing)
	# NOT TESTED
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
		return "Error 0001: Varible not found or not an object"
	end
end

class ESFuctions

	def print(object)
		# NOT TESTED
		if objid(object) == "string"
			puts object.gsub('\"', '"').gsub('"', "")
		elsif objid(object) == "array"
			for a in 0..(object.split(", ").length)
				if object.split(", ").at(a).chars.first == '"'
					if object.split(", ").at(a).chars.last == '"'
						puts object.split(", ").at(a).gsub('\"', '"').gsub('"', "")
					end
				end
			end
		elsif objid(object) == "variable"
			newobject = $vars[object]
			if objid(newobject) == "string"
				puts newobject.gsub('\"', '"').gsub('"', "")
			elsif objid(newobject) == "array"
				for a in 0..(newobject.split(", ").length)
					if newobject.split(", ").at(a).chars.first == '"'
						if newobject.split(", ").at(a).chars.last == '"'
							puts newobject.split(", ").at(a).gsub('\"', '"').gsub('"', "")
						end
					end
				end
			end
		end
	end

	def var(var)
		nameandobj = var.split(" = ")
		if objid(nameandobj.at(1)) == "variable"
			$vars.store(nameandobj.at(0), $vars[nameandobj.at(1)])
		else
			$vars.store(nameandobj.at(0), nameandobj.at(1))
		end
	end

#	def cal(eq)
#		# NOT TESTED
#		expresa = eq.split(/[+\-*/]/)
#		expresb = eq.split(/[^+\-*/]/)
#		expresd = Array.new
#		for c in 0..(expresa.length - 1)
#			expresd.push(expresa.at(i) + " " + expresb.at(i) + " ")
#		end
#		# ONLY SPITS OUT THE EQUASHION, NOT THE AWNSER YET, MIGHT HAVE TO USE eval()
#		puts expresd.join("")
#	end

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
				ESFuctions.var(line.sub("var ", ""))
			end
		end
	end

end
