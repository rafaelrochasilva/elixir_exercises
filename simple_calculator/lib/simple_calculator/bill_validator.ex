defmodule SimpleCalculator.BillValidator do
  def validates_type(value) do
    case is_number(value) do
      false -> "Only numbers are allowed"
      true  -> value
    end
  end

  def validates_numerically(value) when value <= 0 do
    "Type only values greater than 0."
  end

  def validates_numerically(value) do
    value
  end
end
