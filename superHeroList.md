# superheroList
Password = 1234

```lang-ruby
class Heroes
  @@heroes = []
  @hero_name = ''
  @hero_identity = ''
  @hero_weakness = ''

  def initialize
      menu
  end

  def menu
    choice = 1
    until choice == 4
        puts 'What do you want to do?
              1: Add Hero.
              2: Read Hero names.
              3: Delete Hero
              4: Save File and Quit.'
        choice = gets.chomp.to_i

        if choice == 1
          get_hero_name
          get_hero_identity
          get_hero_weakness
          save_hero_list

        elsif choice == 2
          print_hero_List
        elsif choice == 3
          print_hero_List
          puts 'What Super hero do you want to delete?'
          delete_choice = gets.chomp

          @@heroes.reject!{|hero| hero[:hero_name].downcase == delete_choice.downcase}


          puts "Your Choice is #{choice}"
        elsif choice == 4
          puts 'Saving and Quitting'
        elsif choice == 5
          puts 'Password?'
          password = gets.chomp.to_i
          if password == 1234
            print_hero_list_all
          end
        else
          puts 'Needs to be between 1 and 4'
        end
    end

  end

  def get_hero_name
    puts 'What is the Hero Name?'
    @hero_name = gets.chomp
  end

  def get_hero_identity
    puts 'What is the Hero Identity?'
    @hero_identity = gets.chomp
  end

  def get_hero_weakness
    puts 'What is the Hero Weakness'
    @hero_weakness = gets
  end

  def save_hero_list
    @@heroes << { hero_name: @hero_name,
                  identity: @hero_identity,
                  weakness: @hero_weakness }
  end

  def print_hero_List
    puts '*******************'
    @@heroes.each do |hero|
      puts hero[ :hero_name ]
    end
    puts '*******************'
  end

  def print_hero_list_all
    puts '*******************'
    @@heroes.each do |hero|
      puts hero[ :hero_name ]
      puts hero[ :identity ]
      puts hero[ :weakness ]
      puts '*******************'
    end
  end
end

Heroes.new


```
