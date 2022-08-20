defmodule Generator do
  def randstr(length), do: _randstr([], length)

  defp _randstr(list, length) when length(list) >= length, do: Enum.join(list)

  defp _randstr(list, length) when length(list) < length do
    char =
      "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      |> String.codepoints()
      |> Enum.take_random(1)
      |> List.first()

    _randstr([char | list], length)
  end

  def generate(length, size) do
    {
      randstr(length),
      1..size |> Enum.map(fn _ -> randstr(:rand.uniform(length)) end)
    }
  end
end

Benchee.run(
  %{
    "SplitByDict" => fn {str, dict} ->
      try do
        SplitByDict.split_by_dict(str, dict)
        :ok
      rescue
        Regex.CompileError ->
          Process.sleep(3000)
          :error
      end
    end
  },
  inputs: %{
    "Small" => {
      "abcdefabcabc",
      ["abcdef", "abc", "abcabc"]
    },
    "100, 10" => Generator.generate(100, 10),
    "100, 100" => Generator.generate(100, 100),
    "1000, 10" => Generator.generate(1000, 100),
    "1000, 100" => Generator.generate(1000, 100),
    "1000, 1000" => Generator.generate(1000, 1000),
  },
  after_each: fn result ->
    unless result == :ok do
      IO.inspect(result)
    end
  end
)
