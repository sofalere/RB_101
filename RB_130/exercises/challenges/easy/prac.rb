class Talk
	def say(input: $stdin, output: $stout)
		output.puts "hey there"
		input.gets.chomp
	end
end

# Talk.new.say