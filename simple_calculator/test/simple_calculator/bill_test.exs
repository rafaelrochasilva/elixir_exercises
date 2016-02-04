defmodule SimpleCalculator.BillTest do
  use ExUnit.Case

  test "calculates the total of the bill with tip" do
    assert 230.00 == SimpleCalculator.Bill.total(15, 200)
  end

  test "calculates a tip given a bill" do
    assert 30.00 == SimpleCalculator.Bill.tip(15, 200)
  end
end
