# <img width="100" height="100" alt="image" src="https://github.com/user-attachments/assets/0af8208b-c318-433c-bd33-9dfeeab932ae" />
»RAM OPTIMIZER«

**Automated Windows memory cleanup every 15 minutes to keep your system running smoothly.**

[![Platform](https://img.shields.io/badge/platform-Windows-blue?style=flat-square&logo=windows)](https://www.microsoft.com/windows)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?style=flat-square&logo=powershell)](https://docs.microsoft.com/powershell/)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)
[![Task Scheduler](https://img.shields.io/badge/Task%20Scheduler-Automated-orange?style=flat-square)](https://docs.microsoft.com/windows/win32/taskschd/task-scheduler-start-page)

> **🙏 Credits:** This project uses [`EmptyStandbyList.exe`](https://github.com/stefanpejcic/EmptyStandbyList), a tool created by [Stefan Pejcic](https://github.com/stefanpejcic). Big thanks for the foundation!

---

## ✨ Features

- 🔄 **Auto-cleans memory** every 15 minutes via Task Scheduler
- 🗑️ **Clears standby memory** using EmptyStandbyList
- 📊 **Logs memory freed** before and after each run
- 👻 **Runs silently** in the background
- 🚀 **Optimized for performance** and low overhead

---

## 📁 Project Structure

| File | Purpose |
|------|---------|
| `FreeRAM.ps1` | Main memory cleanup script |
| `FreeRAM_Hidden.vbs` | Silent launcher for PowerShell |
| `Free up memory usage.xml` | Task Scheduler task definition |
| `EmptyStandbyList.exe` | Standby memory clearing utility *(included)* |

---

## 🚀 Installation

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/RaneKun/RAM-Optimizer.git
cd RAM-Optimizer
```

### 2️⃣ Copy Files to Script Directory

```powershell
New-Item -ItemType Directory -Path "C:\Scripts\memory_cleanup" -Force
Copy-Item ".\*" -Destination "C:\Scripts\memory_cleanup\" -Recurse -Force
```

### 3️⃣ Import the Scheduled Task

```powershell
schtasks /create /tn "Free up memory usage" /xml "C:\Scripts\memory_cleanup\Free up memory usage.xml"
```

✅ **Done!** The task runs automatically every 15 minutes.

---

## 🛠️ Usage

### ▶️ Manual Run
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\memory_cleanup\FreeRAM.ps1"
```

### 📜 View Logs
```powershell
Get-Content "C:\Scripts\memory_cleanup\FreeRAM_Log.txt" -Tail 10
```

---

## 📋 Log Format

```
2025-11-13 12:57:55 | Freed: 1.25GB | Before: 8.30GB free -> After: 9.55GB free | Total: 16.0GB
```

---

## ⚠️ Disclaimer

- 🧪 Use at your own risk. Tested on Windows 10/11.
- 🔧 Requires **administrator privileges** for full functionality.

---

## 📜 License

MIT License — feel free to use, modify, and share.

---

**Made with 💙 by [RaneKun](https://github.com/RaneKun)**

*Set it up once, optimize forever* ⚡
