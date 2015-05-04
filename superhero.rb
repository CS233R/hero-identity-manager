# File.new("txtsuperheros.txt", "a")

def add_hero
	user_input = ''
	i = 0
	hero_collection = [{}]
	loop do
		break if user_input == "q"

		print "Enter your heroes SUPERHERO Identity: "
		user_input = gets.chomp
		hero_collection[i][:super_id] = user_input

		print "Enter your heroes REAL Identity: "
		user_input = gets.chomp
		hero_collection[i][:secret_id] = user_input

		print "Enter your heroes weakness: "
		user_input = gets.chomp
		hero_collection[i][:weakness] = user_input

		# puts %Q|You entered "#{hero_collection[i][:super_id]}" as the superhero, and "#{hero_collection[i][:real_id]}" as the person|
		
		file = File.new("txtsuperheroes.txt", "a")
			hero_collection.each do |i|
				file.puts i
			end
		file.close()

		puts "Would you like to enter another hero?\n(y/n)"
		user_input = gets.chomp

		break if user_input == "n"

		i += 1

	end
end

def delete_hero
	user_input = ''
	hero_collection = File.read("txtsuperheroes.txt")
	p hero_collection
end

def list_heroes(password = '')
	hero_keys = []
	hero_values = []
	heroes = File.read("txtsuperheroes.txt")
	heroes.gsub!(/\r\n?/, "\n")
	line_count = 0
	heroes.each_line do |i|
		line_count += 1
		if line_count % 3 == 0
			hero_keys.push(i.chomp.to_sym)
		elsif line_count.even?
			hero_values.push(i.chomp)
		end
				
	end
	hero_collection = []
	puts "Here Are Your Heroes"
	puts "-------------------- "
	(0...hero_keys.length()).each do |i|
		hero_collection.push({
			hero_keys[i].to_sym => hero_values[i]
			})
		hero = hero_collection[i].to_h
		hero_collection[i].each { |key, value| he}
	end
end

loop do
	puts "Commands:\n[a] add a hero\n[d] delete a hero\n[l] list superheroes\n[exit] quit program"
	print "what would you like>> "
	user_input = gets.chomp
	case user_input
	when "a"
		add_hero()
	when "d"
		delete_hero()
	when "l"
		list_heroes()
	when "list secret"
		puts "To view the secret ids of your heroes please enter your password"
		password = gets.chomp
		list_heroes(password)
	when "exit"
		break
	else
		puts "Sorry that is an invalid command"
	end
end

puts "Goodbye!"
