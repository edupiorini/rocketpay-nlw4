defmodule Rocketpay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rocketpay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User


    timestamps()

  end
#este é um changeset de update
#ao contrário do de criação, ele não inicia um com uma struct vazia, mas com uma struct já preenchida
#assim o cast só irá fazer o cast do que muda e não do que já era existente

# o \\ é um argumento default que diz à função para ela iniciar com a struct preenchida,
# mas se não houver uma struct definida, inicie como uma struct vazia
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)
  end
end
