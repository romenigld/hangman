defmodule Cache.Impl.CachedFib do
  @type t :: Integer.t()

  alias Cache.Runtime.Server

  @spec fib(t) :: t
  def fib(n) do
    Server.start_link(fn cache ->
      cached_fib(n, cache)
    end)
  end

  defp cached_fib(n, cache) do
    Server.lookup(cache, n, fn ->
      cached_fib(n - 2, cache) + cached_fib(n - 1, cache)
    end)
  end
end
