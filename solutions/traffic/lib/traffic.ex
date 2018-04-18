defmodule Traffic do
  def test() do
    Traffic.TrafficLights.process_queue
    gen_cars(10)
  end

  def gen_cars(0), do: :ok
  def gen_cars(n) do
    gen_car()
    gen_cars(n - 1)
  end

  def gen_car do
    car = spawn Traffic.Car, :start, []
    lights = [:a, :b] |> Enum.random
    Traffic.TrafficLights.queue_car lights, car
  end
end
