defmodule Dictionary.Runtime.Application do

  use Application

  def start(_type, _args) do
    # We are forced by design to pass an initial value here
    # You may want to read the file and pass the data here
    Dictionary.Runtime.Server.start_link([])
  end
end
