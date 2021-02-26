defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table: accounts do
      add :balance, :decimal #Utilizamos decimal especificamente para valores monetários
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
          # A constraint extende funcionalidades ao nosso banco de dados
    create constraint(:accounts, :blance_must_be_positive_or_zero, check: "balance >= 0")
  end
end
