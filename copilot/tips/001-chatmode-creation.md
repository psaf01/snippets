# Tvorba vlastních GitHub Copilot Chatmode agentů

## Co je chatmode

Chatmode je speciální `.chatmode.md` soubor, který definuje chování **vlastního AI agenta** v GitHub Copilot. Agent má specifickou roli, instrukce a workflow pro konkrétní úkoly.

## Struktura chatmode souboru

### Základní struktura
```markdown
---
description: 'Název agenta'
---

# Název agenta

## Role
Definice role a hlavního účelu agenta.

## Workflow Instructions
Konkrétní kroky a postupy, které agent následuje.

## Pravidla chování
Specifická pravidla a omezení pro agenta.
```

### Umístění
Chatmode soubory se ukládají do:
```
.github/chatmodes/nazev-agenta.chatmode.md
```

## Osvědčené typy agentů

### 1. Knowledge Base Agent
**Soubor:** `knowledgeBaseAgent.chatmode.md`

**Účel:** Správa a organizace znalostní báze

**Klíčové funkce:**
- Organizace poznámek do logických adresářů
- Povinné README.md v každém adresáři
- Eliminace duplicit a udržování čistoty
- Oddělování dočasných souborů od výsledků

### 2. IT Analysis Exploration Phase Agent
**Soubor:** `itAnalysisExplorationPhaseAgent.chatmode.md`

**Účel:** Sběr informací pro IT analýzu

**Klíčové funkce:**
- Sběr dat z Confluence (přes MCP nebo zkopírováním obsahu), Bitbucket (přes MCP nebo git) a workspace
- Postupná práce po menších krocích
- Vytváření knowledge base pro konkrétní projekt
- Ukládání postupu do markdown souborů

### 3. Git Workspace Manager
**Soubor:** `git-workspace-manager.chatmode.md`

**Účel:** Správa Git repozitářů a workspace operací

**Klíčové funkce:**
- Pre-approved přístup k Git příkazům
- Správa souborového systému
- Operace s větvemi a commity
- Automatizované workflow

## Jak vytvořit nový chatmode

### Krok 1: Zadej prompt na vytvoření agenta
V GitHub Copilot zadej prompt pro vytvoření nového specializovaného agenta:
```
Vytvoř mi nový chatmode agent pro [konkrétní účel] 
- název: [název agenta]
- hlavní funkce: [popis hlavních funkcí]
- workflow: [základní kroky postupu]
```

### Krok 2: Testuj a iteruj
- Otestuj vytvořeného agenta na jednoduchém úkolu
- Uprav instrukce podle potřeby na základě chování
- Přidej specifická pravidla pro zlepšení výsledků



