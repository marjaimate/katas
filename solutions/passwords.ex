# One liner
"aa bb AA aa cc" |> String.split(" ") |> List.foldl(%{}, fn(x, a) -> Map.update(a, x, 1, fn(v) -> v + 1 end) end) |> Map.values |> Enum.max == 1

# Using sets
list = "aa bb AA aa cc" |> String.split(" ")
set = MapSet.new(list)
length(list) == MapSet.size(set)

# Put it in a module:
defmodule Password do
  def is_valid string do
    words = String.split(string, " ")
    uniq_words = Enum.uniq(words)
    length(words) == length(uniq_words)
  end
end
