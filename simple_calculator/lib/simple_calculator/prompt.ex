defmodule SimpleCalculator.Prompt do
  alias SimpleCalculator.BillValidator
  alias SimpleCalculator.Bill

  def init do
    welcome_message
    main_menu
  end

  defp welcome_message do
    """
    ------------------------------------------------------------------
    Hi, welcome to Simple Calculator.
    We are going to help you to calculate the tips for a given bill :)
    """
      |> IO.puts
  end

  defp main_menu do
    """
    ------------------------------------------------------------------
    Main Menu:
    1. Generate bill
    2. Quit:
    """
      |> IO.puts

    select_option
  end

  defp select_option do
    option = "Choose an option:\n" |> IO.gets
    case option do
      "1\n" -> bill_menu()
      "2\n" -> quit()
       _  -> invalid_option()
    end
  end

  defp quit do
    """
    ------------------------------------------------------------------
    Good bye, have a nice day!
    """
      |> IO.puts
  end

  defp invalid_option do
    "**Please select only valid options"
      |> IO.puts
    main_menu
  end

  defp bill_menu do
    bill = input_message("What is the bill?\n$")
    tip_percentage = input_message("What is the tip percentage?\n$")

    total = SimpleCalculator.Bill.total(tip_percentage, bill)
    tip = SimpleCalculator.Bill.tip(tip_percentage, bill)

    "The tip is $#{tip}"
      |> IO.puts
    "The total is $#{total}"
      |> IO.puts
  end

  defp input_message(message) do
    input = IO.gets(message)

    number = case SimpleCalculator.BillValidator.validates_type(input) do
      {:error, error_msg} ->
        IO.puts error_msg
        input_message(message)
      {:ok, value} -> value
    end

    case SimpleCalculator.BillValidator.validates_numerically(number) do
      {:error, error_msg} ->
        IO.puts error_msg
        input_message(message)
      {:ok, value} -> value
    end
  end
end
