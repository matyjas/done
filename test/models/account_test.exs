defmodule HelloPhoenix.AccountTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Account

  @valid_attrs %{client_id: "some content", name: "some content", secret: "some content", token: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Account.changeset(%Account{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Account.changeset(%Account{}, @invalid_attrs)
    refute changeset.valid?
  end
end
