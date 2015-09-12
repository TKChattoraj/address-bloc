require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    puts "You picked #{selection}"

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu

    when 2
      system "clear"
      create_entry
      main_menu

    when 3
      system "clear"
      search_entries
      main_menu

    when 4
      system "clear"
      read_csv
      main_menu

    when 5
      system "clear"
      puts "Enter the number of the Entry you want to see:"
      view_entry_number(gets.chomp.to_i)
      main_menu

    when 6
      puts "Good-bye!"
      exit(0)

    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end



  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"


  end

  def create_entry
    system "clear"
    puts "Enter Name:"
    name_entry = gets.chomp
    puts "Enter Phone:"
    phone_entry = gets.chomp
    puts "Enter Email:"
    email_entry = gets.chomp
    address_book.add_entry(name_entry, phone_entry, email_entry)
  end

  def search_entries
  end

  def read_csv
  end

  def view_entry_number(entry_number_parameter)

    if address_book.entries[entry_number_parameter]
      puts address_book.entries[entry_number_parameter].to_s

    else
      puts "Invalid Choice! Enter a valid number."


      self.view_entry_number(gets.chomp.to_i)

      ##### Comment
      #This code does not pass menu_controller_spec, testing for an invalid indices.
      #Instead of the desired error "Invalid Choice!...," I get the string for the
      #sample entry, "Ellis Wyatt ..."

      #If I comment out the "self.view_entry..." above, The spec works.
      #This demonstrates that the code spots invalid indices.

      #I can't figure out how to write the spec to account for view_entry_number
      #potentially calling itself.


    end
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"

    when "d"

    when "e"

    when "m"
      system "clear"
      main_menu

    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end


end