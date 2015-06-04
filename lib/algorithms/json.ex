defmodule Json do
  
  def encode(tuple) when is_tuple(tuple) do
    list = Tuple.to_list(tuple)
    "{ " <> pack_tuple(0, list) <> " }"
  end 

  def encode([]), do: "[]"

  def encode(list) when is_list(list) do
    "[" <>
    Enum.reduce(tl(list), encode(hd(list)), 
      fn(x, acc) -> acc <> ", " <> encode x end)
    <> "]"
  end

  def encode(num) when is_number num do
    to_string num
  end 

  def encode(atom) when is_atom(atom) do
    "\"" <> to_string(atom) <> "\""
  end 

  def encode(string) when is_bitstring(string) do
    "\"" <> string <> "\""
  end

  def encode(any) do
    IO.inspect any
    raise ArgumentError, message: "Unmatched data type"
  end

  defp pack_tuple(counter, tuple_list) when length(tuple_list) == 1 do
    "\"" <> to_string(counter) <> "\": " <> encode(hd(tuple_list)) 
  end

  defp pack_tuple(counter, tuple_list) do
    str = "\"" <> to_string(counter) <> "\": " <> encode(hd(tuple_list)) <> ", "
    str <> pack_tuple(counter+1, tl(tuple_list))
  end

end


defmodule TypeStack do

  def print(element, space \\ 0)

  def print(tuple, space) when is_tuple(tuple) do
    IO.write indent space 
    IO.puts "tuple" 
    Enum.map(Tuple.to_list(tuple), fn x -> print(x, space+1) end)
  end

  def print(list, space) when is_list(list) do
    IO.write indent space
    IO.puts "list"
    Enum.map(list, fn x -> print(x, space+1) end)
  end
  
  def print(num, space) when is_number(num) do
    IO.write indent space
    IO.puts "number"
  end

  def print(atom, space) when is_atom(atom) do
    IO.write indent space  
    IO.puts "atom"
  end

  def print(string, space) when is_bitstring(string) do
    IO.write indent space
    IO.puts "string"
  end

  def print(any, space) do
    raise ArgumentError, message: "Unmatched data type!"
  end

  defp indent(num) do
    String.duplicate("  ", num)
  end
end


defmodule Typer do

  def print(element) when is_tuple(element) do
    IO.write "{ "
    Enum.map(Tuple.to_list(element), fn x-> IO.write(get_type(x) <> ", ") end)
    IO.puts " }"
    Enum.map(Tuple.to_list(element), fn x-> print(x) end)
  end

  def print(element) when is_list(element) do
    IO.write "[ "
    Enum.map(element, fn x-> IO.write(get_type(x) <> ", ") end)
    IO.puts " ]"
    Enum.map(element, fn x-> print(x) end)
  end

  def print(element) do
  end

  def get_type(element) when is_tuple(element), do: "tuple"
  def get_type(element) when is_list(element), do: "list"
  def get_type(element) when is_atom(element), do: "atom"
  def get_type(element) when is_bitstring(element), do: "string"
  def get_type(element) when is_number(element), do: "number" 

end
