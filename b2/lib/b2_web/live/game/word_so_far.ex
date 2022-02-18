defmodule B2Web.Live.Game.WordSoFar do
  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    In word so far
    """
  end
end
