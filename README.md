# Automated-Payload-Helper
**Automated Payload Helper** is a lightweight, efficient Bash-based Command Line Interface (CLI) utility designed for cybersecurity professionals, penetration testers, and ethical hacking students. 

The tool streamlines the post-exploitation workflow by automating the repetitive syntax of Metasploit's `msfvenom` and `msfconsole`. It enables users to generate target-specific payloads and automatically structure handler resource files (`.rc`) with a single command line wizard, eliminating manual entry errors.

---

## 🛠️ Key Features

- **Streamlined Cross-Platform Generation:** Generate standalone payloads for both Windows (Portable Executables) and Linux (Executable and Linkable Format) dynamically.
- **Automated Resource Scripting:** Automatically generates custom Metasploit Resource scripts (`.rc`) matching your session handler criteria.
- **One-Click Multi-Handler Integration:** Spawns a configured Metasploit multi-handler listener in the background instantly without navigating the standard interactive MSF console setup.
- **Clean ANSI Logging:** Built-in color-coded diagnostic levels (`[+] Success`, `[-] Error`, `[*] Information`) for clean output readability.

---

## 📋 Prerequisites

Ensure your host environment meets the following requirements before executing the tool:
- **Operating System:** Linux (Kali Linux, Parrot Security OS, or Ubuntu recommended)
- **Dependencies:** Metasploit Framework installed and mapped to your system's global `$PATH` variable (`msfvenom` and `msfconsole` must be accessible).

---

## 🚀 Installation & Setup

Execute the following commands sequentially within your terminal environment to deploy the script:

### 1. Clone the Repository
```bash
git clone [https://github.com/rushyaayt/Automated-Payload-Helper.git](https://github.com/rushyaayt/Automated-Payload-Helper.git)
cd Automated-Payload-Helper
```
This tool uses msfvenom to quickly create a payload and create a resource file to start its 'Listener'.
(Note: You will need to have Metasploit installed on your system to run this).


### 2. Enter this command to allow the script to execute:
```Bash
chmod +x payload_helper.sh
```
### 3. Let's run the tool:
```Bash
./payload_helper.sh
```
What happens when this tool runs?
⭕ The script asks you for your LHOST (IP Address) and LPORT. (You can use ifconfig or ip a command in another terminal to find your IP).
⭕ It then asks you whether you want a Windows (exe) or Linux (elf) payload (press 1 or 2 and enter).
⭕ As soon as you do this, msfvenom will start in the background and a file called backdoor.exe or backdoor.elf will be created in your folder.
⭕ Along with this, a resource file named listener.rc will be created. As per the instructions at the end, you can directly start Metasploit's hacking listener by entering the command msfconsole -r listener.rc.
