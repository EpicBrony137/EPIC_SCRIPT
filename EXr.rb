require_relative 'EPIC_SCRIPT.rb'

filename = gets.chomp
exr = EPICSCRIPT.new(filename)

exr.exe
