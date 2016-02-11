defmodule SimpleCalculator.BillValidator do
  def validates_type(value) do
    case Regex.match?(~r/^\d+$/, value) do
      true ->
        {:ok, convert_to_float(value)}
      false ->
        {:error, "Only numbers are allowed."}
    end
  end

  def validates_numerically(value) when value <= 0 do
    {:error, "Type only values greater than 0."}
  end

  def validates_numerically(value) do
    {:ok, value}
  end

  defp convert_to_float(value) do
    value
    |> Float.parse
    |> elem(0)
  end
end
