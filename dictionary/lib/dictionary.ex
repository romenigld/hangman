defmodule Dictionary do
  @word_list "assets/words.txt"
      |> File.read!()
      |> String.split(~r/\n/, trim: true)

  def random_words do
    @word_list
    |> Enum.random()
  end
end
