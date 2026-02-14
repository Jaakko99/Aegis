defmodule AegisWeb.PageController do
  use AegisWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
