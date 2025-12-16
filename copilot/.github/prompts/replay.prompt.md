```prompt
---
description: Vytvoř opakovatelný workflow záznam z aktuální práce pro prezentaci a dokumentaci
---

# Replay Workflow - Dokumentace opakovatelného postupu

Tvým cílem je analyzovat aktuální kontext práce (otevřené soubory, nedávné změny, konverzaci) a vytvořit **strukturovaný, opakovatelný návod** ve formě přesných kroků s prompty. Výstup slouží k prezentaci, živému předvádění nebo opakování postupu.

## Účel

Vytvoř workflow dokument, který:
- Zachytí přesné prompty, které byly použity
- Vysvětlí použité nástroje a postupy dostupné ve workspace
- Umožní zopakovat stejný postup krok za krokem
- Bude vhodný pro živou prezentaci nebo demo

## Vstup

Analyzuj:
- **Aktuální kontext editoru** - otevřené soubory, aktivní soubor
- **Nedávné změny** - git diff, vytvořené/upravené soubory
- **Historii konverzace** - použité prompty a jejich výsledky
- **Workspace strukturu** - dostupné skripty, nástroje, konvence

## Postup

### 0. Určení čísla replay (POVINNĚ PRVNÍ)

Před vytvořením replay dokumentu:
1. Spusť PowerShell skript: `./.github/prompts/get-next-replay-number.ps1 -WorkspaceRoot .`
2. Extrahuj číslo (001, 002, 003, atd.) z výstupu
3. Použij ho v názvu souboru: `./replays/[number]-[descriptive-name].md`
4. Příklad: Pokud skript vrátí "003", ulož jako `./replays/003-python-analytical-chatmode-creation.md`

### 1. Identifikuj hlavní úkol
Pojmenuj, co bylo vyřešeno:
- "Vytvoření custom chatmode agenta pro Python analýzu"
- "Refactoring autentizační logiky"
- "Nastavení test workflow s Pester"

### 2. Extrahuj kroky práce
Pro každý krok zaznamenej:
- **Přesný prompt**, který byl použit (doslovný přepis nebo rekonstrukce)
- **Co se stalo** - jaké soubory vznikly, co se upravilo
- **Použité nástroje** - skripty ze `scripts/`, custom prompty z `.github/prompts/`, VS Code nástroje
- **Výstup kroku** - co vzniklo, jak se to ověřilo

### 3. Doplň kontext workspace
Pro každý nástroj/postup uveď:
- **Co to je** - stručný popis nástroje nebo skriptu
- **Kde se nachází** - cesta ve workspace
- **Proč se používá** - jaký problém řeší, výhoda oproti ručnímu postupu

### 4. Struktura výstupu

Vytvoř markdown dokument s touto strukturou:

```markdown
# [Název hlavního úkolu]

Stručné shrnutí, co bylo dosaženo a proč.

## Cíl

Jasně definuj, čeho chtěl uživatel dosáhnout.

## Prerekvizity

Co je potřeba před začátkem:
- Existující soubory/adresáře
- Nainstalované nástroje
- Znalosti o workspace struktuře

## Workflow krok za krokem

### Krok 1: [Název kroku]

**Prompt:**
```
[Přesný text promptu, který byl použit]
```

**Co se stalo:**
- [Vytvořil se soubor X]
- [Upravil se soubor Y]
- [Spustil se skript Z]

**Použité nástroje:**
- `scripts/xxx.ps1` - Popis, proč se používá
- Custom prompt `/xxx` - Odkaz na `.github/prompts/xxx.prompt.md`

**Výsledek:**
[Co konkrétně vzniklo, jak to vypadá]

**Ověření:**
[Jak se zkontrolovalo, že krok proběhl správně]

---

### Krok 2: [Název kroku]
...

## Konečný výsledek

Shrnutí, co bylo dosaženo:
- Seznam vytvořených souborů s relativními cestami
- Popis změn v existujících souborech
- Dosažený cíl

## Poznámky k opakování

Tipy pro případné zopakování:
- Co hlídat při opakování
- Možné variace postupu
- Alternativní přístupy
```

## Pravidla

### Co DĚLAT ✅
- **Přesné prompty** - doslovné citace nebo věrná rekonstrukce
- **Konkrétní nástroje** - ukazuj, které skripty/prompty existují ve workspace
- **Testovatelnost** - každý krok musí jít zopakovat
- **Jasná ověření** - jak poznat, že krok funguje
- **Relativní cesty** - všechny cesty jako relativní k workspace root
- **Stručnost** - jen podstatné informace, žádné zbytečnosti

### Co NEDĚLAT ❌
- **ŽÁDNÉ obecnosti** - konkrétní prompty, ne "řekni Copilotovi, ať..."
- **ŽÁDNÉ logy** - výpisy z terminálu nepatří do workflow dokumentace
- **ŽÁDNÉ statistiky** - konkrétní čísla, časy, velikosti souborů vynech
- **ŽÁDNÉ duplicity** - každá informace jen jednou
- **ŽÁDNÉ "co kdyby"** - jen to, co se skutečně stalo

## Umístění výstupu

Ulož dokument do:
```
./replays/[number]-[descriptive-name].md
```

Kde `[number]` je vygenerován skriptem `./.github/prompts/get-next-replay-number.ps1`.

Příklad: `./replays/001-python-analytical-chatmode-creation.md`

## Ověření kvality

Před dokončením zkontroluj:
- ✅ Každý krok má přesný prompt
- ✅ Každý použitý nástroj je vysvětlen a má cestu
- ✅ Workflow je opakovatelný bez dodatečných znalostí
- ✅ Výstup je vhodný pro živou prezentaci
- ✅ Žádné logy, statistiky nebo technické výpisy

## Reference workspace nástrojů

Při dokumentaci nástrojů vždy uveď:
- **Skripty** - `scripts/README.md` obsahuje přehled dostupných skriptů
- **Custom prompty** - `.github/prompts/*.prompt.md` jsou slash commands
- **Memory Bank** - `/memories` obsahuje pravidla a konvence workspace
- **Instrukce** - `instructions/*.md` definují standardy formátování

## Příklad kroku

```markdown
### Krok 1: Inicializace kontextu projektu

**Prompt:**
```
/init
```

**Co se stalo:**
- Copilot přečetl `/memories` pro pochopení pravidel workspace
- Načetl `GHC tips/README.md` pro orientaci v aktuálním adresáři
- Zastavil se na úrovni `AI-analysis` podle pravidla umbrella workspace

**Použité nástroje:**
- Custom prompt `/init` - `.github/prompts/init.prompt.md`
  - Automaticky načítá kontext od aktuálního souboru nahoru
  - Zastavuje se na umbrella workspace podle `memories/constraints/umbrella-workspace-boundary.md`

**Výsledek:**
Copilot získal kontext:
- Aktuální adresář je `GHC tips/` - kolekce GitHub Copilot tipů
- Workspace používá README-first přístup
- Existují skripty v `scripts/` a custom prompty v `.github/prompts/`

**Ověření:**
Copilot potvrdil pochopení struktury workspace v odpovědi.
```

## Success Criteria

- Workflow dokument je vytvořen v `./tmp/`
- Každý krok obsahuje přesný prompt a vysvětlení
- Všechny použité nástroje jsou identifikovány a popsány
- Postup je opakovatelný bez dodatečných informací
- Formátování splňuje `instructions/markdown-focused.md`
- Dokument je vhodný pro živou prezentaci
```
