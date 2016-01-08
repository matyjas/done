defmodule HelloPhoenix.Account do
  use HelloPhoenix.Web, :model

  schema "accounts" do
    field :name, :string
    field :token, :string
    field :client_id, :string
    field :secret, :string

    timestamps
  end

  @required_fields ~w(name token client_id secret)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
