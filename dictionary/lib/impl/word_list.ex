defmodule Dictionary.Impl.WordList do
  @word_list "assets/words.txt"

  def start do
    word_list(@word_list)
  end

  def word_list(file) do
    file
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def random_word(word_list) do
    word_list
    |> Enum.random()
  end
end
