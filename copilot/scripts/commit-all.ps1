# Quick Git Commit Script
# Skript pro rychly commit vsech zmen ve workspace

param(
    [string]$Message = "Automaticky commit zmen"
)

# Nastaveni kodovani konzole
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=== Git Commit Script ===" -ForegroundColor Green

# Pridani vsech zmen
Write-Host "Pridavam vsechny zmeny..." -ForegroundColor Yellow
git add .

# Kontrola statusu
Write-Host "`nStatus pred commitem:" -ForegroundColor Yellow
git status --short

# Zjisteni, zda jsou nejake zmeny ke commitu
$changes = git diff --cached --name-only
if (-not $changes) {
    Write-Host "`nZadne zmeny ke commitu." -ForegroundColor Red
    exit 0
}

# Commit s poskytnutou nebo defaultni zpravou
Write-Host "`nProvadim commit..." -ForegroundColor Yellow
git commit -m $Message

Write-Host "`nCommit dokoncen!" -ForegroundColor Green

# Zobrazeni posledniho commitu
Write-Host "`nPosledni commit:" -ForegroundColor Yellow
git log --oneline -1
