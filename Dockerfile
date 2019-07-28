# escape=`
FROM mcr.microsoft.com/windows/servercore:1803

SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]

RUN iex (wget 'https://chocolatey.org/install.ps1' -UseBasicParsing);

RUN choco install sql-server-management-studio -y 

RUN choco install -y azure-cli

RUN Install-PackageProvider -Name NuGet -Force

RUN Install-Module -Name SqlServer -AllowClobber -Force

RUN Install-Module -Name Az -AllowClobber -Force

RUN setx path 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE;'
