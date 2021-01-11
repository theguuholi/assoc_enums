defmodule AssocEnums.Repo.Migrations.CreateCampus do
  use Ecto.Migration

  def change do
    create table(:campus, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :city, :string
      add :university_id, references(:universities, on_delete: :nilify_all, type: :binary_id)

      timestamps()
    end

    create index(:campus, [:university_id])
  end
end
