# SplitByDict

A string splitter by a list as a dictionary.

@shoz-f provided this problem: https://twitter.com/ShozF/status/1560820784188116993

## Usage

See `SplitByDict.split_by_dict/2`.
This uses `Enum.reduce/3` with `reducer`, `Regex.compile!/2`, and `Regex.split/3`.

### Benchmarks of `SplitByDict.split_by_dict/2`

Run `mix run -r bench/split_by_dict_bench.exs`, and get results similar to the following:

```
% mix run -r bench/split_by_dict_bench.exs
Operating System: macOS
CPU Information: Apple M1
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.14.0-rc.1
Erlang 25.0.3

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: 100, 10, 100, 100, 1000, 10, 1000, 100, 1000, 1000, Small
Estimated total run time: 42 s

Benchmarking SplitByDict with input 100, 10 ...
Benchmarking SplitByDict with input 100, 100 ...
Benchmarking SplitByDict with input 1000, 10 ...
:error
:error
:error
Benchmarking SplitByDict with input 1000, 100 ...
:error
:error
:error
Benchmarking SplitByDict with input 1000, 1000 ...
:error
:error
:error
Benchmarking SplitByDict with input Small ...

##### With input 100, 10 #####
Name                  ips        average  deviation         median         99th %
SplitByDict       32.78 K       30.50 μs    ±63.08%       28.58 μs       83.50 μs

##### With input 100, 100 #####
Name                  ips        average  deviation         median         99th %
SplitByDict        3.55 K      281.82 μs     ±1.99%      283.83 μs      290.38 μs

##### With input 1000, 10 #####
Name                  ips        average  deviation         median         99th %
SplitByDict          0.33         3.00 s     ±0.05%         3.00 s         3.00 s

##### With input 1000, 100 #####
Name                  ips        average  deviation         median         99th %
SplitByDict          0.33         3.00 s     ±0.01%         3.00 s         3.00 s

##### With input 1000, 1000 #####
Name                  ips        average  deviation         median         99th %
SplitByDict          0.33         3.05 s     ±0.10%         3.05 s         3.05 s

##### With input Small #####
Name                  ips        average  deviation         median         99th %
SplitByDict      100.39 K        9.96 μs   ±849.48%        5.96 μs       10.71 μs
```

## License

Copyright (c) 2022 University of Kitakyushu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


