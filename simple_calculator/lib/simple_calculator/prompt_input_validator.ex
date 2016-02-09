defmodule PromptInputValidator do
  def check(value) do
    value
    |> Float.parse
    |> elem(0)
    |> validates_numerically
  end

  def validates_number(value) do
    value = Float.parse(value)
    case value do
      :error -> "Only numbers are allowed"
      _ -> value
    end
  end

  def validates_numerically(value) when value <= 0 do
    "Type only values greater than 0."
  end

  def validates_numerically(value) do
    value
  end
end
