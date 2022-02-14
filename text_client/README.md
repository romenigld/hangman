# TextClient

For run the hangman application in a node mode with the terminal tab

```elixir
iex --sname hangman -S mix
```

and in another terminal tab or computer:

```elixir
iex --sname c2 -S mix
Node.connect :"hangman@<name-node>"
Node.list
TextClient.start
```
