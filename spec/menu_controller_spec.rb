require_relative '../controllers/menu_controller'

RSpec.describe MenuController do
  describe "view_entry_number" do
    it "accepts a valid number and prints the entry corresponding to that number" do
      test_menu = MenuController.new
      test_menu.address_book.add_entry("Ellis Wyatt", "513-000-1313", "ellis.wyatt@wyatt.com")
      expected_result = "Name: Ellis Wyatt\nPhone Number: 513-000-1313\nEmail: ellis.wyatt@wyatt.com"
      expect(STDOUT).to receive(:puts).with "Name: Ellis Wyatt\nPhone Number: 513-000-1313\nEmail: ellis.wyatt@wyatt.com"
      test_menu.view_entry_number(0)
    end
    it "does not accept an invalid number and prints a error message" do
      test_menu = MenuController.new
      test_menu.stub(:gets).and_return("0")
      test_menu.address_book.add_entry("Ellis Wyatt", "513-000-1313", "ellis.wyatt@wyatt.com")
      expect(STDOUT).to receive(:puts).with "Invalid Choice! Enter a valid number."
      test_menu.view_entry_number(1)
    end

  end
end
