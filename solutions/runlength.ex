defmodule Runlength do
  # Encode
  def encode(<< first :: binary-size(1), rest :: binary >> ) do
    encode(rest, first, 1, "")
  end

  def encode(<<>>, current_letter, counter, result) do
    <<result :: binary, (Integer.to_string(counter)) :: binary, current_letter :: binary >>
  end

  def encode(<< current_letter :: binary-size(1), rest :: binary >>, current_letter, counter, result) do
    encode(rest, current_letter, counter + 1, result)
  end

  def encode(<< next_letter :: binary-size(1), rest :: binary >>, current_letter, counter, result) do
    encode(rest, next_letter, 1,  <<result :: binary, (Integer.to_string(counter)) :: binary, current_letter :: binary >>)
  end

  # Decode
  def decode(string) do
    decode(string, <<>>)
  end

  def decode(<<>>, result), do: result
  def decode(<<num :: binary-size(1), letter:: binary-size(1), rest :: binary>>, acc) do
    decode(rest, << acc :: binary, (String.pad_leading("", String.to_integer(num), letter)) :: binary >>)
  end
end

