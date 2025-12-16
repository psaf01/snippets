---
description: 'Vytvoř nový tip/how-to pro GHC tips knowledge base'
---

# Vytvoř GitHub Copilot tip/how-to

Vygeneruj nový tip nebo how-to dokument pro GitHub Copilot knowledge base v adresáři `GHC tips/`. Dodržuj strukturu a styl existujících tipů.

## Volitelný vstup
- `topic = ${input:topic:Téma tipu (např. "práce s MCP", "debugging workflow", "custom instructions")}`
- `filename = ${input:filename:Název souboru bez .md přípony (např. "mcp-workflow", "debug-tips")}`

## Struktura tipu

### 1. Hlavní nadpis (H1)
Stručný a jasný název tipu (např. "Script-Powered Workflow: Naučte Copilota používat skripty")

### 2. Úvodní sekce - Proč to děláme
**Popisný text (odstavce, ne odrážky):**
- Vysvětli problém nebo situaci, kterou tip řeší
- Napiš, jak tip mění přístup k řešení
- Používej přirozený jazyk, jako bys vysvětloval kolegovi

**Podsekce s přínosy:**
- Konkrétní přínosy, každý jako **tučný nadpis** s vysvětlením v samostatném odstavci
- Zaměř se na praktické výhody (determinismus, úspora času, stabilita)

**Kdy použít:**
- Seznam situací, kdy tip aplikovat
- Také uveď, kdy tip NENÍ vhodný (ale bez negativních příkladů "co se stane, když nepoužiješ")

### 3. Jak to nastavit / Jak na to
**Číslované kroky:**
- Každý krok jasně označený jako podnadpis (### 1., ### 2., ...)
- Ke každému kroku stručné vysvětlení
- Příklady kódu nebo konfigurace tam, kde je to relevantní
- **DŮLEŽITÉ:** Pokud kroky provádí Copilot (ne uživatel), explicitně to zdůrazni na začátku sekce

### 4. Praktický příklad (jeden konkrétní)
- Ukázka reálného použití
- Konkrétní prompt a výsledek
- Bez negativních scénářů ("co by se stalo bez tipu")
- Zaměř se na pozitivní demonstraci

### 5. Související tipy (nepovinné)
- Odkazy na související dokumenty v `GHC tips/`
- Pouze pokud jsou skutečně relevantní

## Pravidla formátování

- **Markdown standard** podle `instructions/markdown-focused.md`
- **Balance mezi textem a seznamy** - úvodní sekce popisné odstavce, návod strukturované seznamy
- **Stručnost** - eliminuj opakování, každá informace jen jednou
- **Čitelnost** - mezery mezi sekcemi, jasné nadpisy
- **Praktičnost** - příklady musí být konkrétní a testovatelné
- **Čistota** - žádné duplicity, žádné zbytečnosti

## Zásady obsahu

### Co DĚLAT ✅
- **Konkrétní a praktické** - zaměř se na aplikovatelné postupy
- **Testovatelné** - čtenář musí být schopen tip okamžitě vyzkoušet
- **Vysvětlující** - úvod má dát kontext a pochopení "proč"
- **Jeden tip = jedno téma** - pokud je téma komplexní, rozděl do více souborů
- **Pozitivní příklady** - ukazuj, jak to funguje správně

### Co NEDĚLAT ❌
- **ŽÁDNÉ negativní příklady** - neukazuj "co se stane, když to neuděláš" nebo "špatné názvy"
- **ŽÁDNÉ opakování** - každá informace jen jednou, vyvaruj se duplicitám
- **ŽÁDNÉ statistiky** - konkrétní čísla, výkony patří do `/tmp`
- **ŽÁDNÉ logy** - výpisy z terminálu, error zprávy do dokumentace nepatří
- **ŽÁDNÉ obecnosti** - vyvaruj se frází jako "může být užitečné", "často se používá"
- **ŽÁDNÉ rozsáhlé "best practices" sekce** - pokud jsou důležité, integrovej je do postupu

## Styl psaní

- **Úvod jako vyprávění** - vysvětli problém a řešení přirozeným jazykem, jako bys radil kolegovi
- **Přínosy popisně** - každý přínos jako tučný nadpis následovaný krátkým vysvětlujícím odstavcem
- **Postup strukturovaně** - číslované kroky s jasnými podnadpisy
- **Jeden praktický příklad** - stačí ukázat jeden funkční use case, ne všechny možné varianty
- **Eliminuj redundanci** - pokud jsi něco vysvětlil v úvodu, neopakuj to v postupu

## Workflow

1. **Zeptej se na téma** - pokud není zadáno `topic`, požádej o specifikaci
2. **Navrhni název souboru** - pokud není zadán `filename`, navrhni vhodný kebab-case název
3. **Vytvoř tip** podle vzoru `script-powered-workflow.md` nebo `chatmode-creation.md`
4. **Drž se struktury** - Proč (odstavce) → Jak nastavit (kroky) → Příklad (jeden konkrétní)
5. **Ulož soubor** do `GHC tips/[filename].md`
6. **Aktualizuj README.md** - přidej odkaz do příslušné kategorie

## Kontrola kvality

Před dokončením ověř:
- ✅ Všechny povinné sekce jsou vyplněné
- ✅ Tip je testovatelný a praktický
- ✅ README.md je aktualizován
- ✅ Formátování je konzistentní
- ✅ Žádné duplicity s existujícími tipy
- ✅ Odkazy fungují a jsou relativní

## Reference

- **Vzorové tipy:** `GHC tips/script-powered-workflow.md`, `GHC tips/chatmode-creation.md`
- **README struktura:** `GHC tips/README.md`
- **Markdown standard:** `instructions/markdown-focused.md`

## Příklad kvalitního tipu

Viz `script-powered-workflow.md` pro referenční strukturu:
- Úvod vysvětluje problém a řešení v odstavcích
- Přínosy jako samostatné podnadpisy s vysvětlením
- Jasně oddělená sekce "Kdy použít"
- Postup s explicitní informací, že vše dělá Copilot
- Jeden praktický příklad bez negativních scénářů
- Stručnost - celý tip ~80 řádků
