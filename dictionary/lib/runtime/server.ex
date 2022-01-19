defmodule Dictionary.Runtime.Server do

  use Agent

  @type t :: pid()

  @me __MODULE__

  alias Dictionary.Impl.WordList

  # _initial_value is not used but it is mandatory to define it
  def start_link(_initial_value) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    Agent.get(@me, &WordList.random_word/1)
  end
end
