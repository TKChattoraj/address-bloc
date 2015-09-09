
require_relative 'entry'

class AddressBook
  attr_accessor :entries
  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name_arg, phone_number_arg, email_arg)
    entry_to_remove = Entry.new(name_arg, phone_number_arg, email_arg)

    index = 0
    entries.each do |e|
      if (e.name == name_arg) and (e.phone_number == phone_number_arg) and (e.email == email_arg)
        break
      end
      index += 1
    end
    entries.delete_at(index)
    entries

  end


end
