#!/usr/bin/env node

const readline = require('readline');

// Create interface for terminal input/output
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function displayMenu() {
    console.log("==================================================");
    console.log("          PAYLOAD ENCODER / OBFUSCATOR            ");
    console.log("==================================================");

    rl.question("[+] Paste the payload to encode: ", (payload) => {
        if (!payload.trim()) {
            console.log("[-] Error: Payload cannot be empty!");
            rl.close();
            return;
        }

        console.log("\n" + "=".repeat(15) + " OBFUSCATED PAYLOADS " + "=".repeat(15));

        // 1. Base64 Encoding (with Linux execution wrapper)
        const base64Encoded = Buffer.from(payload).toString('base64');
        const linuxBase64Command = `echo ${base64Encoded} | base64 -d | bash`;
        console.log("\n[*] Base64 (Linux Obfuscated Command):");
        console.log(`\x1b[32m${linuxBase64Command}\x1b[0m`);

        // 2. URL Encoding (for Web Application Attacks)
        const urlEncoded = encodeURIComponent(payload);
        console.log("\n[*] URL Encoded (For Web Attacks):");
        console.log(`\x1b[33m${urlEncoded}\x1b[0m`);

        // 3. Hex Encoding (for Buffer/Exploit Payloads)
        const hexEncoded = Buffer.from(payload).toString('hex');
        const formattedHex = hexEncoded.match(/.{1,2}/g).map(byte => '\\x' + byte).join('');
        console.log("\n[*] Hex Encoded (For Buffer/Exploit):");
        console.log(`\x1b[36m${formattedHex}\x1b[0m`);

        console.log("\n" + "==================================================");
        rl.close();
    });
}

// Run the function
displayMenu();
