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
    select_option
  end

  defp select_option do
    menu_bar
    option = IO.gets "Choose an option:\n"
    case option do
      "1\n" -> bill_menu()
      "2\n" -> quit()
       _  -> invalid_option()
    end
  end

  defp quit do
    menu_bar
    IO.puts "Good bye, have a nice day!"
  end

  defp invalid_option do
    IO.puts "**Please select only valid options"
    main_menu
  end

  defp bill_menu do
    bill = bill_input
    # tip_percentage = IO.gets "What is the tip percentage?\n%"
    total = SimpleCalculator.Bill.total(10, bill)
    tip = SimpleCalculator.Bill.tip(10, bill)
    IO.puts "The tip is $#{tip}"
    IO.puts "The total is $#{total}"
    main_menu
  end

  defp bill_input do
    bill_input = IO.gets "What is the bill?\n$"

    value = InputValidator.check(bill_input)
    case value do
      :error -> bill_input
      _ -> value
    end
  end

  defp menu_bar do
    IO.puts String.duplicate("-", 70)
  end
end
