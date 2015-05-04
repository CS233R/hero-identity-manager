@heros = [
  { super_id: 'Batman', secret_id: 'Bruce Wayne', weakness: 'Women' },
  { super_id: 'Superman', secret_id: 'Clark Kent', weakness: 'Kriponite' },
  { super_id: 'Spiderman', secret_id: 'Peter Parker', weakness: 'Women' }
]

def hero_header
  60.times do |i|
    if i % 20 == 0
      print '|'
      next
    end
    print '-'
  end
  print '|'
  puts
  @heros[0].keys.each do |key|
    print key.to_s.tr('_', ' ').capitalize.center(20)
  end
  puts
  60.times do |i|
    if i % 20 == 0
      print '|'
      next
    end
    print '-'
  end
  print '|'
  puts
end


def secret_list
  print 'What is the secret password: '
  user_input = gets.chomp
  if user_input == 'asdf'
    hero_header
    @heros.each do |hero| 
      hero.values.each do |h|
        print h.to_s.center(20)
      end
      2.times { puts }
    end
  else
    puts 'Sorry that is the wrong password'
  end

  main_menu
      
end


def add_hero
  hero = {}
  print 'Enter your heroes SUPERHERO Identity: '
  user_input = gets.chomp
  hero[:super_id] = user_input

  print 'Enter your heroes REAL Identity: '
  user_input = gets.chomp
  hero[:secret_id] = user_input

  print 'Enter your heroes weakness: '
  user_input = gets.chomp
  hero[:weakness] = user_input

  @heros << hero

  puts "Would you like to enter another hero?\n(y/n)"
  user_input = gets.chomp

  if user_input == 'y'
    add_hero
  else
    main_menu
  end
end

def list_heros
  print '|'
  18.times { print '-' }
  print "|\n"
  puts 'Heros'.center(20)
  print '|'
  18.times { print '-' }
  print "|\n"

  @heros.each do |hero|
    puts hero[:super_id].center(20)
    puts
  end 

  main_menu
end

def edit_hero
  print '|'
  18.times { print '-' }
  print "|\n"
  puts 'Heros'.center(20)
  print '|'
  18.times { print '-' }
  print "|\n"

  @heros.each_with_index do |hero, index|
    print "#{index + 1}. "
    puts hero[:super_id].ljust(20)
    puts
  end

   
  print 'select a hero (enter \'c\' to cancel)>>'
  user_input = gets.chomp
  if user_input == 'c'
    main_menu
    return
  end
  user_input = user_input.to_i - 1
  print 'enter a new name: '
  new_name = gets.chomp
  hero = @heros.fetch(user_input)
  hero[:super_id] = new_name
  @heros[user_input].merge!(hero)

  main_menu
end

def delete_hero

  @heros.each_with_index do |hero, index|
    puts "#{index + 1}. #{hero[:super_id]}"
  end
  print 'which heros would you like to delete>>'
  user_input = gets.chomp.to_i - 1
  @heros.delete_at(user_input)

  main_menu
end

def main_menu
  puts "Commands:\n[a] add a hero\n[e] edit hero name\n[d] delete a hero\n[l] list superheroes\n[exit] quit program"
  print 'what would you like>> '
  user_input = gets.chomp
  case user_input
  when 'a'
    add_hero
  when 'e'
    edit_hero
  when 'd'
    delete_hero
  when 'l'
    list_heros
  when 'ls'
    secret_list
  when 'exit'
    return
  else
    puts 'Sorry that is an invalid command'
    main_menu
  end
end
main_menu