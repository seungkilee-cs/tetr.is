defmodule TetrIsWeb.PageController do
  use TetrIsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
