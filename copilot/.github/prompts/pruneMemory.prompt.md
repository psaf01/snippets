---
description: 'Pročistit Memory Bank – refactoring struktury, odstranění duplicit, zlepšení přehlednosti'
---

# /pruneMemory – Refactoring Memory Bank

Projdi **celou strukturu `/memories`** a proveď refactoring pro lepší přehlednost, odstranění duplicit a optimalizaci obsahu. Cílem je udržet pouze **klíčové informace** potřebné k pochopení práce.

## Postup

### 1. **Analýza současného stavu**
   - Načti všechny soubory z `/memories`
   - **Pro každý soubor aplikuj test**: "Je to meta-pattern nebo detail workspace?"
   - Identifikuj:
     - **Implementační detaily** – konkrétní názvy tříd, funkcí, algoritmy → SMAZAT
     - **Workspace-specific** – konkrétní detaily tohoto projektu → SMAZAT nebo ZOBECNIT
     - **Duplicity** – stejné informace na více místech nebo v instructions/ → ZKRÁTIT NA ODKAZ
     - **Přílišné detaily** – informace, které lze najít ve workspace → ODKAZ
     - **Zastaralé informace** – neaktuální pravidla, workflow → SMAZAT
     - **Špatně kategorizované** – soubory ve špatné složce → PŘESUNOUT
     - **Vágní názvy** – nejasné, nesrozumitelné názvy souborů → PŘEJMENOVAT

### 2. **Kategorizace problémů**
   Vytvoř **plán refactoringu** v `/tmp/memory-prune-plan.md`:
   - Co smazat (zastaralé, duplicitní)
   - Co sloučit (podobná témata)
   - Co rozdělit (příliš široké soubory)
   - Co přejmenovat (nejasné názvy)
   - Co přesunout (špatná kategorie)
   - Co zkrátit (přílišné detaily)

### 3. **Provádění změn**
   
   **Odstranění duplicit:**
   - Najdi stejné nebo podobné informace v různých souborech
   - Ponechej jen **jeden zdroj pravdy**
   - Ostatní soubory buď smaž, nebo přidej **odkaz** na primární zdroj
   
   **Slučování:**
   - Několik malých podobných souborů → 1 ucelený soubor
   - Zachovej atomicitu (1 téma = 1 soubor)
   
   **Rozdělování:**
   - Příliš široký soubor s více tématy → více atomických souborů
   
   **Zkracování:**
   - Odstraň **detaily**, které lze najít ve workspace
   - Ponechej jen **klíčové principy** a **odkazy** kam jít pro detail
   - Formát odkazu: `Detaily v \`path/to/file.md\``
   
   **Přejmenování:**
   - Použij **popisné názvy** (např. `git-commit-workflow.md` místo `workflow1.md`)
   - Konzistentní pojmenování: `kebab-case.md`
   
   **Reorganizace:**
   - Přesuň soubory do správných kategorií
   - Ujisti se, že každý soubor je ve správné složce

### 4. **Kontrola konzistence**
   - **README.md** v `/memories` odpovídá struktuře?
   - Všechny soubory mají **jasný účel**?
   - Žádné **mrtvé odkazy**?
   - **Atomicita** zachována (1 soubor = 1 téma)?

### 5. **Výstup refactoringu**
   
   Vypiš **souhrn změn**:
   ```
   ✅ Memory prune dokončen:
   
   📝 Upraveno:
   - workflows/git-workflow.md (zkráceno, přidány odkazy)
   - constraints/clean-docs.md (sloučeno s no-logs.md)
   
   ➕ Přidáno:
   - workflows/prompt-creation.md (rozděleno z general-workflow.md)
   
   🗑️ Smazáno:
   - workflows/old-approach.md (zastaralé)
   - tools/duplicate-script.md (duplicita)
   
   🔄 Přesunuto:
   - metadata/script-info.md → tools/script-info.md
   
   📊 Celkem:
   - Soubory před: 12
   - Soubory po: 9
   - Duplicity odstraněny: 2
   - Úspora prostoru: ~35%
   ```

## 🧠 META-ZNALOSTI vs. DETAILY - Jak rozpoznat rozdíl?

### Meta-znalost = PAMATUJ ✅
**Test**: "Použil bych tento postup/pravidlo i v jiném projektu?"

**Příklady:**
- "Před vytvořením souboru vždy zkontroluj podobné existující" ✅
- "README.md musí být v každém adresáři" ✅
- "Používej skripty místo ručních příkazů" ✅
- "Žádné logy v dokumentaci" ✅
- "Postupuj po menších krocích, ukládej do /tmp" ✅
- "PowerShell skript commit-all.ps1 - automatizuje git workflow" ✅ (obecně použitelný nástroj)

**Struktura meta-znalosti:**
- PRINCIP (proč to děláme)
- POSTUP (jak to dělat)
- ODKAZ (kde najít detaily)

