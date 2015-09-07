def give_greeting
  salutation = ARGV.shift
  ARGV.each do |person|
    puts "#{salutation} #{person}"
  end
end
give_greeting
