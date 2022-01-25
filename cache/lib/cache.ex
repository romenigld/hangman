defmodule Cache do
  alias Cache.Impl.CachedFib

  defdelegate fib(n), to: CachedFib
end
