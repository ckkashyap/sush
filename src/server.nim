import asynchttpserver, asyncdispatch, strtabs

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  echo req.body
  for k,v in req.headers:
    echo k, " -> ", v

  await req.respond(Http200, "Hello World")

asyncCheck server.serve(Port(8055), cb)
runForever()
