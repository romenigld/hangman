defmodule Procs do
  def hello(count) do
    receive do
      {:crash, reason} ->
        exit(reason)

      {:quit} ->
        IO.puts "I'm outta here"

      {:add, n} ->
        hello(count + n)

      {:reset} ->
        hello(count = 0)
      msg ->
        IO.puts("#{count}: Hello #{inspect msg}")
        hello(count)
    end
  end
end
