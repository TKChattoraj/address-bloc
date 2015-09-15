require_relative '../controllers/menu_controller'

RSpec.describe MenuController do
  describe "view_entry_number_wrapper" do

  end
  describe "view_entry_number" do
    it "accepts a valid number and returns an entry corresponding to that number" do
      test_menu = MenuController.new
      test_menu.address_book.add_entry("Ellis Wyatt", "513-000-1313", "ellis.wyatt@wyatt.com")
      result = test_menu.view_entry_number(0)
      expect(result).to be_a Entry
      expect(result.name).to eq("Ellis Wyatt")
      expect(result.phone_number).to eq("513-000-1313")
      expect(result.email).to eq("ellis.wyatt@wyatt.com")
    end

    it "returns nil for an invalid entry number" do
      test_menu = MenuController.new
      test_menu.address_book.add_entry("Ellis Wyatt", "513-000-1313", "ellis.wyatt@wyatt.com")
      #test_menu.should_receive(:view_entry_number_wrapper).exactly(2).times
      result = test_menu.view_entry_number(1)
      expect(result).to be_nil
    end
  end

end




      #test_menu.stub(:gets).and_return("0")
      #expect(STDOUT).to receive(:puts).with "Name: Ellis Wyatt\nPhone Number: 513-000-1313\nEmail: ellis.wyatt@wyatt.com"

    # test view_entry_number returns entry do
      # set up the data
      # expect method_result to eq entry
      # expect(MenuController.new.view_entry_number(good_arg)).to eq entry
    # end
    # test view_entry_number returns invalid string do
      # expect method_result with bad arg to eq invalid string
      # expect(view_entry_number(with_bad_arg)).to eq invalid string
    # end
    # test view_entry_number calls itself do
      # test_menu = MenuController.new
      # expect method_result with bad arg to eq invalid string
      # test_menu.should_receive(:view_entry_number).exactly(2).times
      # text_menu.view_entry_number(bad_arg)
    # end
