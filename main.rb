require './app'
require './menu'

def main
  menu = Menu.new
  library = App.new
  puts "\nWelcome to School Library by Ibnballo!\n\n"
  menu.display_menu(library)
end

main
