defmodule AssocEnums.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :kind, :string
      add :level, :string
      add :shift, :string
      add :campus_id, references(:campus, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:courses, [:campus_id])
  end
end
