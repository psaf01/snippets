---
description: 'Aktualizovat Memory Bank – uložit klíčové poznatky z aktuální konverzace do memories/'
---

# /updateMemory – Aktualizace Memory Bank

Projdi **celý kontext aktuální konverzace** a identifikuj **klíčové poznatky**, které by měly být zapamatovány pro budoucí práci. Zapiš je do `/memories` podle kategorie.

## Volitelný vstup
- `category = ${input:category:Do které kategorie uložit (workflows, constraints, tools, metadata) – nech prázdné pro automatické určení}`

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

## Evaluační checklist před uložením

Pro každý poznatek před uložením do memory polož tyto otázky:

### 1. ❓ Je to pattern nebo konkrétní případ?
- ✅ **Pattern**: "Když vytvářím strukturu, dělej X" → ULOŽ
- ❌ **Případ**: "V tomto projektu máme strukturu Y" → NEUKLÁDEJ

### 2. ❓ Použiji to i v jiném projektu/workspace?
- ✅ **Ano**: Meta-znalost → ULOŽ
- ❌ **Ne**: Project-specific → NEUKLÁDEJ

### 3. ❓ Lze to snadno najít ve workspace?
- ✅ **Ano, konkrétní soubor/místo**: Raději odkaz než kopie → ODKAZ nebo NEUKLÁDEJ
- ❌ **Ne, rozptýlená znalost**: Vydestilovaný pattern → ULOŽ

### 4. ❓ Je to pravidlo/princip, obecný nástroj nebo implementační detail?
- ✅ **Pravidlo**: "Jak používat skripty" → ULOŽ
- ✅ **Obecný nástroj**: "PowerShell skript pro git workflow (znovu použitelný)" → ULOŽ
- ❌ **Implementační detail**: "Tento modul má třídy X, Y, Z" → NEUKLÁDEJ
- ❌ **Konkrétní algoritmus**: "Validace IBAN: délka 24, formát..." → NEUKLÁDEJ

### 5. ❓ Časová stálost - změní se to často?
- ✅ **Stabilní**: Workflow, principy → ULOŽ
- ❌ **Mění se**: Seznam souborů, verze → NEUKLÁDEJ

## Postup

1. **Analyzuj kontext konverzace**:
   - Projdi celou historii chatu od začátku
   - Identifikuj **nové poznatky**, které nejsou v `/memories`
   - Hledej: naučené postupy, zjištěná pravidla, nové nástroje, změny v projektu

2. **Kategorizuj poznatky**:
   - **workflows/** – Nové postupy, osvědčené přístupy, workflow patterns (META-znalosti)
   - **constraints/** – Nová omezení, pravidla, co nedělat (META-pravidla)
   - **tools/** – Obecně použitelné nástroje/skripty, principy použití (NE inventář souborů workspace!)
   - **metadata/** – Meta-kontext, obecné principy organizace (NE konkrétní workspace popis!)

3. **Kontrola duplicit**:
   - Načti existující soubory v dané kategorii
   - Zkontroluj, zda poznatek již existuje
   - Pokud ano → **aktualizuj** existující soubor
   - Pokud ne → **vytvoř** nový soubor

4. **Zapiš do memory**:
   - **PŘED ZÁPISEM**: Projdi evaluační checklist (5 otázek výše)
   - Použij **atomické soubory** (1 soubor = 1 téma)
   - **Jasné názvy** souborů (např. `git-workflow.md`, `no-logs-in-docs.md`)
   - **Stručný obsah** – pouze klíčové informace
   - **Preferuj odkazy** – raději odkaz na existující soubor než kopie obsahu
   - **Formát**: nadpisy, seznamy, krátké věty
   - **Struktura**: PRINCIP + POSTUP + ODKAZ

5. **Potvrzení změn**:
   - Vypiš co bylo **přidáno** (nové soubory)
   - Vypiš co bylo **upraveno** (aktualizace existujících)
   - Vypiš co bylo **přeskočeno** (už existuje)

## Co NEUKLÁDAT do memory

❌ **NE:**
- Konkrétní výsledky nebo výstupy
- Specifická data z jednoho projektu
- Dočasné informace
- Logy, statistiky, čísla
- **IMPLEMENTAČNÍ DETAILY** - konkrétní názvy tříd, funkcí, souborů z jednoho úkolu
- **KONKRÉTNÍ ALGORITMY** - implementační detaily patřící pod konkrétní systém
- **DUPLICITY** - co už je v instructions/ nebo jiných souborech
- **PROJECT-SPECIFIC STRUKTURY** - "Modul X má komponenty A, B, C"

✅ **ANO:**
- Opakované vzory práce
- Obecná pravidla a konvence
- Postupy, které fungují
- **OBECNĚ POUŽITELNÉ NÁSTROJE** - skripty/tooly použitelné v jiných projektech
- Nástroje a jak je používat (princip)
- **META-PATTERNS** - přenositelné napříč projekty
- **PRINCIPY** - proč a jak něco děláme
- **ODKAZY** - kde najít detaily místo kopie obsahu

## Příklady dobrých a špatných záznamů

### ✅ DOBRÝ záznam (meta-znalost)
```markdown
# Používání skriptů

## Princip
Skripty mají prioritu před ručními příkazy - redukce chyb, konzistence.

## Workflow
1. Zkontroluj `scripts/README.md` - existuje skript?
2. Použij skript, pokud existuje
3. Ruční příkaz jen pokud skript neexistuje

## Kdy vytvořit nový skript
- Činnost deterministická + více kroků + opakovaná

Detaily v `scripts/README.md`
```

### ✅ DOBRÝ záznam (obecně použitelný nástroj)
```markdown
# PowerShell skript pro automatický commit

## Účel
Automatizuje git add + commit workflow s validací.

## Použití
```powershell
.\commit-all.ps1 -Message "Popis změn"
```

## Funkce
- Přidá všechny změny
- Zobrazí status před commitem
- Provede commit s custom zprávou

Umístění: `scripts/commit-all.ps1`
```

### ❌ ŠPATNÝ záznam (implementační detail)
```markdown
# Payment Processing - Implementační detaily

Modul má tyto třídy:
- PaymentProcessor.ts - hlavní procesor plateb
- IBANValidator.ts - validace IBAN (délka 24, první 2 písmena, pak čísla)
- FeeCalculator.ts - výpočet poplatků podle tarifu

Validační algoritmus:
1. Kontrola délky IBAN (24 znaků)
2. První dva znaky = kód země (CZ, SK...)
3. Zbývající znaky = čísla
4. Kontrolní součet modulo 97
```

**Proč špatně?** → Konkrétní názvy souborů, tříd a algoritmy specifické pro tento projekt - lze najít přímo v kódu

## Příklady

```
/updateMemory
→ Analyzuje konverzaci a automaticky uloží poznatky

/updateMemory category:workflows
→ Zaměří se na workflow poznatky z konverzace

/updateMemory category:constraints
→ Zaměří se na pravidla a omezení
```

## Zásady

- **Proaktivní** – hledej co zapamatovat sám
- **Atomické soubory** – 1 téma = 1 soubor
- **Jasné názvy** – popisné, srozumitelné
- **Stručnost** – jen klíčové informace
- **Čistota** – neukládej výstupy, jen vzory
