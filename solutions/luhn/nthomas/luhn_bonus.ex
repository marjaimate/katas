defmodule Training.LuhnBonus do
  def solve do
    nums = for i <- 0..15, i > 0, do: Enum.random(0..9)
    sum = Training.Luhn.sum(nums)
    [rem(10 - rem(sum, 10), 10)] ++ nums
    |> Enum.reverse
    |> Enum.join
  end
end
