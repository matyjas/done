defmodule HelloPhoenix.HelloController do
	use HelloPhoenix.Web, :controller
	alias HelloPhoenix.WakaTime

	def index(conn, _params) do
		#		waka = WakaTime.get("users/current/stats/last_year").body
		waka = HelloPhoenix.HoursWorker.get(:elixir)
		render conn, "index.html", waka: waka
	end

	def show(conn, %{"messenger" => messenger}) do
		render conn, "show.html", messenger: messenger
	end
end

# things => books read, code written, tasks done, articles read
# sources => goodreads, wakatime, toodledo, pocket

