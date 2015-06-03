defmodule Graph do
  require IEx 
  IEx.pry

  def dummy do
    Parse.readFile("tree.ex")
  end

  def parse_node(node, elements) do

    if is_atom(node) do
      elements = [node] ++ elements
    end
    if is_tuple(node) do
      if is_atom( elem(node, 0)) do
        # IO.puts elem(node, 0)
      end
      if is_tuple(elem(node,0)) do
        IO.puts "Function call"
        x =elem(node,0)
      end

      elements = [elem(node, 0)] ++ elements
      ts = tuple_size(node) - 1
      new_node = elem(node, ts)
      
      parse_node(new_node, elements)
    else if is_list(node) do
      parse_list(node, elements)
      end
    end
  end

  def parse_list(nodes, results) do
    if length(nodes) == 1 do
      parse_node(hd(nodes), results)
    else if length(nodes) > 1 do
      parse_list(tl(nodes), results)
      parse_node(hd(nodes), results)
      end
    end
  end

  def run(result) do 
    Graph.dummy()
    Graph.parse_node(Graph.dummy, result)
  end

end

result = []
Graph.run(result)
Enum.map(result, fn x -> IO.puts x end)
