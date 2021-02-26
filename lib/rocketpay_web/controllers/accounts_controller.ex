defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account

  #Vamos dizer que temos um fallback controller através do comando abaixo
  action_fallback RocketpayWeb.FallbackController


  #with é um pattern matching também
  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      conn
    end
  end

end
