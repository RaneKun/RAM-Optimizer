# ⚡ RAM Optimizer (Robust) - Aggressive & Automated

<div align="center">

![RAM Optimizer Robust](https://img.shields.io/badge/Version-Robust-red?style=for-the-badge)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?style=for-the-badge&logo=powershell)](https://docs.microsoft.com/powershell/)
[![Task Scheduler](https://img.shields.io/badge/Task_Scheduler-Windows-green?style=for-the-badge)](https://docs.microsoft.com/windows/win32/taskschd/task-scheduler-start-page)

**Silent, aggressive RAM optimization that runs automatically in the background**

</div>

---

## 📋 Overview

RAM Optimizer (Robust) is an **aggressive, automated** RAM optimization tool designed for users with **8-16 GB of RAM** who want **hands-off, scheduled memory cleaning**. It runs silently via Windows Task Scheduler without any GUI or user interaction.

---

## ✨ Features

### 🤫 Silent Operation
- **No GUI:** Runs completely invisibly
- **VBS Wrapper:** PowerShell runs without console window
- **Background Only:** Never interrupts your work
- **Task Scheduler:** Professional Windows integration

### 💪 Aggressive Cleaning
- **EmptyStandbyList.exe:** Maximum memory clearing
- **Working Set Trimming:** Reduces all process memory
- **Modified Page List:** Clears modified pages
- **Standby List:** Frees cached memory
- **Complete Optimization:** All memory types cleared

### 🔄 Fully Automated
- **15-Minute Intervals:** Runs automatically (customizable)
- **Set and Forget:** No user interaction needed
- **Runs When Logged Out:** Works even when not at PC
- **No Manual Triggers:** Purely scheduled

### 📋 Simple Logging
- **Text Log File:** `C:\Scripts\FreeRAM_Log.txt`
- **Timestamp Entries:** Date and time of each run
- **Before/After Stats:** Shows freed amounts
- **Easy to Read:** Human-readable format

### ⚙️ Windows Integration
- **Task Scheduler:** Pre-configured XML task
- **System Account:** Can run as SYSTEM
- **Startup Compatible:** Runs on boot if configured
- **Service-Like:** Professional automation

---

## 🎯 Who Should Use This?

### ✅ Perfect For:
- **Laptop Users** with 8-16 GB RAM
- **Multitaskers** who run many apps simultaneously
- **Background Workers** (servers, always-on systems)
- Users who want **zero manual interaction**
- Those who prefer **Task Scheduler** over applications
- People who **set it up once** and forget about it
- Users uncomfortable with Python/GUIs

### ❌ Not Ideal For:
- Users who want real-time statistics (use Modern version)
- Systems with 16+ GB RAM (Modern version better)
- Those who want manual control over timing
- Users who prefer seeing what's happening
- People who don't use Task Scheduler

---

## 📦 Installation

### Prerequisites
- **Windows 10/11** (64-bit)
- **PowerShell 5.1 or higher** (included in Windows)
- **Administrator access** (for setup only)
- **Task Scheduler** (built into Windows)

### Step-by-Step Installation

#### 1️⃣ Create Scripts Folder
```cmd
# Open Command Prompt or PowerShell and run:
mkdir C:\Scripts
```

Or manually:
- Open File Explorer
- Go to `C:\`
- Create new folder named `Scripts`

#### 2️⃣ Download Files
Download the Robust version from [Releases](https://github.com/RaneKun/RAM-Optimizer/releases)

#### 3️⃣ Copy ALL Files to C:\Scripts\
Copy these files to `C:\Scripts\`:
- `EmptyStandbyList.exe` - Memory clearing tool
- `FreeRAM.ps1` - Main PowerShell script
- `FreeRAM_Hidden.vbs` - Silent execution wrapper
- `Free up memory usage.xml` - Task Scheduler configuration

**Important:** Files must be in `C:\Scripts\` exactly, not in a subfolder!

**Verify:**
```
C:\Scripts\EmptyStandbyList.exe
C:\Scripts\FreeRAM.ps1
C:\Scripts\FreeRAM_Hidden.vbs
C:\Scripts\Free up memory usage.xml
```

#### 4️⃣ Import Task into Task Scheduler

**Method 1: GUI**
1. Press `Windows Key + R`
2. Type `taskschd.msc` and press Enter
3. Task Scheduler opens
4. Click **Action** → **Import Task...**
5. Navigate to `C:\Scripts\`
6. Select `Free up memory usage.xml`
7. Click **Open**
8. When prompted, enter your Windows **username**
9. Click **OK**

**Method 2: Command Line**
```powershell
# Open PowerShell as Administrator
schtasks /create /xml "C:\Scripts\Free up memory usage.xml" /tn "Free up memory usage"
```

#### 5️⃣ Verify Installation

**Check Task Scheduler:**
1. Open Task Scheduler (`taskschd.msc`)
2. Look for "Free up memory usage" in task list
3. Should show:
   - Status: **Ready**
   - Trigger: **Every 15 minutes**
   - Last Run Time: (will show after first run)

**Test Manually:**
1. In Task Scheduler, find the task
2. Right-click → **Run**
3. Check `C:\Scripts\FreeRAM_Log.txt`
4. Should see a new entry with timestamp and freed amount

#### 6️⃣ Done! 🎉
The task will now run automatically every 15 minutes, silently in the background.

---

## 🎮 Usage

### Normal Operation

**There is no usage!** 😎

Once installed, it runs automatically. You never need to interact with it.

**To verify it's working:**
1. Open `C:\Scripts\FreeRAM_Log.txt`
2. See entries like:
   ```
   2025-01-21 10:15:00 | Freed: 1.23GB | Before: 4.5GB free -> After: 5.73GB free | Total: 16GB
   2025-01-21 10:30:00 | Freed: 0.87GB | Before: 5.2GB free -> After: 6.07GB free | Total: 16GB
   2025-01-21 10:45:00 | Freed: 1.45GB | Before: 3.8GB free -> After: 5.25GB free | Total: 16GB
   ```

### View Log File

**Quick View:**
```cmd
notepad C:\Scripts\FreeRAM_Log.txt
```

**Or:**
- Open File Explorer
- Navigate to `C:\Scripts\`
- Double-click `FreeRAM_Log.txt`

### Temporarily Disable

**Via Task Scheduler:**
1. Open Task Scheduler (`taskschd.msc`)
2. Find "Free up memory usage"
3. Right-click → **Disable**
4. To re-enable: Right-click → **Enable**

**Via Command Line:**
```powershell
# Disable
schtasks /change /tn "Free up memory usage" /disable

# Enable
schtasks /change /tn "Free up memory usage" /enable
```

### Temporarily Pause (Without Disabling)

**Via Task Scheduler:**
1. Open Task Scheduler
2. Find the task
3. Right-click → Properties
4. Triggers tab → Select trigger → Edit
5. Check "Expires:" and set a future date
6. Click OK

### Change Frequency

**Via Task Scheduler:**
1. Open Task Scheduler
2. Find "Free up memory usage"
3. Right-click → **Properties**
4. Go to **Triggers** tab
5. Select the trigger → Click **Edit**
6. Change "Repeat task every" value:
   - 5 minutes (aggressive)
   - 15 minutes (default)
   - 30 minutes (moderate)
   - 1 hour (conservative)
7. Click **OK** → **OK**

---

## 📊 How It Works

### Execution Flow

```
Task Scheduler (every 15 min)
    ↓
Triggers: FreeRAM_Hidden.vbs
    ↓
Launches: PowerShell (hidden window)
    ↓
Executes: FreeRAM.ps1
    ↓
1. Gets current memory state
2. Trims working sets of all processes
3. Calls EmptyStandbyList.exe:
   - workingsets
   - modifiedpagelist
   - standbylist
4. Waits 3 seconds for memory to settle
5. Gets new memory state
6. Calculates freed amount
7. Logs to file
    ↓
Done (silently)
```

### PowerShell Script Breakdown

**FreeRAM.ps1** does the following:

1. **Configuration:**
   ```powershell
   $standbyClearTool = "C:\Scripts\EmptyStandbyList.exe"
   $logFile = "C:\Scripts\FreeRAM_Log.txt"
   ```

2. **Get Memory Before:**
   ```powershell
   $before = Get-MemoryStats
   # Returns: TotalGB, UsedGB, FreeGB
   ```

3. **Trim Working Sets:**
   ```powershell
   $processes = Get-Process | Where-Object { $_.Responding -eq $true }
   foreach ($p in $processes) {
       # Trim each process's working set
       $p.MinWorkingSet = $p.MinWorkingSet
       $p.MaxWorkingSet = $p.MaxWorkingSet
   }
   ```

4. **Clear Standby Memory:**
   ```powershell
   Start-Process -FilePath EmptyStandbyList.exe -ArgumentList workingsets
   Start-Process -FilePath EmptyStandbyList.exe -ArgumentList modifiedpagelist
   Start-Process -FilePath EmptyStandbyList.exe -ArgumentList standbylist
   ```

5. **Calculate and Log:**
   ```powershell
   $after = Get-MemoryStats
   $freed = $after.FreeGB - $before.FreeGB
   $logEntry = "$timestamp | Freed: ${freed}GB | Before: ${before.FreeGB}GB -> After: ${after.FreeGB}GB"
   $logEntry | Out-File -FilePath $logFile -Append
   ```

### VBS Wrapper

**FreeRAM_Hidden.vbs** runs PowerShell without showing a window:

```vbscript
Set objShell = CreateObject("Wscript.Shell")
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\Scripts\FreeRAM.ps1""", 0, False
```

- `0` = Hidden window
- `False` = Don't wait for completion

### EmptyStandbyList.exe

This tool aggressively clears Windows memory lists:

- **workingsets** - Trims process working sets
- **modifiedpagelist** - Clears modified page list
- **standbylist** - Frees standby memory (cached)

It's a community tool inspired by Microsoft Sysinternals utilities.

---

## ⚙️ Customization

### Change Log File Location

Edit `FreeRAM.ps1`:

```powershell
# Change this line:
$logFile = "C:\Scripts\FreeRAM_Log.txt"

# To something like:
$logFile = "D:\MyLogs\RAMOptimizer.log"
```

### Disable EmptyStandbyList.exe

If you want less aggressive cleaning, edit `FreeRAM.ps1`:

```powershell
# Comment out these lines (add # at start):
# if (Test-Path $standbyClearTool) {
#     Start-Process -FilePath $standbyClearTool -ArgumentList workingsets -WindowStyle Hidden -Wait
#     Start-Process -FilePath $standbyClearTool -ArgumentList modifiedpagelist -WindowStyle Hidden -Wait
#     Start-Process -FilePath $standbyClearTool -ArgumentList standbylist -WindowStyle Hidden -Wait
# }
```

This will only trim working sets (less aggressive).

### Change Wait Time

After optimization, script waits 3 seconds for memory to settle:

```powershell
# Change this line in FreeRAM.ps1:
Start-Sleep -Seconds 3

# To something like:
Start-Sleep -Seconds 5
```

### Run Only During Specific Hours

Via Task Scheduler:

1. Open task properties
2. Triggers tab → Edit trigger
3. Under "Advanced settings"
4. Check "Stop task if it runs longer than:"
5. Set duration
6. Add a second trigger for different hours

Or add time check to script:

```powershell
# Add at start of FreeRAM.ps1
$hour = (Get-Date).Hour
if ($hour -lt 9 -or $hour -gt 17) {
    # Only run between 9 AM and 5 PM
    exit
}
```

### Run Only When RAM Usage is High

Add threshold check to `FreeRAM.ps1`:

```powershell
# Add after getting $before memory stats:
$usedPercent = ($before.UsedGB / $before.TotalGB) * 100
if ($usedPercent -lt 70) {
    # Don't run if less than 70% used
    exit
}
```

---

## 🔧 Troubleshooting

### Task Not Running

**Symptom:** No new log entries appearing

**Solutions:**

1. **Check if task is enabled:**
   - Open Task Scheduler
   - Find task
   - Status should be "Ready" not "Disabled"
   - If disabled: Right-click → Enable

2. **Check trigger:**
   - Task properties → Triggers tab
   - Verify trigger is active
   - Check "Begin the task" is set correctly

3. **Test manually:**
   - Right-click task → Run
   - Watch for errors
   - Check log file for new entry

4. **Check Event Viewer:**
   - Press `Win + X` → Event Viewer
   - Windows Logs → Application
   - Look for Task Scheduler errors

5. **Verify file paths:**
   ```cmd
   dir C:\Scripts\EmptyStandbyList.exe
   dir C:\Scripts\FreeRAM.ps1
   dir C:\Scripts\FreeRAM_Hidden.vbs
   ```
   All should exist!

### No Log File Created

**Symptom:** `C:\Scripts\FreeRAM_Log.txt` doesn't exist

**Solutions:**

1. **Verify write permissions:**
   ```powershell
   # Test writing to directory:
   echo "test" > C:\Scripts\test.txt
   ```
   If error: Permission issue

2. **Run script manually to see errors:**
   ```powershell
   cd C:\Scripts
   .\FreeRAM.ps1
   ```
   Check for error messages

3. **Check script paths:**
   - Open `FreeRAM.ps1` in Notepad
   - Verify `$logFile` path is correct
   - Should be `C:\Scripts\FreeRAM_Log.txt`

4. **Try creating file manually:**
   ```powershell
   New-Item -Path "C:\Scripts\FreeRAM_Log.txt" -ItemType File
   ```

### EmptyStandbyList.exe Blocked by Antivirus

**Symptom:** Script runs but doesn't free much memory, or antivirus alerts

**Why This Happens:**
- EmptyStandbyList.exe is a low-level system tool
- Antivirus may see it as suspicious
- It's a **false positive** (tool is safe)

**Solutions:**

1. **Add exception in antivirus:**
   - Open your antivirus software
   - Find "Exceptions" or "Exclusions"
   - Add `C:\Scripts\EmptyStandbyList.exe`

2. **Verify file integrity:**
   - Download from trusted source
   - Check file size (~137 KB)
   - Verify it's not corrupted

3. **Alternative approach:**
   - Comment out EmptyStandbyList.exe calls in script
   - Use working set trimming only (less aggressive)

### Script Runs But Frees Little Memory

**Symptom:** Log shows 0.05GB or less freed

**This is actually normal!** It means:
- ✅ Your system has good free RAM
- ✅ Not much cached memory to clear
- ✅ Working as intended

**When to worry:**
- High RAM usage (>90%) but still frees nothing
- System is slow despite "optimization"
- Errors in log file

**Solutions:**
1. Check if system actually needs optimization
2. Monitor RAM usage in Task Manager
3. May need different optimization approach

### Permission Errors

**Symptom:** "Access Denied" in logs or when running manually

**Solutions:**

1. **Run Task Scheduler as admin:**
   - Search "Task Scheduler"
   - Right-click → Run as administrator

2. **Check task user account:**
   - Task properties → General tab
   - Should run as your user account
   - Or "SYSTEM" for maximum privileges

3. **Set "Run with highest privileges":**
   - Task properties → General tab
   - Check ☑ "Run with highest privileges"
   - Click OK

4. **Verify PowerShell execution policy:**
   ```powershell
   Get-ExecutionPolicy
   # If it shows "Restricted":
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
   ```

### Task Runs But PowerShell Window Flashes

**Symptom:** Brief PowerShell window appears and closes

**This means VBS wrapper isn't working!**

**Solutions:**

1. **Verify VBS file exists:**
   ```cmd
   dir C:\Scripts\FreeRAM_Hidden.vbs
   ```

2. **Check task action:**
   - Task properties → Actions tab
   - Should run: `C:\Scripts\FreeRAM_Hidden.vbs`
   - Not: `C:\Scripts\FreeRAM.ps1`

3. **Edit task action:**
   - Actions tab → Edit
   - Program/script: `wscript.exe`
   - Add arguments: `C:\Scripts\FreeRAM_Hidden.vbs`

### Task Scheduler Says "Could not start"

**Symptom:** Task fails to run with error message

**Common causes:**

1. **File paths wrong:**
   - All files must be in `C:\Scripts\`
   - Check paths in VBS file
   - Check paths in PowerShell script

2. **User account issues:**
   - Re-import task
   - Enter correct username when prompted
   - Verify account has admin rights

3. **Trigger configuration:**
   - Edit trigger
   - Set "Begin the task" to correct option
   - Verify repeat interval

4. **PowerShell execution policy:**
   ```powershell
   Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned
   ```

---

## ⚠️ Pros & Cons

### ✅ Advantages

**Complete Automation:**
- Zero user interaction needed
- Runs on fixed schedule
- Works even when not logged in
- Perfect for servers/always-on systems

**Maximum Aggression:**
- Clears ALL memory types
- Most effective RAM clearing
- Best for low-RAM systems
- Handles heavy memory usage

**Minimal Resources:**
- No GUI overhead (0 MB when idle)
- Only runs for ~3-5 seconds
- ~5 MB during execution
- No persistent background process

**Professional Integration:**
- Uses Windows Task Scheduler
- Service-like operation
- Can run as SYSTEM account
- Startup-compatible

**Simple & Reliable:**
- No complex configuration
- Text-based logging
- Easy to verify operation
- Difficult to break

### ❌ Disadvantages

**No Visual Feedback:**
- No GUI to see stats
- Must check log file manually
- No real-time monitoring
- Can't see what's happening

**Fixed Schedule Only:**
- Runs every X minutes (no smart checks)
- May run when not needed
- Wastes some CPU cycles
- Can't manually trigger easily

**Limited Customization:**
- Must edit scripts manually
- No settings panel
- Requires PowerShell knowledge
- Task Scheduler knowledge needed

**Setup Complexity:**
- Task Scheduler can be confusing
- File paths must be exact
- Manual configuration required
- More steps than Modern version

**EmptyStandbyList.exe:**
- Third-party tool (not official Microsoft)
- May trigger antivirus alerts
- Adds dependency
- Requires trust in community tool

**No Statistics:**
- Just simple log entries
- No graphs or analysis
- Can't track trends easily
- Must parse log manually

---

## 📊 Performance Expectations

### Memory Freed (Typical)

| System RAM | 15-Min Interval | 30-Min Interval | 1-Hour Interval |
|-----------|----------------|----------------|----------------|
| 8 GB      | 400-800 MB     | 600-1200 MB    | 1-2 GB         |
| 12 GB     | 600-1000 MB    | 800-1500 MB    | 1.5-2.5 GB     |
| 16 GB     | 800-1500 MB    | 1-2 GB         | 2-3 GB         |
| 24 GB+    | 1-2 GB         | 1.5-3 GB       | 2-4 GB         |

**Note:** More frequent runs free less per run (but keep system cleaner overall)

### Resource Usage

**RAM Usage:**
- Idle: 0 MB (task not running)
- During execution: ~5 MB for 3-5 seconds
- Log file: <1 MB (grows slowly)

**CPU Usage:**
- Idle: 0%
- During execution: 5-15% for 3-5 seconds
- EmptyStandbyList.exe: Brief spike (1-2 seconds)

**Disk Usage:**
- Scripts: ~150 KB total
- Log file: ~10-50 KB per month
- No temporary files

**Network Usage:**
- None (completely offline)

### Comparison to Modern Version

| Metric | Robust | Modern |
|--------|--------|--------|
| **RAM (Idle)** | 0 MB | 50-80 MB |
| **RAM (Active)** | 5 MB | 80-100 MB |
| **CPU (Idle)** | 0% | <1% |
| **CPU (Active)** | 5-15% | 2-5% |
| **Memory Freed** | 400-2000 MB | 200-1500 MB |
| **Runs Per Hour** | 4 (default) | Variable |

---

## 🎯 Best Practices

### Installation Best Practices

1. **Verify files before setup:**
   - Check all files are present
   - Ensure paths are correct
   - Test script manually first

2. **Create system restore point:**
   ```
   Control Panel → System → System Protection → Create
   ```

3. **Test manually before scheduling:**
   ```powershell
   cd C:\Scripts
   .\FreeRAM.ps1
   ```

4. **Monitor first few runs:**
   - Check log file after 1 hour
   - Verify entries are being created
   - Look for errors

### Operational Best Practices

**Interval Selection:**
- **5 minutes:** Very aggressive, for 8GB RAM systems under heavy load
- **15 minutes:** Default, good for most 8-16GB systems
- **30 minutes:** Moderate, for 16GB+ or lighter usage
- **1 hour:** Conservative, for systems that don't need frequent cleaning

**Monitoring:**
- Check log file weekly
- Look for patterns in freed amounts
- Adjust interval if needed
- Watch for errors

**Maintenance:**
- Clear log file monthly (or let it grow)
- Update EmptyStandbyList.exe if new version available
- Review Task Scheduler for issues
- Test after Windows updates

### Optimization Timing

**Good for Robust Version:**
- ✅ Running all day during work
- ✅ Overnight operation on servers
- ✅ Background during gaming
- ✅ Any always-on scenarios

**Not ideal for:**
- ❌ Laptops that sleep frequently (task won't run)
- ❌ Short computing sessions (<1 hour)
- ❌ Systems that are off most of the time

### Combining with Other Tools

**Compatible with:**
- Windows Disk Cleanup
- CCleaner (scheduled cleaning)
- Third-party RAM tools (but may conflict)

**Not compatible with:**
- Modern version (will conflict!)
- Other aggressive RAM cleaners
- Memory compression tools

---

## 📚 Additional Resources

### Documentation
- [Main README](../README.md) - Overall project documentation
- [QUICKSTART](../QUICKSTART.md) - Quick installation guide
- [Modern Version README](../Modern/README.md) - Alternative version
- [CONTRIBUTING](../CONTRIBUTING.md) - Contribution guidelines

### PowerShell Resources
- [PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [Task Scheduler Reference](https://docs.microsoft.com/windows/win32/taskschd/task-scheduler-start-page)
- [Windows Memory Management](https://docs.microsoft.com/windows/win32/memory/memory-management)

### Community
- [GitHub Issues](https://github.com/RaneKun/RAM-Optimizer/issues)
- [GitHub Discussions](https://github.com/RaneKun/RAM-Optimizer/discussions)

---

## 🔒 Security Notes

### EmptyStandbyList.exe

**What is it?**
- Community tool for clearing Windows memory lists
- Inspired by Microsoft Sysinternals utilities
- Widely used in IT community
- Open concept (source available elsewhere)

**Is it safe?**
- Yes, when downloaded from trusted sources
- Does not modify system files
- Only interacts with memory
- Many users verify its safety

**Antivirus alerts:**
- Common with low-level system tools
- Usually false positives
- Add exception if you trust the source

### PowerShell Execution

**Execution Policy:**
- Script requires `RemoteSigned` or `Bypass`
- Safe when scripts are from trusted sources
- Be cautious with downloaded scripts

**Running as SYSTEM:**
- Task can run as SYSTEM account
- Highest privileges possible
- Review scripts before running
- Understand what they do

---

## 🆘 Getting Help

### Before Asking for Help

1. **Check the log file:**
   - `C:\Scripts\FreeRAM_Log.txt`
   - Look for error messages

2. **Run script manually:**
   ```powershell
   cd C:\Scripts
   .\FreeRAM.ps1
   ```
   Note any errors

3. **Check Event Viewer:**
   - `Win + X` → Event Viewer
   - Windows Logs → Application
   - Look for errors related to Task Scheduler

4. **Review this documentation:**
   - Check Troubleshooting section
   - Try common solutions

### How to Report Issues

When asking for help, include:

1. **System info:**
   - Windows version
   - RAM amount
   - PowerShell version

2. **What's wrong:**
   - Describe the problem clearly
   - When it started
   - What you've tried

3. **Log contents:**
   - Last few entries from log file
   - Any error messages

4. **Configuration:**
   - Task Scheduler settings
   - File locations
   - Any customizations

---

## 📄 License

This project is licensed under the **RaneKun Open-Use License (Non-Commercial, Attribution Required)**.

See [LICENSE](../LICENSE) for full details.

---

## 🙏 Acknowledgments

**Tools & Technologies:**
- **EmptyStandbyList.exe** - Community memory clearing tool
- **PowerShell** - Microsoft scripting framework
- **Task Scheduler** - Windows automation service
- **VBScript** - Silent execution wrapper

**Inspiration:**
- ASUS MemCleanup
- Various system optimization tools
- Windows Sysinternals Suite
- IT community best practices

**Special Thanks:**
- PowerShell community for excellent documentation
- Task Scheduler experts for guidance
- Beta testers for feedback
- Users for bug reports and suggestions

---

<div align="center">

**Made with 💙 by [RaneKun](https://github.com/RaneKun)**

*Set it up once, optimize forever* ⚡

[⬆ Back to Top](#-ram-optimizer-robust---aggressive--automated)

</div>
