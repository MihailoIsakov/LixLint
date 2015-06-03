defmodule Graph do

  def dummy do
    Parse.readFile("tree.ex")
  end

  def parse_point({func, meta, arg}) do
    if is_tuple func do
      #IO.puts "function"
    end
    [func] ++ parse_point(arg)
  end
  def parse_point({func, arg}) do
    [func] ++ parse_point(arg)
  end
  def parse_point([h|t]) do
    parse_list([h|t])
  end
  def parse_point(something) do
    [something]
  end
    

  def parse_list([]), do: []
  def parse_list([head|tail]) do
    parse_point(head) ++ parse_point(tail)
  end

  def run() do 
    Graph.dummy()
    result = Graph.parse_point(Graph.dummy)
    IO.inspect result
  end

end

dummy = Graph.dummy()

#{:ok, file} = File.open "out.txt", [:write]
#IO.binwrite file, dummy
#File.close file
