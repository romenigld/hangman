defmodule B1Web.PageView do
  use B1Web, :view

  def plural_phrase(1, noun), do: "1 #{noun}"
  def plural_phrase(n, noun) when (n < 0) do
    "<span style='color: red'>
      #{n} #{noun}
    </span>"
    |> raw()
  end
  def plural_phrase(n, noun), do: "#{n} #{noun}s"
end
