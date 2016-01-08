defmodule HelloPhoenix.HelloViewTest do
	use HelloPhoenix.ConnCase, async: true
	alias HelloPhoenix.WakaTimeElixir

	test "no nothing" do
		assert WakaTimeElixir.seconds([]) == 0
	end

	test "4 5 seconds from wilding" do
		assert WakaTimeElixir.seconds([%{"name"=>"Elixir", 
																		 "total_seconds"=>45}]) == 45
	end

	test "test list with more languages" do
		assert WakaTimeElixir.seconds([%{"name"=>"Elixir", 
																		 "total_seconds"=>45},
																	 %{"name"=>"Delphi",
																	"total_seconds"=>"1"}]) == 45
	end

	test "regular .flat_map_reduce for reference" do
		assert Enum.flat_map_reduce(1..100, 0, fn i, acc ->
      if acc < 3, do: {[i], acc + 1}, else: {:halt, acc}
    end) == {[1, 2, 3], 3}
	end
end
