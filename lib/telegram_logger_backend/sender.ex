defmodule LoggerTelegramBackend.Sender do
  @moduledoc false

  use GenStage

  alias LoggerTelegramBackend.Formatter

  def start_link(args) do
    GenStage.start_link(__MODULE__, args, name: __MODULE__)
  end

  # Callbacks

  def init([min_demand, max_demand]) do
    {:consumer, %{}, subscribe_to: [{Formatter, min_demand: min_demand, max_demand: max_demand}]}
  end

  def handle_events(events, _from, state) do
    process_events(events, state)
  end

  # Private

  defp process_events([], state) do
    {:noreply, [], state}
  end

  defp process_events([{sender, sender_args, text} | events], state) do
    apply(sender, :send_message, [text] ++ sender_args)
    process_events(events, state)
  end
end
