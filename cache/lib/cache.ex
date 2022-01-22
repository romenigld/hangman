defmodule Cache do
  alias Cache.Runtime.CachedFib

  defdelegate fib(n), to: CachedFib
end
