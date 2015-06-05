str = Parse.readFile("main.ex")
json = Json.encode(str)

{:ok, file} = File.open "out.json", [:write]
IO.binwrite file, json 
File.close file

# Typer doc
Typer.print str

# Type stack doc
#TypeStack.print str
