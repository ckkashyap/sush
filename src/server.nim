import asynchttpserver, asyncdispatch, strtabs, browsers, cgi

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


  if params.hasKey("action"):
    echo "GOOD"
  else:
    echo "BAD"
#  echo req.body
#  for k,v in req.headers:
#    echo k, " -> ", v

  await req.respond(Http200, "Hello World")

asyncCheck server.serve(Port(8055), cb)

openDefaultBrowser("http://localhost:8055/")
  
runForever()
