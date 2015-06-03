defmodule Parse do

  #Vraca quote iz tekstualnog fajla
  def readFile(path) do
     case File.read(path) do
       {:ok, body} -> generateTree body
       {:error, reason} -> IO.puts "There has been an error"
     end
  end

  #Generise AST stablo iz stringa
  def generateTree(text) do
     case Code.string_to_quoted(text) do
     	{:ok, body} -> body
     	{:error, reason} -> IO.puts "There has been an error"
     end
  end
  
  #Vraca listu funkcija iz AST stabla
  def getFuncs(text) do
    elem(elem(hd(hd(tl(elem(text, 2)))), 1), 2)
  end
  
  #Vraca ime funkcije
  def getFuncName(func) do
    IO.puts elem(hd(elem(func, 2)),0)
  end
  
  #Vraca redove funkcije
  def getStats(func) do
    elem(elem(hd(hd(tl(elem(func, 2)))), 1), 2)
  end
  
  #Vraca naziv reda
  def getStatName(stat) do
    sym = elem(stat, 0)
    if (is_tuple(sym)) do
      mod = hd(tl(elem(sym, 2)))
      sym = hd(elem(hd(elem(sym, 2)), 2))
      sym = {sym, mod}
    end
#    case sym do
#      := -> name = "matching"
#      _ -> name = sym
#    end
    sym
  end
  
  #Iterira kroz listu i izvrsava funkciju foo za svakog clana
  def listIter(list, foo) when list != [] do
    if (is_tuple(foo.(hd(list)))) do
      IO.puts elem(foo.(hd(list)), 0)
      IO.puts elem(foo.(hd(list)), 1)
    else
      IO.puts foo.(hd(list))
    end
    listIter(tl(list), foo)
  end

  def listIter(_, _) do end
  
end

#TEST PRIMER
#stats = Parse.readFile("indent.ex") |> Parse.getFuncs |> hd |> Parse.getStats
#Parse.listIter(stats, &Parse.getStatName/1)

