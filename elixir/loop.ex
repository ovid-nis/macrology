defmodule Loop do

	run_loop = fn ->
		pid = spawn(fn -> :timer.sleep(4000) end)
	Loop.while Process.alive?(pid) do
			IO.puts "#{inspect :erlang.time} Stayin' alive!"
			:timer.sleep 1000
		end
	end


	defmacro while(expression, do: block) do
		quote do
			try do
				for _ <- Stream.cycle([:ok]) do
					if unquote(expression) do
						unquote(block)
					else
						throw :break
					end
				end
			catch
				:break -> :ok
			end
		end
	end
	def break, do: throw :break
end
