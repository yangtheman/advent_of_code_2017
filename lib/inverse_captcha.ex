defmodule InverseCaptcha do
  @moduledoc """
  Documentation for InverseCaptcha.
  """

  @doc """
  process/1(string)

  ## Examples

      iex> InverseCaptcha.process("1122")
      3

      iex> InverseCaptcha.process("1111")
      4

      iex> InverseCaptcha.process("1234")
      0

      iex> InverseCaptcha.process("91212129")
      9
  """
  def process(string) do
    count(0, String.at(string, 0), String.split(string, "", trim: true))
  end

  defp count(sum, first, [head | tail]) when tail == [] do
    calculate_sum(head, first, sum) |> count(first, tail)
  end

  defp count(sum, first, [head | tail]) do
    calculate_sum(head, List.first(tail), sum) |> count(first, tail)
  end

  defp count(sum, _, []) do
    sum
  end

  defp calculate_sum(head, value, sum) do
    if head == value, do: sum + String.to_integer(head), else: sum
  end
end
