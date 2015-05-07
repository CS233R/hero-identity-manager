# superheroList
Password = 1234

```lang-ruby
choice = 1
hero_list = []
def print_hero_name(hero_list)
  puts "*******************"
  hero_list.each do |hero|
    puts hero[:hero_name]
  end
  puts "*******************"
end

def print_all_info(hero_list)
  puts "*******************"
  hero_list.each do |hero|
    puts hero[:hero_name]
    puts hero[:identy]
    puts hero[:weakness]
    puts "*******************"
  end
end


until choice == 5

      puts 'What do you want to do?
            1: Add Hero.
            2: Read Hero names.
            3: Read Hero Secret Identities.
            4: Delete Hero
            5: Save File and Quit.'
            choice = gets.chomp.to_i

            if choice == 1
                  puts "Your Choice is #{choice}"
                  puts 'What is the Hero Name?'
                  h_Name = gets.chomp
                  puts 'What is the Secret Identities Name?'
                  i_Name = gets.chomp
                  puts 'What is the Weakness of this Hero?'
                  hWeakness = gets.chomp


                  hero_list << {hero_name: h_Name, identy: i_Name,weakness: hWeakness}

            elsif choice == 2
              print_hero_name(hero_list)

            elsif choice == 3
              puts "Password?"
              password = gets.chomp.to_i
              if password == 1234
                print_all_info(hero_list)
              end
            elsif choice == 4
              print_hero_name(hero_list)
              puts "What Super hero do you want to delete?"
              delete_choice = gets.chomp

                hero_list.reject!{|hero| hero[:hero_name].downcase == delete_choice.downcase}


                        puts "Your Choice is #{choice}"
            elsif choice == 5
                        puts 'Saving and Quitting'
            elsif
                  puts "Needs to be between 1 and 5"

            end
end



```
