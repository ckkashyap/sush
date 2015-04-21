import os

discard execShellCmd("nim c src\\browser\\main.nim")
discard execShellCmd("nim c src\\server.nim")

