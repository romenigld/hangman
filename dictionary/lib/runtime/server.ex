defmodule Dictionary.Runtime.Server do
  use Agent

  @type t :: pid()

  @me __MODULE__

  alias Dictionary.Impl.WordList

  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    # it will kill the process if the random number in erlang is less than 0.33
    # if :rand.uniform < 0.33 do
    #   Agent.get(@me, fn _ -> exit(:boom) end)
    # end

    Agent.get(@me, &WordList.random_word/1)
  end
end
