\# Project 10: Internal DNS Setup



\## Objective

Configure an internal DNS server to resolve a web application hostname to its private IPv4 address.



\## Environment

\- OS: Windows Server 2022 Datacenter

\- Domain: `omm-lab.local`

\- DNS Server: Windows Server DNS

\- Web Server: IIS

\- Server Private IP: `10.5.3.112`

\- DNS Zone: `omm-lab.local`



\## Implementation



\### 1. Deploy DNS Server

Used the DNS Server role installed during the Active Directory Domain Controller setup.



Verified the DNS service:



```powershell

Get-Service DNS

```



\### 2. Deploy Web Server

Installed IIS:



```powershell

Install-WindowsFeature Web-Server -IncludeManagementTools

```



Created a test webpage at `C:\\inetpub\\wwwroot\\index.html`.



Verified that IIS returned HTTP 200 OK.



\### 3. Create DNS A Record

Created an A record in the `omm-lab.local` DNS zone:



```powershell

Add-DnsServerResourceRecordA `

&#x20; -ZoneName "omm-lab.local" `

&#x20; -Name "web" `

&#x20; -IPv4Address "10.5.3.112"

```



The resulting hostname is:



`web.omm-lab.local`



\### 4. Verify DNS Resolution

Executed:



```powershell

nslookup web.omm-lab.local 127.0.0.1

```



Expected resolution:



```text

Name:    web.omm-lab.local

Address: 10.5.3.112

```



\### 5. Verify Website Access Using Hostname

Tested the website:



```powershell

Invoke-WebRequest http://web.omm-lab.local -UseBasicParsing

```



Result: HTTP 200 OK.



\## Screenshots

The `screenshots/` directory contains evidence of:

\- DNS A record creation and verification

\- Successful hostname resolution using nslookup

\- Successful HTTP access using the internal hostname



\## Outcome

\- Verified the Windows DNS Server service.

\- Configured an internal DNS A record.

\- Resolved `web.omm-lab.local` to `10.5.3.112`.

\- Accessed the IIS-hosted webpage using its internal hostname.

