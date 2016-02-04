defmodule SimpleCalculator.Bill do
  def total(tip_percentage, bill_total) do
    tip(tip_percentage, bill_total) + bill_total
  end

  def tip(tip_percentage, bill_total) do
    bill_total * tip_percentage / 100
  end
end
