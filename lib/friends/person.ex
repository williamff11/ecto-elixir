defmodule Friends.Person do
  use Ecto.Schema

  import Friends

  import Ecto.Changeset

  @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]

  schema "people" do
    field(:name, :string)
    field(:age, :integer, default: 0)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
    |> validate_length(:name, min: 2)
    |> validate_inclusion(:name, @fictional_names)
    |> Friends.Repo.insert!()
  end

  def registration_changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> set_name_if_anonymous()
  end

  # defp validate_fictional_name(changeset) do
  #   name = get_field(changeset, :name)

  #   if name in @fictional_names do
  #     changeset
  #   else
  #     add_error(changeset, :name, "is not a superhero")
  #   end
  # end

  defp set_name_if_anonymous(changeset) do
    name = get_field(changeset, :name)

    if is_nil(name) do
      put_change(changeset, :name, "Anonymous")
    else
      changeset
    end
  end
end
