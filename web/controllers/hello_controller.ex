defmodule HelloPhoenix.HelloController do
	use HelloPhoenix.Web, :controller
	alias HelloPhoenix.WakaTime

	def index(conn, _params) do
		waka = WakaTime.get("users/current/stats/last_year").body
		render conn, "index.html", waka: waka
	end

	def show(conn, %{"messenger" => messenger}) do
		render conn, "show.html", messenger: messenger
	end
end

defmodule HelloPhoenix.WakaTime do
 use HTTPotion.Base

 def process_url(slug) do
	 "https://wakatime.com/api/v1/" <> slug <> "?api_key=" <> System.get_env("WAKATIME_API_KEY")
 end

 def process_response_body(body) do
	 IO.inspect(body)
	 body
	 |> IO.iodata_to_binary
#	 |> JSX.decode
#	 |> elem(1)
#	 |> Poison.decode!(as: %{"data" => [%{"languages"=>[Lang]}]})
	 |> Poison.Parser.parse!
	 |> Map.get("data")
#	 |> Map.get("languages")
	 |> Enum.filter(fn({k, _}) -> k == "languages" end)
	 |> Enum.fetch(0)
	 |> elem(1)
	 |> elem(1)
#	 |> Enum.map(fn(lang) -> Enum.filter(lang, fn({k,v}) -> (k == "name") end) end)
#	 |> Enum.map(fn(l) -> Enum.find_value(l, fn({k,v}) -> if(k == "name") do v end end) end)
 end
end

# things => books read, code written, tasks done, articles read
# sources => goodreads, wakatime, toodledo, pocket

