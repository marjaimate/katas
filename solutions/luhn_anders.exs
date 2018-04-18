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


  def generate() do
    ## Luhn_sum on 15 random_15
    num = random_15()
    rest =
      num
      |> Enum.map_every(2, &(luhn_sum(&1)))
      |> Enum.sum
      |> Integer.mod(10)

    ## add a check digit that makes mod(sum, 10) == 0
    List.insert_at(num, -1, 10 - rest)
    |> Enum.map(fn(n) -> Integer.to_string(n) end)
    |> List.to_string
  end

  def random_15(acc \\ []) do
    case Enum.count(acc) == 15 do
      true ->
        acc
      false ->
        List.insert_at(acc, -1, rand())
        |> random_15
    end
  end

  def rand do
    Enum.random 0..9
  end
end
