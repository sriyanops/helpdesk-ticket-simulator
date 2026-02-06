# Ticket-001 — Wifi Connectivity

## User report
"My laptop says it’s connected to Wi-Fi, but no websites load. Teams won’t connect either."

## Environment
- OS: Windows 11
- Connection: (Wi-Fi/Ethernet)
- User type: (Standard/Admin)
- Apps involved: (O365/Printer/VPN/etc.)

## Impact / urgency
- Impact: User unable to access internet-based services
- Urgency: Medium 

## Initial triage questions 
1. Are other devices on the same Wi-Fi network working?
2. Does the Wi-Fi icon show connected or limited access?
3. Has anything changed recently (network settings, VPN, updates)?
4. Does the issue occur on all websites or only specific ones?

## Working hypotheses (top 3)
1. DNS server misconfiguration
2. Corrupt local DNS cache
3. ISP or router DNS resolution issue

## Actions taken (chronological)
1. Verified device was connected to Wi-Fi and obtained a valid IPv4 address
2. Confirmed raw IP connectivity by pinging a public IP address (8.8.8.8)
3. Tested DNS resolution using nslookup, which failed
4. Reviewed network adapter DNS configuration and identified invalid DNS server

## Evidence collected
- Commands run:
1. ipconfig /all
2. ping 8.8.8.8
3. nslookup google.com
- Screenshots: [Browser DNS error](./evidence/screenshots/browser_dns_error.png)
- Relevant logs:
1. [`ipconfig_before.txt`](./evidence/logs/ipconfig_before.txt)
2. [`ping_ip_success.txt`](./evidence/logs/ping_ip_success.txt)
3. [`nslookup_failure.txt`](./evidence/logs/nslookup_failure.txt)
4. [`dns_fixed.txt`](./evidence/logs/dns_fixed.txt)

## Resolution
- Root cause: Root cause: Wi-Fi adapter was manually configured with an invalid DNS server (`1.1.1.99`)
- Fix implemented: Updated DNS settings to valid public DNS servers and flushed DNS cache

## Validation
- Successful DNS resolution using `nslookup`
- Websites load normally in browser
- Microsoft Teams reconnects successfully

## Prevention / follow-up
- Recommend leaving DNS settings on automatic unless a specific configuration is required
- Advise user to contact IT before changing network settings in the future

## User-facing closeout message
"Your device was connected to Wi-Fi, but it couldn’t reach websites because the DNS settings were misconfigured. I corrected the DNS configuration and verified that internet access is restored. Please let us know if the issue returns"
