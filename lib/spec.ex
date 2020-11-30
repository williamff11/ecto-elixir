defmodule Spec do

  @spec sum_project(integer) :: integer
  def sum_project(a) do
    [1,2,3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
  end
end
