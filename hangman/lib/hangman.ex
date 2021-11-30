defmodule Hangman do
  alias Hangman.Impl.Game

  @type   state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
  @opaque game  :: Game.t # '@opaque' the internals of the type should remain private from anyone who imports it.
  @type   tally :: %{
    turns_left: integer,
    game_state: state,
    letters: list(String.t),
    used: list(String.t)
  }

  @spec new_game() :: game
  defdelegate new_game, to: Game
  # defdelegate is the same as the code underneath
  # def new_game do
  #   Game.new_game
  # end

  @spec make_move(game, String.t) :: {game, tally}
  def make_move(_game, _guess) do
  end
end
