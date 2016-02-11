defmodule SimpleCalculator.BillValidatorTest do
  use ExUnit.Case

  test "checks if the number is greater than 0" do
    assert {:ok, 10} == SimpleCalculator.BillValidator.validates_numerically(10)
  end

  test "does not allow numbers less than 0" do
    assert {:error, "Type only values greater than 0."} == SimpleCalculator.BillValidator.validates_numerically(-10)
  end

  test "checks if a number was typed" do
    assert {:ok, 10} == SimpleCalculator.BillValidator.validates_type("10")
  end

  test "does not allow letters, only numbers" do
    assert {:error, "Only numbers are allowed."} == SimpleCalculator.BillValidator.validates_type("aaa")
  end
end
