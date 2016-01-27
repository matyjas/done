defmodule HelloPhoenix.HelloView do
	use HelloPhoenix.Web, :view
	alias HelloPhoenix.WakaTimeElixir
	alias HelloPhoenix.PercentOfFifty

	def percentOf50HoursOfElixir(waka) do
		waka
		|> IO.inspect
		|> WakaTimeElixir.seconds
		|> PercentOfFifty.seconds
#		div(WakaTimeElixir.seconds(waka) * 100, 180000)
	end

	def secondsOfElixir(assigns) do
		WakaTimeElixir.seconds(assigns[:waka])
	end
end

defmodule HelloPhoenix.WakaTimeElixir do

	def seconds(waka) do
		waka
#		|> Enum.flat_map_reduce(0, fn lang, acc -> 
#			if lang["name"] == "Elixir", do: {[lang], lang["total_seconds"]}, else: {[lang], acc}
#		end)
#		|> elem(1)
	end

end
