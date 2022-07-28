<div align="center">
  <a href="https://github.com/ALARP-Solutions/Chocolatey-Intune">
    <img src="Citrix-Workspace/logo.png" alt="Logo" width="80" height="80">
  </a>
  <h1>Chocolatey Intune - Citrix Workspace</h1>
</div>

## Configuring VSCode

### App Information
| Field | Data |
| --- | --- |
| Name | Citrix Workspace |
| Description | Citrix Workspace app is the easy-to-install client software that provides seamless, secure access to everything you need to get work done. With this free download, you easily and securely get instant access to all applications, desktops and data from any device, including smartphones, tablets, PCs and Macs. |
| Publisher | Citrix Systems, Inc. |
| App Version | chocolatey |
| Category | Business |
| Information URL | https://www.citrix.com/en-au/products/receiver.html |
| Privacy URL | https://www.citrix.com/en-au/about/legal/ |
| Logo | [logo.png](/citrix-workspace/logo.png) |

### Program

| Field | Data |
| --- | --- |
| Install Command | powershell.exe -executionpolicy bypass .\install.ps1 |
| Uninstall Command | powershell.exe -executionpolicy bypass .\uninstall.ps1 |
| Install Behaviour | System |

### Requirements
| Field | Data |
| --- | --- |
| Operating system architecture | x64 |
| Minimum operating system | Windows 10 1808 |
| Install Behaviour | System |
| Disk space required (MB) | 572 |
| Physical memory required (MB) | 1000 |
| Minimum number of logical processors required | _ |
| Minimum CPU speed required (MHz) | _ |
| Additional requirement rules | _ |

### Detection Rules
| Field | Data |
| --- | --- |
| Rules Format | Use a custom detection script |
| Script | Detection is done using [detect.ps1](VSCode/detect.ps1) |
| Run script as 32-bit process on 64-bit clients | No |
| Enforce script signature check and run script silently | No |


### Dependencies
No dependencies.

### Supersedence
Maybe set to supersede previous versions at you leisure.
