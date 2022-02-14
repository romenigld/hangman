defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game
  @typep tally :: Hangman.tally
  @typep state :: { game, tally }

  @spec start(game) :: :ok
  def start(game) do
    tally = Hangman.tally(game)
    interact({ game, tally })
  end

  @spec interact(state) :: :ok
  def interact({_game, tally = %{ game_state: :won}}) do
    IO.puts [
      colorize(:blink_slow, colorize(:yellow, "Congratulations. You won!")),
      colorize(:yellow, "\nThe word is \'"),
      colorize(:green_background,"#{tally.letters}"),
      colorize(:yellow, "\'.")
    ]
  end

  def interact({_game, tally = %{ game_state: :lost}}) do
    IO.puts [
      colorize(:blink_slow, colorize(:red, "Sorry, you lost...")),
      colorize(:red, "\nThe correct word was \'"),
      colorize(:red_background,"#{tally.letters |> Enum.join}"),
      colorize(:red, "\'.")
    ]
  end

  def interact({ game, tally }) do
    IO.puts [feedback_for(tally)]
    IO.puts current_word(tally)
    tally = Hangman.make_move(game, get_guess())
    interact({ game, tally })
  end

  def get_guess() do
    IO.gets(colorize(:green, "Next letter: "))
    |> String.trim()
    |> String.downcase()
  end

  def current_word(tally) do
   [
    colorize(:green, "Word so far: "), tally.letters |> Enum.join(" "),
    colorize(:green, "   (turns left: "),
    colorize(:black, colorize(:yellow_background, blink(tally.turns_left))),
    String.duplicate(" ", align(tally.turns_left)),
    colorize(:blue, " |"),
    colorize(:green," used so far:"),
    colorize(:cyan, " ["),
    colorize(:magenta, tally.used |> Enum.join(",")),
    colorize(:cyan, " ]"),
    colorize(:green, ")")
   ]
  end

  def feedback_for(tally  = %{ game_state: :initializing }), do: [colorize(:blue, "Welcome! \nI'm thinking of a "), colorize(:blue_background, " #{tally.letters |> length} "), colorize(:blue, " letter word.")]
  def feedback_for(_tally = %{ game_state: :good_guess }),   do: colorize(:cyan, "Good guess!")
  def feedback_for(_tally = %{ game_state: :bad_guess }),    do: colorize(:red, "Sorry, that letter's not in the word.")
  def feedback_for(_tally = %{ game_state: :already_used }), do: colorize(:magenta, "You already used that letter.")

  def colorize(type_color, string) do
    IO.ANSI.format([type_color, string])
  end

  def blink(turns_l) do
    {turns_l, turns_l |> to_string}
    |> blink2()
  end

  def blink2({1, string}), do: colorize(:blink_slow, string)
  def blink2({n, string}), do: colorize(:blink_off, string <> String.duplicate(" ", n))

  defp align(7), do: 0
  defp align(6), do: 1
  defp align(5), do: 2
  defp align(4), do: 3
  defp align(3), do: 4
  defp align(2), do: 5
  defp align(1), do: 7
end
