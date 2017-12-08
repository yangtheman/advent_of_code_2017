defmodule InverseCaptchaHalfway do
  @moduledoc """
  Documentation for InverseCaptchaHalfway.
  """

  @doc """
  process/1(string)

  ## Examples

      iex> InverseCaptchaHalfway.process("1212")
      6

      iex> InverseCaptchaHalfway.process("1221")
      0

      iex> InverseCaptchaHalfway.process("123425")
      4

      iex> InverseCaptchaHalfway.process("123123")
      12

      iex> InverseCaptchaHalfway.process("12131415")
      4
  """
  def process(string) do
    count(0, 0, String.length(string), string)
  end

  defp count(sum, index, length, _) when index == length do
    sum
  end

  defp count(sum, index, length, string) do
    calculate_sum(sum, index, length, string) |> count(index + 1, length, string)
  end

  defp calculate_sum(sum, index, length, string) do
    char = String.at(string, halfway_position(index, length))
    if String.at(string, index) == char, do: sum + String.to_integer(char), else: sum
  end

  defp halfway_position(index, length) do
    step_index = index + Integer.floor_div(length, 2)
    if step_index > length - 1, do: step_index - length, else: step_index
  end
end
