import os

var browser = "src" / "browser" / "main.nin"
var server = "src" / "server.nim"

discard execShellCmd("nim c " & browser)
discard execShellCmd("nim c " & server)
