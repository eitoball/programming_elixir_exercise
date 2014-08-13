defmodule OtpServers2 do
  use GenServer

  def handle_call(:pop, _, [head|tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, item}, stack) do
    { :noreply, [item|stack] }
  end
end
