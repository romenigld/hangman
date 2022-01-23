defmodule Cache.Runtime.Application do
  use Application

  def start(_type, _args) do
    Cache.Runtime.Server.start_link(0)
  end
end
