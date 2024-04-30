import os
import asciiText

if paramCount() == 0:
  echo asciiText "hello world"
else:
  echo asciiText "hello ", asciiText paramStr(1)
