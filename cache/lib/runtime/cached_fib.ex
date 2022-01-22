defmodule Cache.Runtime.CachedFib do
  alias Cache.Runtime.Server

  def fib(n) do
    Server.run(fn cache ->
      cached_fib(n, cache)
    end)
  end

  defp cached_fib(n, cache) do
    Server.lookup(cache, n, fn ->
      cached_fib(n-2, cache) + cached_fib(n-1, cache)
    end)
  end
end
