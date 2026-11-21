\# Project 09: Active Directory Domain Controller Setup



\## Objective

Set up a Windows Server Domain Controller using Active Directory Domain Services (AD DS), create domain users, and verify authentication through Remote Desktop.



\## Environment

\- OS: Windows Server 2022 Datacenter

\- Domain: `omm-lab.local`

\- NetBIOS Name: `OMMLAB`

\- Domain Controller: `AZ-LKM-JAV-01`

\- DNS: Active Directory-integrated DNS



\## Implementation



\### 1. Install Active Directory Domain Services

Installed AD DS and management tools using:



```powershell

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

```



\### 2. Create a New Forest

Promoted the server to a Domain Controller and created the `omm-lab.local` forest:



```powershell

Install-ADDSForest `

&#x20; -DomainName "omm-lab.local" `

&#x20; -DomainNetbiosName "OMMLAB" `

&#x20; -InstallDNS `

&#x20; -SafeModeAdministratorPassword (Read-Host -AsSecureString "Enter DSRM password") `

&#x20; -Force

```



\### 3. Create Domain Users

Created two enabled domain accounts:

\- `omm.user1`

\- `omm.user2`



Both accounts were verified using Active Directory PowerShell.



\### 4. Configure Remote Desktop Access

Added both domain users to the built-in \*\*Remote Desktop Users\*\* group and configured the \*\*Allow log on through Remote Desktop Services\*\* user right.



\### 5. Authentication Testing

Successfully signed in through Remote Desktop using both domain accounts.



Verification commands:



```powershell

Get-ADUser -Filter 'SamAccountName -like "omm.user\*"' |

Select-Object Name,SamAccountName,Enabled



Get-ADGroupMember -Identity "Remote Desktop Users" |

Select-Object Name,SamAccountName

```



\## Screenshots

\- `screenshots/05-user1-login-proof.png` — Successful User 1 login

\- `screenshots/06-user2-login-proof.png` — Successful User 2 login



\## Outcome

\- Installed and configured Active Directory Domain Services.

\- Created a new Active Directory forest and domain.

\- Created and verified two enabled domain user accounts.

\- Configured Remote Desktop login permissions.

\- Successfully tested authentication using both domain users.

