defmodule Training.Luhn do
  def solve(""), do: false

  def solve(numbers) when is_binary(numbers) do
    numbers
    |> String.split("")
    |> Enum.reject(&(&1 == "" || &1 == " "))
    |> Enum.map(&String.to_integer/1)
    |> solve
  end

  def solve(numbers) when is_list(numbers) do
    [check | rest] = Enum.reverse(numbers)
    rem(sum(rest) + check, 10) == 0
  end

  def sum(numbers) do
    numbers
    |> Enum.chunk_every(2)
    |> Enum.map(&add/1)
    |> Enum.sum
  end

  defp add([x, y]), do: x + y * 2 |> sum_digits

  defp add([x]), do: x * 2 |> sum_digits

  defp sum_digits(x), do: x |> Integer.digits |> Enum.sum
end
