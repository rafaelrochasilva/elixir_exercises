defmodule SimpleCalculator.Prompt do
  def init do
    welcome_message
    main_menu
  end

  defp welcome_message do
    menu_bar
    IO.puts "Hi, welcome to Simple Calculator."
    IO.puts "We are going to help you to calculate the tips for a given bill :)"
  end

  defp main_menu do
    menu_bar
    IO.puts "Main Menu:"
    IO.puts "1. Generate bill"
    IO.puts "2. Quit"
    option = IO.gets "Choose an option:\n"
    select_option(option)
  end

  defp select_option(option) do
    menu_bar
    case option do
      "1\n" -> bill_menu()
      "2\n" -> quit()
       _  -> invalid_option()
    end
  end

  defp quit do
    menu_bar
    IO.puts "Good bye, have a nice day!"
    menu_bar
  end

  defp invalid_option do
    IO.puts "**Please select only valid options"
    main_menu
  end

  defp bill_menu do
    bill = IO.gets "What is the bill?\n$"
    IO.puts "The total is $" <> bill
  end

  defp menu_bar do
    IO.puts String.duplicate("-", 70)
  end
end
