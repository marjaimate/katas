defmodule Proc do
  def listen do
    receive do
      "hello" ->
        IO.puts("*waves*")
    after
      3_000 ->
        IO.puts "yawn"
        listen
    end
  end
end
