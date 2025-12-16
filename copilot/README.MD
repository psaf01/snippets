# Copilot Resources

GitHub Copilot resources, prompty, chatmodes, skripty a knowledge base.

## 📁 Struktura

- **`.github/`** - GitHub Copilot integrace
  - `chatmodes/` - Vlastní ChatMode agenty
  - `instructions/` - Speciální instrukce pro Copilota
  - `prompts/` - Custom prompty (/slash commands)

- **`scripts/`** - Automatizační PowerShell skripty
  - `commit-all.ps1` - Automatizovaný git workflow
  
- **`instructions/`** - Dokumentační standardy
  - `markdown-focused.md` - Markdown formatting guidelines
  - `analysis-standard/` - PlantUML diagram standardy

- **`plans/`** - Vytvořené prompt plány (generátor `/create-prompt`)

- **`replays/`** - Dokumentované workflow replays (záznam opakovatelných postupů)

- **`memories/`** - Memory Bank pro AI agenta
  - `workflows/` - Naučené procesy
  - `constraints/` - Pravidla a omezení
  - `tools/` - Dostupné nástroje
  - `metadata/` - Kontext projektu

- **`GHC tips/`** - Kompletní sbírka productivity tips a best practices pro GitHub Copilot
  - 11+ dokumentovaných workflows a tipů
  - Od základů po pokročilé techniky
  - Praktické příklady a use cases

- **`TODO.md`** - Dynamický seznam úkolů

## 🚀 Rychlý start

### Inicializace kontextu
Při každém zahájení session načti kontext:
```
/init
```

### Zobrazení memory
Koukni, co si pamatuješ:
```
/showMemory
```

### Vytvoření nového GHC tip
```
/ghc-tip <téma>
```

### Vytvoření nového úkolu
```
/todo <popis úkolu>
```

### Commit změn
Místo ručního commitu, použij skript:
```
.\scripts\commit-all.ps1 -Message "Popis změn"
```

### Vytvoření nového promptu
```
/create-prompt <popis>
```

## 📋 Konvence

- **Markdown**: Dodržuj `instructions/markdown-focused.md`
- **Skripty**: Jeden skript = jedním účelem, PowerShell se UTF-8
- **Prompty**: Ukládej do `plans/`, automatic numbering
- **Replays**: Dokumentuj opakovatelné workflows v `replays/`
- **Diagrams**: Dodržuj standardy v `instructions/analysis-standard/`

## 🔄 Workflow

1. Spusť `/init` pro načtení kontextu
2. Pracuj na úkolech
3. Commituj pomocí `scripts/commit-all.ps1`
4. Aktualizuj memory pomocí `/updateMemory` když se něco naučíš
5. Dokumentuj repeatable workflows do `replays/`

## 📚 Klíčové dokumenty

- **Memory Management**: `.github/instructions/memory-management.instructions.md`
- **Markdown Standard**: `instructions/markdown-focused.md`
- **PlantUML Standard**: `instructions/analysis-standard/`
- **GHC Tips**: `GHC tips/README.md` - Přehled všech dostupných tipů
- **Scripts**: `scripts/README.md` - Dokumentace dostupných skriptů

## 🔗 Přispívající oblasti

Každá sekce má svůj README pro snadnější orientaci:
- Chatmodes: vlastní AI agenti pro specifické úkoly
- Prompty: slash commands pro opakované pracovní postupy
- Analysis Standard: standardy pro diagramy a modelování
- Memory Bank: naučené znalosti a best practices
