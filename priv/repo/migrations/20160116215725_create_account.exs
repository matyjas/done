defmodule HelloPhoenix.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :token, :string
      add :client_id, :string
      add :secret, :string

      timestamps
    end

  end
end
