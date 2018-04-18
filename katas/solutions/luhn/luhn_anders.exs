defmodule Luhn do
  def is_valid?(string) do
    sum =
      string
        |> String.codepoints
        |> Enum.map(&(String.to_integer(&1)))
        |> Enum.map_every(2, &(luhn_sum(&1)))
        |> Enum.sum

    rem(sum, 10) == 0
  end

  def luhn_sum(digit) do
    double = digit |> Kernel.*(2)
    case double < 9 do
      true ->
        double
      false ->
        double
        |> Integer.digits
        |> Enum.sum
    end
  end

end
