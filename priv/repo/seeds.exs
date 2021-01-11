defmodule Insert do
  alias AssocEnums.Repo
  alias AssocEnums.University

  def build() do
    "db.json"
    |> File.read!()
    |> Jason.decode!()
    |> Enum.group_by(& &1["university"], &Map.delete(&1, "university"))
    |> Map.to_list()
    |> Enum.map(fn {university, campus} ->
      Map.put(university, "campus", campus |> build_campus())
    end)
    |> Enum.each(&insert/1)
  end

  defp insert(university) do
    %University{}
    |> University.changeset(university)
    |> Repo.insert()
  end

  defp build_campus(campus) do
    campus
    |> Enum.group_by(& &1["campus"], &build_offer_course/1)
    |> Map.to_list()
    |> Enum.map(fn {campus, courses} -> Map.put(campus, "courses", courses) end)
  end

  defp build_offer_course(scholarship) do
    course = Map.get(scholarship, "course")

    scholarship =
      scholarship
      |> Map.delete("campus")
      |> Map.delete("course")

    Map.put(course, "scholarships", [scholarship])
  end
end

Insert.build()
