import os

var browser = "src" / "browser" / "main.nim"
var server = "src" / "server.nim"

discard execShellCmd("nim js -d:release " & browser)
discard execShellCmd("nim c -d:release " & server)
