# Traffic

Traffic management simulation - [see this kata description](../../katas/5-traffic-lights.md)

## Run the app

```bash
traffic (master) $ iex -S mix
Erlang/OTP 20 [erts-9.3] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [kernel-poll:false]

Compiling 2 files (.ex)
Interactive Elixir (1.6.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Traffic.test
:ok
iex(2)> Traffic.TrafficLights.next_sequence
#PID<0.129.0> moving through a
%{a: :green, b: :red}
#PID<0.132.0> moving through a
#PID<0.133.0> moving through a
#PID<0.135.0> moving through a
iex(3)> Traffic.TrafficLights.next_sequence
%{a: :red, b: :red}
iex(4)> Traffic.TrafficLights.next_sequence
#PID<0.130.0> moving through b
%{a: :red, b: :green}
#PID<0.131.0> moving through b
#PID<0.134.0> moving through b
#PID<0.136.0> moving through b
iex(5)> Traffic.TrafficLights.next_sequence
%{a: :red, b: :red}
iex(6)> Traffic.TrafficLights.next_sequence
#PID<0.137.0> moving through a
%{a: :green, b: :red}
#PID<0.138.0> moving through a
iex(7)>
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `traffic` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:traffic, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/traffic](https://hexdocs.pm/traffic).

