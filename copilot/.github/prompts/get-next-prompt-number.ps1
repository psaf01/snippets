# Get the next sequential prompt number from ./plans/
#
# Returns formatted 3-digit number (001, 002, 003, etc.)
# Used by /create-prompt custom command to determine filename
#
# Algorithm:
# 1. Recursively find all numbered .md files in ./plans/ and subdirectories
# 2. Extract the leading 3-digit number from each filename
# 3. Sort numerically and get the highest number
# 4. Increment by 1 and format as 3-digit number
# 5. If no files exist, default to 001

param(
    [string]$WorkspaceRoot = "."
)

# Find the plans directory
$PlansDir = Join-Path $WorkspaceRoot "plans"

# Check if plans directory exists
if (-not (Test-Path $PlansDir)) {
    Write-Output "001"
    exit 0
}

# Get all numbered prompt files (pattern: NNN-*.md)
$PromptFiles = Get-ChildItem -Path $PlansDir -Recurse -Filter "*.md" -File -ErrorAction SilentlyContinue | 
    Where-Object { $_.Name -match '^\d{3}-' }

if ($PromptFiles.Count -eq 0) {
    Write-Output "001"
    exit 0
}

# Extract numbers, sort, and get the highest
$HighestNum = $PromptFiles | ForEach-Object {
    if ($_.Name -match '^(\d{3})-') {
        [int]$matches[1]
    }
} | Sort-Object -Descending | Select-Object -First 1

# Increment and format as 3-digit number
$NextNum = $HighestNum + 1
Write-Output ("{0:D3}" -f $NextNum)
