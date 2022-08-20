defmodule SplitByDict do
  @moduledoc """
  A string splitter by a list as a dictionary.

  @shoz-f provided this problem: https://twitter.com/ShozF/status/1560820784188116993
  """

  @doc """
  Splits the given `str` by `dict`.

  ## Examples
      iex> SplitByDict.split_by_dict("abcdefabcdf", ["abcabc", "abcdef"])
      ["abcdef", "abcdf"]

      iex> SplitByDict.split_by_dict("abcdefabcdf", ["abc", "abcabc", "abcdef"])
      ["abcdef", "abc", "df"]

      iex> SplitByDict.split_by_dict("abcdefabcabc", ["abc", "abcabc", "abcdef"])
      ["abcdef", "abcabc"]
  """
  @spec split_by_dict(String.t(), list(String.t())) :: list(String.t())
  def split_by_dict(str, dict) do
    dict = Enum.sort(dict)

    regex =
      Enum.reduce(dict, {"", [], []}, fn
        x, {acc, [], []} -> {x <> acc, [x], [x]}
        x, {acc, r, acc_str_l} -> reducer(x, {acc, r, acc_str_l})
      end)
      |> elem(0)
      |> Regex.compile!()

    Regex.split(regex, str, include_captures: true, trim: true)
  end

  defp reducer(x, {acc, r, []}), do: {x <> "|" <> acc, r, []}

  defp reducer(x, {acc, [_ | rt] = r, [acc_str_head | acc_str_tail] = acc_str_l}) do
    if String.starts_with?(x, acc_str_head) do
      t = String.slice(x, String.length(acc_str_head), String.length(x))
      {x <> "|" <> acc, [t | r], [x | acc_str_l]}
    else
      reducer(x, {acc, rt, acc_str_tail})
    end
  end

  @doc """
  Returns a list of strings that accumurates the given `str_list`.

  ## Examples

      iex> SplitByDict.acc_str_list(["abc", "def"])
      ["abc", "abcdef"]
  """
  @spec acc_str_list(list(Stiring.t())) :: list(String.t())
  def acc_str_list(str_list) do
    str_list
    |> Enum.scan("", fn x, acc ->
      acc <> x
    end)
  end
end
