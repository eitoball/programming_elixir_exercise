defmodule OtpServers1 do
  use GenServer

  def handle_call(:pop, _, [head|tail]) do
    { :reply, head, tail }
  end
end
