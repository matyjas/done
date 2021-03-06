defmodule HelloPhoenix.WakaTime do
 use HTTPotion.Base

 def process_url(slug) do
	 "https://wakatime.com/api/v1/" <> slug <> "?api_key=" <> wakatime_api_key
 end

 def process_response_body(body) do
	 body
#	 |> IO.inspect
	 |> Poison.decode!
	 |> Map.get("data")
#	 |> Map.get("languages")
	 |> Enum.filter(fn({k, _}) -> k == "languages" end)
	 |> Enum.fetch(0)
	 |> elem(1)
	 |> elem(1)
#	 |> Enum.map(fn(lang) -> Enum.filter(lang, fn({k,v}) -> (k == "name") end) end)
#	 |> Enum.map(fn(l) -> Enum.find_value(l, fn({k,v}) -> if(k == "name") do v end end) end)
 end

 defp wakatime_api_key do
	 case System.get_env("WAKATIME_API_KEY") do 
		 nil -> raise("need that Wakatime API key")
		 wakatime_api_key -> wakatime_api_key
	 end
 end
end
