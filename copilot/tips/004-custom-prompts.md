# Custom Prompts (Slash Commands) pro opakované úkoly

## Proč custom prompts

Když často děláš stejný typ úkolu s GitHub Copilotem, opakovaně vysvětluješ kontext, pravidla a očekávaný výsledek. Custom prompts (slash commands) mění tento přístup na jednoduché spuštění předpřipraveného promptu, který už obsahuje všechny instrukce, formátování a workflow.

Custom prompt je markdown soubor s příponou `.prompt.md` umístěný v `.github/prompts/`, který definuje konkrétní úkol pro Copilota. Po vytvoření se prompt objeví jako slash command v Copilot chatu - napíšeš `/` a vybereš ho ze seznamu. Copilot pak následuje přesné instrukce z promptu.

### Konzistence a kvalita

Custom prompt zajistí, že Copilot vždy dodržuje stejný formát a pravidla. Například commit message bude vždy v češtině, s Conventional Commits formátem a správnou strukturou. Nemusíš pokaždé vysvětlovat, jak má výsledek vypadat.

### Úspora času a tokenů

Místo psaní dlouhého promptu s instrukcemi stačí `/commit` a Copilot má okamžitě k dispozici kompletní kontext. Ušetříš tokeny i čas s opakovaným vysvětlováním stejných požadavků.

### DŮLEŽITÉ: Integrace se [skripty](https://wiki.kb.cz/pages/viewpage.action?pageId=1221093265)

Custom prompts ideálně využívají existující skripty z `scripts/` adresáře. Prompt definuje, co a jak se má udělat, a skript poskytuje deterministickou implementaci. Tato kombinace dává nejlepší výsledky.

### Kdy použít custom prompts

Vytvoř custom prompt, když:
- Úkol opakuješ (commit, backup, generování dokumentace)
- Výstup má specifický formát nebo pravidla (např. commit message, changelog)
- Workflow má více kroků, které je třeba dodržet v daném pořadí
- Chceš zajistit konzistenci napříč týmem nebo projekty

Nech na běžném promptu jednorázové nebo experimentální úkoly, kde pravidla nejsou pevně daná.

## Jak vytvořit custom prompt

### DŮLEŽITÉ: Text promptu píše Copilot sám
 Stačí říct, co má prompt dělat, a Copilot vytvoří soubor s kompletními instrukcemi. Když je potřeba prompt upravit, jednoduše požádáš Copilota o úpravu - např. "uprav prompt `/commit`, aby podporoval i tento případ". Nemusíš nic psát ručně.

### 1. Struktura souboru

Vytvoř `.prompt.md` soubor v `.github/prompts/` s touto strukturou:

```markdown
# Úkol
Stručný popis hlavního úkolu (1-2 věty).

## Workflow (POVINNÉ KROKY)
1. První krok, co Copilot udělá
2. Druhý krok s konkrétním postupem
3. Třetí krok

## Kontext
- Klíčové informace o prostředí, nástrojích, lokacích souborů
- Omezení nebo požadavky (jazyk, formát)

## Formát výstupu (pokud relevantní)
- Detailní specifikace očekávaného formátu
- Pravidla, limity, příklady

## Pravidla
- Specifická pravidla chování
- Co nedělat, co preferovat

## Příklady (volitelné)
Ukázky správného výstupu
```

### 2. Název souboru jako příkaz

Název souboru určuje slash command:
- `commit.prompt.md` → `/commit`
- `backup.prompt.md` → `/backup`
- `ghc-tip.prompt.md` → `/ghc-tip`

Používej kebab-case pro názvy s více slovy (např. `code-review.prompt.md` → `/code-review`).

### 3. Napojení na skripty

Když existuje skript pro úkol, prompt ho použije:

```markdown
## Workflow
1. **Vygeneruj commit message** podle formátu níže
2. **Spusť commit skript** `scripts/commit-all.ps1` s vygenerovanou zprávou
```

Tím kombinuješ flexibilitu Copilota (generování textu) s determinismem skriptu (provedení akce).
