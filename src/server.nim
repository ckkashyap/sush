import asynchttpserver, asyncdispatch, strtabs, browsers, cgi, os

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  var params = {:}.newStringTable()
  var query = req.url.query
  try:
    for key, val in cgi.decodeData(query):
      params[key] = val
      echo key, " -> ", val
               
  except CgiError:
    echo("[Warning] Incorrect query. Got: ", query)


  var output = "HELLO"
  case params["action"]
  of "main":
    echo "MAIN"
    output = readFile("src" / "browser" / "index.html")



  if params.hasKey("action"):
    echo "GOOD"
  else:
    echo "BAD"
#  echo req.body
#  for k,v in req.headers:
#    echo k, " -> ", v

  await req.respond(Http200, output)

asyncCheck server.serve(Port(8055), cb)

openDefaultBrowser("http://localhost:8055/")
  
runForever()
