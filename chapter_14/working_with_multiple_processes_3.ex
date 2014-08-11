defmodule WorkingWithMultipleProcesses3 do
  def normal_method(parent_pid) do
    send parent_pid, "Hello from normal method"
    exit(:normal)
  end

  def run do
    spawn_link(WorkingWithMultipleProcesses3, :normal_method, [self])

    :timer.sleep 500

    receive_message
  end

  defp receive_message do
    receive do
      msg ->
        IO.puts "Message: #{msg}"
    end
    receive_message
  end
end

WorkingWithMultipleProcesses3.run
