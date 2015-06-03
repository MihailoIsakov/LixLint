defmodule Notation do
  def is_snake_case(string) when string != [] do
    string = to_char_list(string)
    retval = true
    x = hd(string)
    #Upper case or space
    if ((x >= 65 && x <= 90) || x == 32) do
      retval = false
    else
      retval = is_snake_case(tl(string))
    end
    retval
  end
  def is_snake_case(_) do true end
  
  def is_camel_case(string) do
    string = to_char_list(string)
    retval = true
    x = hd(string)
    #Upper case
    if (x >= 65 && x <= 90) do
      retval = is_camel_case_tail(tl(string))
    else
      retval = false
    end
    retval
  end
  
  defp is_camel_case_tail(string) when string != [] do
    string = to_char_list(string)
    retval = true
    x = hd(string)
    #Underscore
    if (x == 95) do
      retval = false
    else
      retval = is_camel_case_tail(tl(string))
    end
    retval
  end
  defp is_camel_case_tail(_) do true end
end
