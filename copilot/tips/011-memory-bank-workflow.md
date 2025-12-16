# Memory Bank: Trvalá paměť pro GitHub Copilot napříč sezeními

## Proč Memory Bank

GitHub Copilot začíná každé sezení s prázdnou pamětí. Zapomene strukturu projektu, konvence a workflow, které jste společně nastavili. Musíte mu znovu vysvětlovat pravidla, ukazovat, kde jsou skripty, a opakovat, jak organizovat dokumenty.

**Memory Bank** tento přístup mění: vytvoříte adresář `/memories` s klíčovými znalostmi o projektu – workflow, pravidla, nástroje a kontext. Každé nové sezení pak Copilot začne tím, že načte Memory Bank a okamžitě rozumí, jak ve workspace pracujete. Nejde o dokumentaci projektu, ale o osobní znalostní bázi pro efektivní spolupráci s AI.

### Trvalá paměť mezi sezeními

Copilot se učí během práce a ukládá poznatky do `/memories`. Když se k práci vrátíte, načte je a plynule pokračuje tam, kde jste skončili. Žádné opakování základních pravidel, žádné zdlouhavé vysvětlování struktury.

### Meta-znalosti místo detailů

Memory Bank neukládá konkrétní kód nebo výsledky analýz. Ukládá **vzorce (patterns)** – jak pracujete, které nástroje používáte a jaká pravidla dodržujete. Místo "v souboru X je funkce Y" obsahuje pravidlo jako "před vytvořením nového souboru vždy zkontroluj, zda neexistuje podobný".

### Proaktivní učení

Copilot nemusí čekat na pokyn k uložení znalostí. Po každém úkolu sám identifikuje, co stojí za zapamatování, a aktualizuje Memory Bank. Workflow se tak postupně vylepšuje a přizpůsobuje vašim preferovaným přístupům.

### Kdy použít Memory Bank

Nastavte Memory Bank, když:
- Pracujete na projektu dlouhodobě a chcete zajistit konzistentní přístup.
- Máte specifické workflow nebo konvence, které musí Copilot dodržovat.
- Chcete, aby se Copilot učil z každé interakce a postupně se zlepšoval.
- Potřebujete sdílet znalosti mezi více agenty nebo členy týmu.

Memory Bank nepotřebujete pro jednorázové úkoly nebo pokud vám vyhovuje výchozí chování Copilota.

## Jak to nastavit

**Důležité:** Všechny následující kroky může nastavit Copilot automaticky. Vaše role je pouze říct "nastav Memory Bank" a Copilot vytvoří strukturu, instruktážní soubor, vlastní prompty a začne aktivně spravovat znalosti.

### 1. Struktura adresářů

Vytvořte adresář `/memories` v kořeni workspace s atomizovanou strukturou:

```
workspace/
└── memories/
    ├── README.md           # Přehled Memory Bank
    ├── workflows/          # Naučené postupy
    ├── constraints/        # Pravidla a omezení
    ├── tools/              # Dostupné nástroje
    └── metadata/           # Kontext projektu
```

### 2. InstruKční soubor

Přidejte soubor `.github/instructions/memory-management.instructions.md` s pravidly:

```markdown
# Memory Bank Management

## Core Workflows

### Before Task - Initialization
1. Check if `/memories` directory exists.
2. Load relevant memory files for the current context.
3. Execute the task in accordance with memory.

### After Task - Learning
1. Create new files with newly acquired knowledge.
2. Update existing files with new information.
3. Delete outdated or unnecessary files.
```

Detail viz [memory-management.instructions.md](../.github/instructions/memory-management.instructions.md)

### 3. Vlastní prompty pro správu

Vytvořte specializované prompty v `.github/prompts/`:

**`updateMemory.prompt.md`** – Aktualizace po dokončení úkolu:
```markdown
/updateMemory
→ Analyzuje konverzaci a uloží nové poznatky do /memories.
```

**`showMemory.prompt.md`** – Přehled uložených znalostí:
```markdown
/showMemory
→ Zobrazí obsah Memory Bank (workflows, constraints, tools, metadata).
```

**`pruneMemory.prompt.md`** – Čištění a refaktoring paměti:
```markdown
/pruneMemory
→ Odstraní duplicity, sloučí související témata a optimalizuje paměť.
```

### 4. Atomické soubory

Každý soubor v Memory Bank by měl obsahovat pouze jedno téma:

```
workflows/
├── readme-requirement.md       # Jedno pravidlo
├── markdown-formatting.md      # Jeden standard
└── init-workflow.md            # Jeden postup
```

Vyhněte se velkým souborům s mnoha tématy. Atomicita usnadňuje aktualizaci a předchází duplicitám.

### 5. Meta-znalosti vs. detaily

**Ukládejte meta-znalosti ✅**
- "Před vytvořením souboru zkontroluj podobné existující."
- "README.md musí být v každém adresáři."
- "Používej skripty místo ručních příkazů."

**Neukládejte implementační detaily ❌**
- "Soubor `payment-processor.ts` obsahuje funkci `validateIBAN()`."
- "Algoritmus validace IBAN: délka 24, první 2 znaky jsou písmena..."
- "PlantUML používá barvu `#d5e8d4` pro komponenty."

Testovací otázka: "Použil bych tento postup i v jiném projektu?" Pokud ano, uložte ho. Pokud ne, neukládejte.

## Praktický příklad

**Situace:** Pracujete s Copilotem na analýze platebního systému. Vytváříte PlantUML diagramy a píšete dokumentaci v Markdownu.

### První sezení – Učení

Prompt: **"Vytvoř sekvenční diagram platebního procesu."**

Copilot vytvoří diagram podle obecných pravidel. Po dokončení použijte:

```
/updateMemory
```

Copilot analyzuje práci a uloží do `/memories`:
- `workflows/plantuml-diagrams.md` – jak strukturovat diagramy
- `constraints/clean-documentation.md` – pravidlo o neukládání logů do README
- `workflows/readme-requirement.md` – pravidlo, že každý adresář má mít README

### Druhé sezení – Aplikace paměti

Za týden se vrátíte k projektu.

Prompt: **"Pokračuj v dokumentaci autorizačního procesu."**

Copilot automaticky:
1. Načte obsah adresáře `/memories` a ví, že každý adresář má mít README.
2. Použije naučený styl pro PlantUML diagramy.
3. Dodrží pravidlo "žádné logy v dokumentaci".
4. Po dokončení práce sám navrhne aktualizaci Memory Bank o nové poznatky.

Žádné opakování pravidel. Copilot pracuje s kontextem z minulé spolupráce.
