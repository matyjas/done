defmodule HelloPhoenix.HoursWorker do
	use GenServer
	alias HelloPhoenix.WakaTime
	
	def get(lang) do
		GenServer.call(lang, :get)
	end
	
	def start_link do
		GenServer.start_link __MODULE__, "Elixir", name: :elixir
	end

	def init(lang) do
		:erlang.send_after(1000, self, :refresh)
		{:ok, -1}
	end

	def handle_info(:refresh, state) do
		waka = WakaTime.get("users/current/stats/last_year").body
		|> Enum.flat_map_reduce(0, fn lang, acc -> 
			if lang["name"] == "Elixir", do: {[lang], lang["total_seconds"]}, else: {[lang], acc}
		end)
		|> elem(1)
		
		:erlang.send_after(1000, self, :refresh)
		{:noreply, waka}
	end

	def handle_call(:get, _from, state) do
		{:reply, state, state}
	end
end

