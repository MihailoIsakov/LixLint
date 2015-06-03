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

