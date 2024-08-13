# This script is used to move files from one directory to another using robocopy
# The script also creates a log file to track the movement of the files
# Be sure to run vs code as ADMIN
# To run in Production change the $destinationDirectory to the appropriate server 
# Original script by: Rick Greenfield
# Modified by: Kate Totten 2024 February -- added multi-threading to improve performance
# Modified by: Kate Totten 2024/07/22 -- added recursion for additional files and folders under years  

# Create a log directory if it does not exist: Change DV, UA, or PR to the appropriate server
# Typically the log directory is on the DESTINATION SERVER
$logToServer = "\\UARW2-APP01\e$\Photos\DATA\"
$logFileName = "2023Log_Appeals" #Make unique for each run

$logDirectory = $logToServer + $logFileName #administrative drive share reference on DESTINATION SERVER
New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null

$logFilePath = Join-Path $logDirectory "Log.txt"

$sourceDirectory = "\\DVRW2-APP01\e$\Photos\DATA\2023"
Write-Host "Source file count: "+ ( Get-ChildItem -Recurse $sourceDirectory | Measure-Object ).Count;

# Save off previous file directory before running unless you intend to overwrite.
$destinationDirectory = "\\UARW2-APP01\e$\Photos\DATA\2023\"
# Create the destination directory if it doesn't exist
if (-not (Test-Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
}

$logFilePath = Join-Path $logDirectory "Log.txt"
robocopy $sourceDirectory $destinationDirectory *.* /COPY:DAT /LOG+:$logFilePath /NP /R:0 /MT:16 /E # /E to include all subdirectories including empty ones
$tempFilePath = "$logFilePath.temp"
Get-Content $logFilePath | Out-File -FilePath $tempFilePath -Encoding utf8
Remove-Item $logFilePath
Rename-Item $tempFilePath $logFilePath

Write-Host "Destination file count: "+ ( Get-ChildItem -Recurse $destinationDirectory | Measure-Object ).Count;
