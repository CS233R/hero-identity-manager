class Hero
  attr_accessor :super_id, :secret_id, :weakness
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

def collect_heros
  @heros = []
  file = File.read("heros.txt")

  file.each_line do |line|
    hero = line.split(":")
    @heros << {secret_id: hero[0], super_id: hero[1], weakness: hero[2]}
  end
end

def hero_header
  print '|'
  18.times { print '-' }
  print "|\n"
  puts 'Heros'.center(20)
  print '|'
  18.times { print '-' }
  print "|\n"
end

def hero_full_header
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

def print_heros
  unless @heros.empty?
    @heros.each_with_index do |hero, index|
      print "#{index + 1}."
      puts hero.fetch(:super_id, 'No Heros').center(17)
      puts
    end
  else
    puts "No heros yet".center(20)
  end
end

def add_hero
  hero = Hero.new
  print 'Enter your heroes SUPERHERO Identity: '
  hero.super_id = gets.chomp

  print 'Enter your heroes SECRET Identity: '
  hero.secret_id = gets.chomp

  print 'Enter your heroes weakness: '
  hero.weakness = gets.chomp

  file = File.new("heros.txt", "a")
  file.puts "#{hero.super_id}:#{hero.secret_id}:#{hero.weakness}"
  file.close()

  puts "Would you like to enter another hero?\n(y/n)"
  user_input = gets.chomp

  if user_input == 'y'
    add_hero
  else
    main_menu
  end
end

def edit_hero
  hero_header
  collect_heros
  print_heros
   
  print 'select a hero (enter \'c\' to cancel)>>'
  user_input = gets.chomp
  main_menu if user_input == 'c'
  user_input = user_input.to_i - 1

  hero = @heros.fetch(user_input)
  puts "What would you like #{hero[:super_id]}'s new superhero name to be?\n-->"
  super_id = gets.chomp
  puts "What would you like #{hero[:super_id]}'s new secret identity to be?\n-->"
  secret_id = gets.chomp
  puts "What would you like #{hero[:super_id]}'s new name to be?\n-->"
  weakness = gets.chomp
  hero[:super_id] = super_id
  hero[:secret_id] = secret_id
  hero[:weakness] = weakness
  @heros[user_input].merge!(hero)
  # p @heros
  file = File.new("heros.txt", "w")
  @heros.each do |hero|
    file.puts "#{hero[:super_id]}:#{hero[:secret_id]}:#{hero[:weakness]}"
  end
  file.close

  main_menu
end

def delete_hero

  collect_heros
  hero_header
  print_heros
  print 'which heros would you like to delete>>'
  user_input = gets.chomp.to_i - 1
  @heros.delete_at(user_input)
  file = File.new("heros.txt", "w")
  @heros.each do |hero|
    file.puts "#{hero[:super_id]}:#{hero[:secret_id]}:#{hero[:weakness]}"
  end
  file.close

  main_menu
end

def list_heros
  collect_heros
  hero_header
  print_heros
  main_menu
end

def secret_list
  print 'What is the secret password: '
  user_input = gets.chomp
  if user_input == 'asdf'
    collect_heros
    hero_full_header
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

collect_heros

main_menu
