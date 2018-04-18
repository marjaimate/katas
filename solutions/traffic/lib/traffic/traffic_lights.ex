defmodule Traffic.TrafficLights do
  use GenServer
  @sequence [
    %{a: :red, b: :red},
    %{a: :green, b: :red},
    %{a: :red, b: :red},
    %{a: :red, b: :green}
  ]

  ## Public
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  def queue_car(lights, car), do: GenServer.call(__MODULE__, {:queue, lights, car})
  def next_sequence(), do: GenServer.call(__MODULE__, :next_sequence)
  def process_queue(), do: GenServer.cast(__MODULE__, :process_queue)

  ## Private
  def init(_) do
    {:ok, %{a: [], b: [], sequence: @sequence, current: 0}}
  end

  def handle_call(:next_sequence, _from, %{sequence: sequence, current: current} = state) do
    {next, seq} = case Enum.at(sequence, current + 1) do
      nil -> {0, Enum.at(sequence, 0)}
      seq -> {current + 1, seq}
    end
    {:reply, seq, %{state | current: next}}
  end

  # Lights: :a / :b, car: PID
  def handle_call({:queue, lights, car}, _from, state) do
    state2 = Map.update(state, lights, [], fn(q) -> q ++ [car] end)
    {:reply, state2, state2}
  end

  def handle_cast(:process_queue, %{sequence: sequence, current: current} = state) do
    # process_queue(%{a: :green, b: :red}, %{a: [], b: []})
    new_state = process_queue(Enum.at(sequence, current), state)
    :timer.sleep(300)
    GenServer.cast(self(), :process_queue)
    {:noreply, new_state}
  end

  def process_queue(%{a: :red, b: :red}, state), do: state
  def process_queue(%{a: :green, b: :red}, %{a: []} = state), do: state
  def process_queue(%{a: :green, b: :red}, %{a: [car | tail]} = state) do
    send car, {:green, :a}
    %{state | a: tail}
  end

  def process_queue(%{b: :green, a: :red}, %{b: []} = state), do: state
  def process_queue(%{b: :green, a: :red}, %{b: [car | tail]} = state) do
    send car, {:green, :b}
    %{state | b: tail}
  end
end
