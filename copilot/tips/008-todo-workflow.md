# TODO Workflow: Správa úkolů bez přerušení práce

## Proč

Během kódování nebo analýzy je běžné, že si potřebuješ rychle poznamenat úkol, nápad nebo myšlenku. Často to znamená přepnout se do jiné aplikace (jako je poznámkový blok nebo specializovaný TODO manažer), což narušuje soustředění a vytrhává tě z kontextu. I když si poznámky vedeš přímo ve VS Code, musíš najít správný soubor, zapsat úkol a pak se vracet k původní práci. Stejně tak je zdlouhavé hledat a odškrtávat hotové úkoly.

**TODO workflow** tento proces radikálně zjednodušuje pomocí příkazů `/todo` a `/done`. Místo manuálního zapisování stačí říct Copilotovi, co je třeba udělat. On se postará o zapsání úkolu na správné místo a jeho obohacení o kontext z tvého pracovního prostředí. Když je práce hotová, příkaz `/done` inteligentně rozpozná dokončený úkol a automaticky ho označí, aniž bys musel cokoliv hledat.

### Přínosy

**Záznam úkolů bez ztráty soustředění**  
Jednoduše napiš `/todo <tvůj úkol>` a pokračuj v tom, co děláš. Copilot se postará o zbytek – najde správný soubor a zapíše úkol, aniž bys musel opustit svůj kód a přerušit myšlenkový tok.

**Úkoly s automatickým kontextem**
Copilot rozumí tvému pracovnímu prostředí. K úkolům automaticky přidává relevantní informace, jako jsou cesty k souborům nebo odkazy na konkrétní části kódu, takže jsou tvé poznámky vždy srozumitelné a plné kontextu.

**Chytré odškrtávání hotových úkolů**
Když napíšeš `/done`, Copilot z kontextu tvé práce pozná, který úkol jsi dokončil, a sám ho označí jako hotový. Už žádné zdlouhavé hledání správného řádku v TODO seznamu.

**Tvůj osobní projektový manažer**
Copilot má přehled o všech tvých úkolech. Dokáže ti doporučit, co dělat dál, upozornit na související úkoly nebo ti poskytnout přehled o celkovém stavu projektu.

## Jak to nastavit

Workflow je postaven na vlastních příkazech `/todo` a `/done`, které jsou navrženy tak, aby inteligentně pracovaly s kontextem tvého projektu a nabízely větší flexibilitu.

Vše je definováno pomocí souborů s custom prompty a centrální konfigurace.

### 1. Struktura TODO souboru

- **Výchozí umístění:** `TODO.md` v kořenovém adresáři workspace.
- **Vlastní konfigurace:** Cestu k souboru lze snadno změnit v souboru `package.json` přidáním klíče `todo.filePath`.

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "todo": {
    "filePath": "./docs/MY_TASKS.md"
  }
}
```

### 2. Struktura úkolu

Každý úkol má pro snadné strojové zpracování specifický formát:

```markdown
## [ ] #1 Název prvního úkolu

Obohacený popis úkolu, který může obsahovat cesty k souborům jako `src/auth.py:156` nebo jiné detaily přidané Copilotem.

## [ ] #2 Název druhého úkolu

Další popis...
```

### 3. Používání `/todo` příkazu

Zapiš nový úkol jednoduše:

```
/todo Přidat validaci vstupních parametrů do analyze-logs.ps1
```

Copilot na základě `todo.prompt.md`:
- Obohatí popis o kontext (existující soubory, funkce).
- Najde `TODO.md` (podle konfigurace v `package.json`).
- Přidá nový úkol s dalším volným ID ve správném formátu.

### 4. Používání `/done` příkazu

Když dokončíš úkol, máš několik možností:

- **S konkrétním ID:** `/done 1`
- **Automaticky z kontextu:** `/done` (Copilot se pokusí z konverzace poznat, který úkol byl dokončen)
- **Výběrem ze seznamu:** Pokud `/done` bez ID nedokáže úkol jednoznačně určit, nabídne ti seznam nesplněných úkolů k výběru.

Copilot na základě `done.prompt.md` změní `[ ]` na `[x]`.

## Praktický příklad

**Prompt:** `/todo Napsat skript pro parsování logů`

Copilot vytvoří `TODO.md` a přidá úkol:
```markdown
## [ ] #1 Napsat skript pro parsování logů

Úkol se týká vytvoření nového skriptu v `scripts/`.
```

Pokračuješ v práci a během toho ti dojde další úkol:

**Prompt:** `/todo Přidat filtrování podle time range do `scripts/analyze-logs.ps1``

Copilot aktualizuje `TODO.md`:
```markdown
## [ ] #1 Napsat skript pro parsování logů

Úkol se týká vytvoření nového skriptu v `scripts/`.

## [ ] #2 Přidat filtrování podle time range do `scripts/analyze-logs.ps1`

Doplnit existující skript `scripts/analyze-logs.ps1` o novou funkcionalitu.
```

Když dokončíš první úkol:

**Prompt:** `/done`

Copilot ví, že jsi pracoval na skriptu `analyze-logs.ps1`, a protože jsi ho právě vytvořil, identifikuje z kontextu první úkol a označí ho:
```markdown
## [x] #1 Napsat skript pro parsování logů

Úkol se týká vytvoření nového skriptu v `scripts/`.

## [ ] #2 Přidat filtrování podle time range do `scripts/analyze-logs.ps1`

Doplnit existující skript `scripts/analyze-logs.ps1` o novou funkcionalitu.
```

## Práce s naplněným TODO listem

Jediný centrální `TODO.md` soubor pro celý workspace slouží jako "hromada", kam odkládáš nápady v momentě, kdy tě napadnou. Síla tohoto přístupu nespočívá v manuálním procházení seznamu, ale v jeho flexibilní reorganizaci pomocí Copilota.

Kdykoli můžeš Copilotovi zadat, aby ti seznam úkolů přeorganizoval podle kritérií, která zrovna potřebuješ. Nemusíš číst surový TODO seznam odshora dolů – nech si z něj připravit reporty nebo extrakce na míru.

### Příklady, jak s TODO listem pracovat

- **Vytvoření kategorií:** "Zkategorizuj všechny úkoly v `TODO.md` podle projektů, ke kterým se vztahují."
- **Extrakce do souboru:** "Vytáhni všechny úkoly týkající se projektu 'MyProject' z `TODO.md` do souboru `MyProject-tasks.md` a v původním souboru je smaž."
- **Generování reportu:** "Jaký je přehled všech úkolů s vysokou prioritou, které ještě nebyly dokončeny v `TODO.md`?"
- **Hloubková analýza:** "Vyber všechny úkoly související s refaktoringem z `TODO.md` a navrhni, v jakém pořadí bych je měl řešit."

Díky tomu je systém extrémně flexibilní. Nemusíš se dopředu rozhodovat o struktuře – tu vytváříš dynamicky podle aktuálních potřeb.

