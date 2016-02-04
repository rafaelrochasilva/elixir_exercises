defmodule SimpleCalculator.Bill do
  @doc """
   Calculates the bill tip

   ## Example
        iex> Bill.tip(15, 200)
        30
  """
  def tip(tip_percentage, bill_total) do
    bill_total * tip_percentage / 100
  end
end
