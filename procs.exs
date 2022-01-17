defmodule Procs do
  def hello(count) do
    receive do
      {:quit} ->
        IO.puts "I'm outta here"

      {:add, n} ->
        hello(count + n)

      msg ->
        IO.puts("#{count}: Hello #{inspect msg}")
        hello(count)
    end
  end
end
