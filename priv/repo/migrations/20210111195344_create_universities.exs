defmodule AssocEnums.Repo.Migrations.CreateUniversities do
  use Ecto.Migration

  def change do
    create table(:universities, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :logo_url, :string
      add :name, :string
      add :score, :decimal

      timestamps()
    end
    create(unique_index(:universities, [:name]))
  end
end
