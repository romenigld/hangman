defmodule Fibonacci do

  @type n :: Integer.t

  @spec fib(n) :: Integer.t
  defdelegate fib(n), to: Cache

end