### Implementační detail = NEČTI ZNOVU ❌
**Test**: "Je to konkrétní detail patřící jen pod tento úkol/implementaci?"

**Příklady:**
- "Soubor payment-processor.ts obsahuje funkci validateIBAN()" ❌
- "Algoritmus pro validaci IBAN: délka 24, první 2 písmena, pak čísla..." ❌
- "PlantUML používá barvu #d5e8d4 pro squad komponenty" ❌
- "V tomto modulu jsou třídy: OrderService, PaymentService, NotificationService" ❌
- "Funkční specifikace v3.md má sekce: Kontext, API, Data Model" ❌

**Proč NESKLADOVAT:**
- Lze kdykoliv přečíst ze souborů
- Mění se (zastaralá info v paměti škodí)
- Zabírá místo
- Není přenositelné do jiných projektů
- Je to detail jedné konkrétní implementace

## Kategorie obsahu - co dělat s každou

### 📋 IMPLEMENTAČNÍ DETAILY (konkrétní třídy, funkce, algoritmy)
**Příklady:** "Modul má třídy X, Y, Z", "Algoritmus validace: krok 1, 2, 3...", "Soubor obsahuje funkce A, B, C"
**Akce:** 🗑️ SMAZAT - lze najít přímo v kódu/dokumentaci
**Výjimka:** Obecně použitelné nástroje/skripty (viz níže)

### 🎯 META-PATTERN (obecný postup)
**Příklady:** "Používej skripty před ručními příkazy", "Postupuj po krocích"
**Akce:** ✅ ZACHOVAT - přenositelná znalost

### 📝 DUPLICITA (je to někde jinde)
**Příklady:** Pravidla z instructions/, popis ze souboru README
**Akce:** 🔗 ZKRÁTIT NA ODKAZ - "Detaily v `path/to/file.md`"

### 🏗️ WORKSPACE-SPECIFIC (konkrétní pro tento projekt)
**Příklady:** "AI-ANALYSIS má umbrella strukturu", "PlantUML barvy projektu"
**Akce:** 🗑️ SMAZAT nebo 🔄 ZOBECNIT na pattern

### ⚖️ PRINCIP + ODKAZ (správný formát)
**Příklady:** "README povinné (proč) + viz instructions/readme-standard.md"
**Akce:** ✅ ZACHOVAT - ideální formát

### 🔧 OBECNĚ POUŽITELNÉ NÁSTROJE (znovu použitelné skripty/tooly)
**Příklady:** "PowerShell skript pro commit workflow", "Python nástroj pro analýzu logů"
**Test:** Použiji tento skript/nástroj v jiných projektech?
**Akce:** ✅ ZACHOVAT - pokud je obecně použitelný a znovu využitelný
**Formát:** Popis nástroje + účel + jak použít + odkaz kde najít

## Principy pruningu

### ❌ ODSTRANIT
- Zastaralé informace
- Duplicitní obsah
- Přílišné detaily (lze najít ve workspace)
- Konkrétní výsledky, logy, statistiky
- Vágní, obecné informace bez hodnoty
- **IMPLEMENTAČNÍ DETAILY** - konkrétní názvy tříd, funkcí, souborů z jednoho úkolu
- **KONKRÉTNÍ ALGORITMY** - implementační detaily patřící pod konkrétní systém
- **PROJECT-SPECIFIC STRUKTURY** - "Modul X má komponenty A, B, C"

### ✅ ZACHOVAT
- Klíčové principy a pravidla
- Osvědčené postupy
- Workflow patterns
- Důležitá omezení
- **Odkazy** na detailní informace ve workspace
- **META-PATTERNS** - přenositelné napříč projekty
- **OBECNĚ POUŽITELNÉ NÁSTROJE** - skripty/tooly znovu použitelné v jiných projektech

### 🔗 ODKAZY místo DETAILŮ
Místo ukládání celého obsahu:
```markdown
## Markdown formátování

Dodržuj pravidla v `instructions/markdown-focused.md`.

Klíčové body:
- Krátké věty
- Struktura > detail
- Seznamy a nadpisy
```

## Bezpečnostní pravidla

- **Před smazáním** souboru se ujisti, že informace nejsou unikátní
- **Při sloučení** zachovej všechny klíčové informace
- **Při zkracování** neztrácej kontext
- **Vytvoř backup** – ulož původní stav do `/tmp/memory-backup/` před změnami

## Příklady použití

```
/pruneMemory
→ Provede kompletní refactoring memory struktury

/pruneMemory
→ Zobrazí plán v /tmp, pak provede změny po potvrzení
```

## Výstup

- **Plán** v `/tmp/memory-prune-plan.md`
- **Souhrn změn** – co bylo upraveno/smazáno/přidáno
- **Statistiky** – počty před/po, úspora prostoru
- **Doporučení** – co ještě by mohlo být vylepšeno
