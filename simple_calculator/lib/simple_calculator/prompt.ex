defmodule SimpleCalculator.Prompt do
  def init() do
    welcome_message()
    main_menu()
  end

  defp welcome_message() do
    IO.puts "Hi, welcome to Simple Calculator."
    IO.puts "We are going to help you to calculate the tips for a given bill :)"
  end

  defp main_menu() do
    IO.puts "Choose an option:"
    IO.puts "1. Generate bill"
    IO.puts "2. Quit"

    menu_option = IO.gets ""
    case menu_option do
      "1" -> bill_menu()
      "2" -> quit()
      _ -> invalid_option()
    end
  end

  defp quit() do
    IO.puts "Good bye, have a nice day!"
  end

  defp invalid_option() do
    IO.puts "**Please select only valid options"
    main_menu()
  end

  defp bill_menu() do
    bill = IO.gets "What is the bill?"
    IO.puts "The total is $" <> bill
  end
end
