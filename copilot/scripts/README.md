# Scripts

Kolekce PowerShell skriptů pro automatizaci opakovaných úkolů v workspace.

## Dostupné skripty

### `commit-all.ps1`
Automatizuje git workflow pro commit všech změn.

**Použití:**
```powershell
.\commit-all.ps1 -Message "Popis změn v češtině"
```

**Funkce:**
- Přidá všechny změny (`git add .`)
- Zobrazí status před commitem
- Provede commit s custom zprávou
- Zobrazí poslední commit

**Výhodě:**
- Deterministický workflow
- Ošetří kódování UTF-8 v PowerShell
- Kontrola, zda jsou vůbec změny ke commitu

## Přidávání nových skriptů

Nový skript přidejte, pokud:
- Činnost je **deterministická** (stejné kroky vždy)
- Operace má **více kroků** (aspoň 3-4)
- Script se bude používat **opakovaně**

## Konvence

- Jedno skript = jeden účel
- Jasné komentáře a Help text
- UTF-8 kódování pro Českou lokalizaci
