defmodule HelloPhoenix.Hours.HoursController do
	use HelloPhoenix.Web, :controller
	alias HelloPhoenix.HoursWorker
	alias HelloPhoenix.PercentOfFifty
	
	def index(conn, %{"lang" => lang}) do
		percent = lang
		|> String.to_existing_atom
		|> HoursWorker.get
		|> PercentOfFifty.seconds
		
		json conn, %{"postfix" => "%", "data" => %{"value" => percent}}
	end
end
