defmodule Friends.Movie do
  use Ecto.Schema

  import Ecto.Changeset

  schema "movies" do
    field :title, :string
    field :tagline, :string
    has_many :characters, Friends.Character
    has_one :distributor, Friends.Distributor
    many_to_many :actors, Friends.Actor, join_through: "movies_actors"
  end

  def changeset(struct, params) do
    struct
    |>cast(params, [:title, :tagline])
    |>validate_required([:title, :tagline])
    |>validate_length(:title, min: 2)
    |>validate_length(:tagline, min: 10, max: 15)
    |>Friends.Repo.insert()
  end
end
