Set objShell = CreateObject("Wscript.Shell")
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\Scripts\memory_cleanup\FreeRAM.ps1""", 0, False
