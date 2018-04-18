defmodule Traffic.Car do
  def start do
    receive do
      {:green, lights} ->
        IO.puts "#{inspect self()} moving through #{lights}"
    after
      3_000 ->
      #        IO.puts "#{inspect self()} #{waiting()}"
        start()
    end
  end

  def waiting() do
    ["> Toot toot!", "> Come on!", "> You muppets!", "> Are these lights on??!?"]
    |> Enum.random
  end
end
