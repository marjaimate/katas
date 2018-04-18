defmodule Luhn do
  def is_valid account do
    account
      |> String.codepoints()
      |> Enum.map(&(String.to_integer(&1)))
      |> Enum.reverse
      |> check_digit
      |> rem(10)
      |> check_is_valid
  end

  defp check_is_valid(0), do: true
  defp check_is_valid(_), do: false

  defp check_digit(list), do: check_digit(list, 0)

  # Cater for the exit conditions here
  defp check_digit([], check), do: check
  defp check_digit([x], check), do: check + x

  # Sum up the numbers, doubling every second one
  defp check_digit([x, y | tail], check) do
    check_digit(tail, x + double(y * 2) + check)
  end

  # If the number is greater than 9, then sum up its digits
  # i.e.: 13 => 1 + 3 = 4;
  # which is the same as 13 - 9 = 4
  defp double(y) when y > 9, do: y - 9
  defp double(y), do: y



  # Do it in one go
  def is_valid_in_one(cc) do
    cc
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    |> Enum.reverse
    |> Enum.chunk_every(2)
    |> Enum.map(fn([a, d]) when d <= 4 -> a + d * 2; ([a,d]) -> a + (d * 9) - 9; ([a]) -> a end)
    |> Enum.sum
    |> rem(10)
    |> Kernel.==(0)
  end
end
