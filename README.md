# Automated-Payload-Helper
This tool uses msfvenom to quickly create a payload and create a resource file to start its 'Listener'.
(Note: You will need to have Metasploit installed on your system to run this).


Enter this command to allow the script to execute:
```Bash
chmod +x payload_helper.sh
```
Let's run the tool:
```Bash
./payload_helper.sh
```
What happens when this tool runs?
⭕ The script asks you for your LHOST (IP Address) and LPORT. (You can use ifconfig or ip a command in another terminal to find your IP).
⭕ It then asks you whether you want a Windows (exe) or Linux (elf) payload (press 1 or 2 and enter).
⭕ As soon as you do this, msfvenom will start in the background and a file called backdoor.exe or backdoor.elf will be created in your folder.
⭕ Along with this, a resource file named listener.rc will be created. As per the instructions at the end, you can directly start Metasploit's hacking listener by entering the command msfconsole -r listener.rc.
