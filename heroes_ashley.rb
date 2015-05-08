class Superhero
  
  $heroes = [{name: "Superman", identity: "Clark Kent", weakness: "Kryptonite"},
     {name: "Spiderman", identity: "Peter Parker", weakness: "Mary Jane/Uncle Ben"},
     {name: "Batman", identity: "Bruce Wayne", weakness: "Women/Dead Parents"}]
    input = ''
  @@herohash = {}
  def Superhero.get_users
    @@herohash
  end

  def deleted_hero
    puts "What is the name of the superhero that has passed away?"
    name = gets.chomp
    $heroes.reject! {|hero| hero[:name].downcase == name.downcase}
    puts "RIP #{name}. Gone but not forgotten."
    puts
  end

  def super_hero     
        puts
        puts" Here is a list of all the superheroes."
      $heroes.each do |hero|
        puts "      =======================
        Superhero: #{hero[:name]}"
    end
        puts"      ======================="
        puts
  end

  def super_hero_complete
        puts
        puts" Here is a list of all the superheroes, secret identities and weeknesses."
      $heroes.each do |hero|
        puts "        ===============================
          Superhero:         #{hero[:name]}
          Secret Identity:   #{hero[:identity]}
          Weakness:          #{hero[:weakness]}"
        end
  puts"        ==============================="
  puts
  end

  def super_hero_secret
      puts "Please enter your login information"
      login = gets.chomp.to_s
    if login == "SecretHero"
      puts super_hero_complete
        else 
      puts "That is the incorrect password"
      super_hero
      end
  end
end
shero = Superhero.new

loop do
  puts
  puts "Would you like to 
       1. Add another  
       2. List superheroes secret identity 
       3. Delete a fallen hero  
       4. List of superheros 
       5. Exit"
  input = gets.chomp.to_i
  case
    when input == 1
        puts "What superhero are you adding?"
        input = gets.chomp
        Superhero.get_users[:name] = input

        puts "The superhero you have entered is: #{Superhero.get_users[:name]}."

        puts "what is #{Superhero.get_users[:name]} secret identity?"
        input = gets.chomp
        Superhero.get_users[:identity] = input

        puts "#{Superhero.get_users[:name]} secret identity is #{Superhero.get_users[:identity]} 
        shhh... we won't tell anyone unless they have your password."

        puts "what is #{Superhero.get_users[:name]} weakness?"
        input = gets.chomp
        Superhero.get_users[:weakness] = input
        puts "#{Superhero.get_users[:name]} weakness is #{Superhero.get_users[:weakness]} 
        shhh... we won't tell anyone unless they have your password."
        puts "
        You have entered #{Superhero.get_users[:name]}
        With a secret identity of #{Superhero.get_users[:identity]} 
        With a weakness of #{Superhero.get_users[:weakness]}"
        $heroes.push(Superhero.get_users)
        puts
        puts "New list of superheros in database"
shero.super_hero
    
    when input == 2
shero.super_hero_secret
    when input == 3
        shero.deleted_hero  

    when input == 4 
shero.super_hero

    when input == 5
      break if input == 5       
    else 
        puts
        puts " I am sorry you have to enter 1-5."
        puts
    end
end
