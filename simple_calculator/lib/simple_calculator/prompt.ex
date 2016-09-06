defmodule SimpleCalculator.Prompt do
  def init do
    welcome
    main_menu
  end

  defp welcome do
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
    Main Menu:
    1. The bill, please!
    2. Quit:
    """
    |> IO.puts

    options_menu
  end

  defp options_menu do
    """
    --------------------------------------
    Choose an option:
    """
    |> IO.gets
    |> select_option
  end

  defp select_option("1\n"), do: bill_menu

  defp select_option("2\n"), do: quit

  defp select_option(_), do: invalid_option

  defp quit do
    """
    --------------------------------------
    Good bye, have a nice day!
    """
    |> IO.puts
  end

  defp invalid_option do
    IO.puts "**Please select only valid options"
    main_menu
  end

  defp bill_menu do
    bill = "How much is the bill?\n$" |> ask
    tip_percentage = "What is the tip percentage?\n$" |> ask

    SimpleCalculator.Bill.resume(tip_percentage, bill)
    |> bill_resume_message

    options_menu
  end

  defp bill_resume_message({total, tip}) do
    """
    The total is $#{total}
    The tip is $#{tip}
    """
    |> IO.puts
  end

  defp ask(message) do
    input = IO.gets(message)

    number = case SimpleCalculator.BillValidator.validates_type(input) do
      {:error, error_msg} ->
        IO.puts error_msg
        ask(message)
        {:ok, value} -> value
    end

    case SimpleCalculator.BillValidator.validates_numerically(number) do
      {:error, error_msg} ->
        IO.puts error_msg
        ask(message)
        {:ok, value} -> value
    end
  end
end
