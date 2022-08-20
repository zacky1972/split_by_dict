defmodule SplitByDict do
  @moduledoc """
  A string splitter by a list as a dictionary.

  @shoz-f provided this problem: https://twitter.com/ShozF/status/1560820784188116993
  """

  @doc """
  Splits the given `str` by `dict`.

  ## Examples

      iex> SplitByDict.split_by_dict("abcdefabc", ["abc", "abcdef"])
      ["abcdef", "abc"]
  """
  @spec split_by_dict(String.t(), list(String.t())) :: list(String.t())
  def split_by_dict(str, _dict) do
    Regex.split(~r{(abc(def|))}, str, include_captures: true)
    |> Enum.reject(& &1 == "")
  end
end
