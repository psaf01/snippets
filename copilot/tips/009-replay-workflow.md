# Workflow Replay: Jak zdokumentovat a zopakovat svůj postup

Představ si, že jsi právě dokončil složitější úkol s pomocí GitHub Copilot a chceš tento postup zdokumentovat pro prezentaci, školení nebo prostě pro sebe, abys ho mohl zopakovat. Místo manuálního zápisu použij custom prompt `/replay` (definice viz níže). Ten z aktuálního kontextu vytvoří strukturovaný návod s přesnými prompty a vysvětlením použitých nástrojů.

## Proč to používat

**Zachycení know-how**

Po dokončení úkolu máš často v hlavě celý postup, ale nikam ho nezapíšeš. Za týden už nevíš, jak přesně jsi problém vyřešil. `/replay` vytvoří dokumentaci automaticky z tvé aktuální práce – zachytí použité prompty, upravené soubory a nástroje workspace.

**Příprava prezentací a školení**

Když potřebuješ předvést workflow naživo nebo vytvořit materiál pro kolegy, `/replay` vygeneruje návod krok za krokem s přesnými prompty. Nemusíš vzpomínat, co přesně jsi zadal – Copilot to extrahuje z kontextu.

**Opakovatelnost postupů**

Některé úkoly se opakují – vytvoření nového chatmode agenta, nastavení projektu, refactoring podle vzoru. `/replay` vytvoří šablonu, kterou můžeš použít příště s minimálními úpravami.

## Kdy to použít

- **Po dokončení netriviálního úkolu**, kde jsi použil více kroků, promptů nebo nástrojů.
- **Před prezentací**, když potřebuješ materiál pro živé demo.
- **Pro dokumentaci best practices**, pokud chceš zachytit osvědčený postup.
- **Pro onboarding**, když vytváříš materiály pro nové členy týmu.

## Jak to funguje

### 1. Dokonči svůj úkol

Pracuj normálně s GitHub Copilot – používej prompty, vytvářej soubory, upravuj kód. Nic speciálního.

### 2. Spusť `/replay`

Když jsi hotový a chceš postup zdokumentovat, jednoduše zadej:

```
/replay
```

### 3. Copilot analyzuje kontext

Prompt automaticky:
- Projde historii konverzace a extrahuje použité prompty.
- Identifikuje změněné a vytvořené soubory (pomocí `git diff`).
- Rozpozná použité nástroje workspace (skripty, custom prompty).
- Pochopí hlavní cíl z kontextu tvé práce.

> **⚠️ Pozor:** `/replay` funguje pouze v rámci jednoho chat session (jednoho context window). Pokud jsi workflow rozpracoval přes více chatů, Copilot uvidí pouze historii aktuálního chatu.
> 
> Příkaz `/replay` navíc funguje nejlépe na nezahlceném kontextu. Pokud je historie krátká, lépe vystihne podstatu toho, co se dělalo a proč. Na velkém kontextu může být popis méně přesný nebo neúplný.
>
> **Doporučení:** Pro větší úkoly rozděl práci do více chatů, v každém použij `/replay` a výsledné dokumenty spoj do jednoho pomocí finálního promptu.

### 4. Vznikne workflow dokument

Copilot vytvoří strukturovaný markdown soubor v adresáři `/replays/`. Dokument bude obsahovat:
- **Přesné prompty**, které jsi použil (doslovné citace nebo věrná rekonstrukce).
- **Vysvětlení nástrojů** – které skripty nebo prompty byly použity a proč.
- **Kroky k ověření**, jak poznat, že daný krok funguje správně.
- **Popis konečného výsledku**, čeho bylo dosaženo.

## Praktický příklad

Představ si, že jsi právě vytvořil nový custom chatmode agent pro analýzu Python kódu. Použil jsi několik promptů, vytvořil konfigurační soubor a otestoval funkčnost.

**Zadáš:**
```
/replay
```

**Copilot vytvoří dokument**

`./replays/001-python-analytical-chatmode-creation.md`:


```markdown
# Vytvoření Python Analytical Chatmode Agenta

Vytvoření specializovaného chatmode agenta pro analýzu Python kódu s podporou 
in-memory databáze a vizualizací.

## Cíl

Vytvořit vlastního AI agenta, který při analýze Python kódu automaticky:
- Načte Python soubory do paměti
- Vytvoří in-memory databázi pro dotazování
- Nabídne vizualizace výsledků

## Workflow krok za krokem

### Krok 1: Inicializace kontextu

**Prompt:**
/init

**Co se stalo:**
- Copilot načetl Memory Bank pravidla z `/memories`
- Zjistil strukturu workspace a dostupné nástroje
- Identifikoval existující chatmode agenty jako referenci

**Použité nástroje:**
- `/init` - `.github/prompts/init.prompt.md`
  - Automatická inicializace kontextu projektu
  - Čtení README souborů směrem nahoru
  - Zastavení na umbrella workspace

**Výsledek:**
Copilot pochopil workspace strukturu a konvence

### Krok 2: Vytvoření chatmode souboru

**Prompt:**
Vytvoř nový chatmode agent v `.github/chatmodes/python-analytical.chatmode.md` 
podle vzoru existujících agentů. Agent má specializaci na Python analýzu s SQL 
databází a vizualizacemi.

**Co se stalo:**
- Vytvořil se soubor `.github/chatmodes/python-analytical.chatmode.md`
- Copilot použil existující agenty jako referenci
- Doplnil Python-specifické instrukce

**Použité nástroje:**
- Reference: `.github/chatmodes/knowledge-base.chatmode.md`
- Konvence z `memories/workflows/file-naming-convention.md`

**Výsledek:**
Nový chatmode soubor s kompletní konfigurací

**Ověření:**
Zkontrolován formát front-matter a markdown struktura

### Krok 3: Test chatmode agenta

**Prompt:**
@python-analytical Analyzuj strukturu souborů v `src/` adresáři a navrhni refactoring názvů, pokud neodpovídají funkcionalitě skriptů.

**Co se stalo:**
- Copilot aktivoval nový chatmode agent
- Načetl Python soubory ze `src/`
- Vytvořil analýzu podle instrukcí agenta

**Výsledek:**
Agent funguje podle očekávání, správně analyzuje Python kód

## Konečný výsledek

- Vytvořen: `.github/chatmodes/python-analytical.chatmode.md`
- Otestováno: Agent správně reaguje na Python analytické úkoly
- Dosaženo: Specializovaný nástroj pro Python analýzu ve workspace
```
