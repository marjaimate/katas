defmodule Checkout do
  @pricelist %{
    "A" => 50,
    "B" => 30,
    "C" => 20,
    "D" => 15,
    "E" => 75,
    "F" => 20,
    "G" => 10
  }
  @discounts %{
    "A" => {3, 130},
    "B" => {2, 45},
    "E" => {2, 120}
  }
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def scan_item(account, i) do
    Agent.update(account, fn(state) -> Map.update(state, i, 1, &(&1 + 1)) end)
  end

  def scan_items(_account, []), do: :ok

  def scan_items(account, [i | tail]) do
    scan_item(account, i)
    scan_items(account, tail)
  end

  def get_bill(account) do
    Agent.get(account, &(&1))
    |> Map.to_list
    |> List.foldl(0, &get_price/2)
  end

  defp get_price {item, quantity}, sum do
    sum + apply_discount(item, quantity)
  end

  defp apply_discount(item, quantity) do
    price = Map.get(@pricelist, item)
    {modulo, discount_price} = Map.get(@discounts, item, {1, price})

    (discount_price * div(quantity, modulo)) + (price * rem(quantity, modulo))
  end
end

