defmodule Fibonacci do
  alias Cache.Runtime.CachedFib

  @type n :: Integer.t

  @spec fib(n) :: Integer.t
  defdelegate fib(n), to: CachedFib

end
