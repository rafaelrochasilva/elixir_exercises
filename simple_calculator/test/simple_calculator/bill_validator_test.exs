defmodule SimpleCalculator.BillValidatorTest do
  use ExUnit.Case

  test "checks if the number is greater than 0" do
    assert 10 == SimpleCalculator.BillValidator.validates_numerically(10)
  end

  test "does not allow numbers less than 0" do
    assert "Type only values greater than 0." == SimpleCalculator.BillValidator.validates_numerically(-10)
  end
end
