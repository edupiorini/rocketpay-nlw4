defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  #Vamos dizer que temos um fallback controller através do comando abaixo
  action_fallback RocketpayWeb.FallbackController


  #with é um pattern matching também
  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

end
