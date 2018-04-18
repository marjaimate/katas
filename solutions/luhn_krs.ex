defmodule LuhnKrs do
  def check(account) do
    account
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    |> checksum
    |> Kernel.==(0)
  end

  defp checksum(code_points) when is_list(code_points) do
    code_points
    |> Enum.reverse
    |> checksum([])
  end

  defp checksum([], intermediate) do
    intermediate |> Enum.sum |> Integer.mod(10)
  end

  defp checksum([first, second | tail], intermediate) do
    checksum(tail, intermediate ++ [first, double(second)])
  end

  def generate() do
    list = random(15)
    # add a non-influencing digit for the odd/even position checksum calculation
    remainder = checksum(list ++ [0])

    # last digit compensates for the remainder
    list ++ [10 - remainder]
    |> Enum.map(&Integer.to_string/1) |> List.to_string
  end

  defp random(times), do: random(times, [])
  defp random(1, items), do:  items ++ [0]
  defp random(times, items) do
    random(times - 1, items ++ [Enum.random(1..9)])
  end

  # doubled and further reduced to 1 digit
  defp double(number) when number < 5, do: number * 2
  defp double(number), do: number * 2 - 9

end
