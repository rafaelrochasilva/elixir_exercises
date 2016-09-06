defmodule SimpleCalculator.Bill do
  def total(tip_percentage, bill_total) do
    tip(tip_percentage, bill_total) + bill_total
    |> Float.ceil(2)
  end

  def tip(tip_percentage, bill_total) do
    bill_total * tip_percentage / 100
  end

  def resume(tip_percentage, bill_total) do
    { total(tip_percentage, bill_total), tip(tip_percentage, bill_total) }
  end
end
