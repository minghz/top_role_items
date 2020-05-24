defmodule TopRoleItemsWeb.PageController do
  use TopRoleItemsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
