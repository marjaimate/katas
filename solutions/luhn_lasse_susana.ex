defmodule Luhn do
    def validate(l) when is_binary(l) do
        validate(
            l
            |> String.graphemes
            |> Enum.map(&String.to_integer/1)
        )
    end
    def validate(l) when is_list(l) and length(l) == 16 do
        rem(checksum(l), 10) == 0
    end
    
    def checksum(l) do
        [h | t] = Enum.reverse(l)
        sanitize_list = t
        |> Enum.map_every(2, fn x -> x*2 end)
        |> Enum.map(&digit_sum/1)

        h + calc(sanitize_list)
    end

    def calc([n1]) do
        n1
    end
    def calc([n1, n2 | t]) do
        n1 + n2 + calc(t)
    end

    def digit_sum(s) do
        s
        |> Integer.digits(10)
        |> Enum.sum
    end
end
