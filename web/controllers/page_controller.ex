defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
		conn
		|> put_flash(:info, "Welcome to Phoenix, from flash info!")
		|> put_flash(:error, "fake error")
		|> render("index.html")
  end
end
