defmodule SimpleCalculator.Prompt do
  def init do
    display_welcome_message
    main_menu
  end

  defp display_welcome_message do
    """
    --------------------------------------
    Hi, welcome to Simple Calculator.
    We are going to help you to
    calculate the tips for a given bill :)\n
    """
    |> IO.puts
  end

  defp main_menu do
    """
    --------------------------------------
    Simple Calculator - Main Menu:
    1. Ask for the bill
    2. Quit:
    --------------------------------------
    Choose an option:
    """
    |> IO.gets
    |> select_option
  end

  defp select_option("1\n"), do: calculate_bill

  defp select_option("2\n"), do: quit_app

  defp select_option(_), do: invalid_option_message

  defp quit_app do
    """
    --------------------------------------
    Good bye, have a nice day!
    """
    |> IO.puts
  end

  defp invalid_option_message do
    IO.puts "**Please select only valid options"
    main_menu
  end

  defp calculate_bill do
    bill = get_user_input_with("Insert the bill ammont?\n$")
    tip_percentage = get_user_input_with("What is the tip percentage?\n$")

    SimpleCalculator.Bill.resume(tip_percentage, bill)
    |> bill_resume_message

    main_menu
  end

  defp bill_resume_message({total, tip}) do
    """
    *************************************
    * The total is $#{total}
    * The tip is $#{tip}
    *************************************
    """
    |> IO.puts
  end

  defp get_user_input_with(message) do
    input = IO.gets(message)

    number = case SimpleCalculator.BillValidator.validates_type(input) do
      {:error, error_msg} ->
        IO.puts error_msg
        get_user_input_with(message)
      {:ok, value} -> value
    end

    case SimpleCalculator.BillValidator.validates_numerically(number) do
      {:error, error_msg} ->
        IO.puts error_msg
        get_user_input_with(message)
      {:ok, value} -> value
    end
  end
end
