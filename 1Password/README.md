<div align="center">
  <img src="https://github.com/ALARP-Solutions/Chocolatey-Intune/blob/master/VSCode/logo.png" alt="Logo" width="80" height="80">
  <h1>Chocolatey Intune - 1Password</h1>
</div>

## Configuring VSCode

### App Information
| Field | Data |
| --- | --- |
| Name | Visual Studio Code |
| Description | Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (such as C++, C#, Java, Python, PHP, Go) and runtimes (such as .NET and Unity). |
| Publisher | Microsoft |
| Information URL | https://code.visualstudio.com/docs |
| Privacy URL | https://privacy.microsoft.com/privacystatement |
| Category | Utilities & Tools |
| Logo | [logo.png](https://github.com/ALARP-Solutions/Chocolatey-Intune/blob/master/VSCode/logo.png) |

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
| Minimum operating system | Windows 10 20H2 |
| Install Behaviour | System |
| Disk space required (MB) | 350 |
| Physical memory required (MB) | _ |
| Minimum number of logical processors required | _ |
| Minimum CPU speed required (MHz) | _ |
| Additional requirement rules | _ |

### Detection Rules
| Field | Data |
| --- | --- |
| Rules Format | Use a custom detection script |
| Script | [detect.ps1](https://github.com/ALARP-Solutions/Chocolatey-Intune/blob/master/VSCode/detect.ps1) |
| Run script as 32-bit process on 64-bit clients | No |
| Enforce script signature check and run script silently | No |

### Dependencies
- Chocolatey

### Supersedence
Maybe set to supersede previous versions at you leisure.
