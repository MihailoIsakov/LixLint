defmodule Indent do
  def indent(file_name) do
    {_, content} = File.read file_name
    content_list = to_char_list content
    if (has_tab(content_list)) do
      IO.puts "Warning: has tabs"
    end
    IO.puts "{Indent, Line}"
    line_by_line(content_list, true, 0, <<>>)
  end
  
  defp line_by_line(content, ws_count, count, accumulator) when content != [] do
    retval = []
    case hd(content) do
      10 -> #New line
        ws_count = true
        retval = [{count, to_string(accumulator)}]
        accumulator = ""
        count = 0
      32 -> #White space
      	accumulator = accumulator <> <<hd(content) :: utf8>>
        if ws_count do
          count = count + 1
        end
      _ ->
      	accumulator = accumulator <> <<hd(content) :: utf8>>
        ws_count = false
    end
    retval = retval ++ line_by_line(tl(content), ws_count, count, accumulator)
    retval
  end
  defp line_by_line(_, _, _, _) do end
  
  defp has_tab(string) when string != [] do
    string = to_char_list(string)
    retval = false
    x = hd(string)
    #Upper case or space
    if (x == 9) do
      retval = true
    else
      retval = has_tab(tl(string))
    end
    retval
  end
  defp has_tab(_) do false end
end
