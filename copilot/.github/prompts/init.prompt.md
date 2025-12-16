---
description: 'Rychlá orientace v projektu – projdi README a manifesty od aktuálního souboru směrem nahoru'
---

# INIT – kontext projektu od aktuálního souboru směrem nahoru

Tvým cílem je **rychle a bezpečně** pochopit kontext projektu od adresáře **aktuálně otevřeného souboru** směrem k rodičovským složkám, hlavně čtením `README` souborů. **Vyhni se čtení umbrella workspace** `AI-ANALYSIS` - zaměř se pouze na **aktuální projekt a jeho bezprostřední kontext**. **Nedělaj žádné změny** (jen čti a sumarizuj).

## Volitelný vstup
- `startFrom = ${input:startFrom:Absolutní cesta k souboru nebo složce (nech prázdné pro aktuální editor)}`

## Postup (read-only)
0. **Načti Memory Bank** (POVINNĚ PRVNÍ):
   - Zkontroluj existenci `/memories` v kořeni workspace
   - Pokud existuje, přečti si všechny soubory v `/memories` (README.md a všechny podsložky)
   - Tím se naučíš pravidla, workflowy a konvence, které používáme
   - Pamatuj si je pro zbývající práci

1. **Urči výchozí složku** `cwd`:
   - Pokud `startFrom` ukazuje na soubor → `cwd = dirname(startFrom)`.
   - Pokud `startFrom` ukazuje na složku → `cwd = startFrom`.
   - Jinak použij **adresář aktivního souboru** v editoru. Pokud žádný aktivní soubor není, slušně si o něj řekni.

2. **Omezení a bezpečnost**
   - **ZASTAVÍ SE na úrovni AI-ANALYSIS**: Pokud by dalším krokem nahoru byl adresář s názvem `AI-ANALYSIS`, **skonči zde** a tento adresář už nečti. Je to umbrella workspace obsahující mnoho nesouvisejících projektů.
   - **Maximální hloubka**: Projdi nejvýše 3-4 úrovně nahoru od výchozího souboru
   - Ignoruj typicky velké/derivované složky: `node_modules`, `dist`, `build`, `.git`, `.venv`, `.idea`, `tmp`, atd.
   - **Neprováděj editace** souborů – jen čti/parsuj.

3. **Iterativní průchod směrem nahoru**
   - Pro aktuální `dir`:
     - Hledej README (case-insensitive): preferuj `README.md`, dále `README`, `README.txt`, `README.rst`.
       - Když existuje: **přečti** ho a vytěž:
         - účel/prohlášení projektu, hlavní komponenty/moduly,
         - prerekvizity a běžné příkazy (build/run/test),
         - popsanou strukturu a odkazy na subprojekty/packagy,
         - klíčové konvence a požadavky prostředí.
       - Když **README chybí**: **zběžně** prolétni *jen top‑level* soubory a z manifestů/konfigurací vytěž minimum:
         - typické manifesty: `package.json`, `pyproject.toml`, `requirements.txt`, `poetry.lock`,
           `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`,
           `Dockerfile`, `docker-compose.yml`, `Makefile`,
           `.sln`, `.csproj`, `*.tf`, apod.
         - vyzobej název balíčku/aplikace, hlavní závislosti high‑level, skripty a verze nástrojů/SDK.
     - Zapiš krátkou **lokální sumarizaci** tohoto `dir` (max 6–8 bodů).
   - Posuň se na **rodiče** `dir = parent(dir)` a opakuj, dokud:
     - nedosáhneš maximální hloubky (3-4 úrovně), nebo
     - další krok nahoru by vedl do adresáře `AI-ANALYSIS` (v tom případě **skonči bez čtení tohoto adresáře**), nebo
     - nedosáhneš kořene filesystemu

4. **Výstup (jedna zpráva)**
   - **Rychlé shrnutí** (3–6 odrážek): hlavní technologie, struktura, build/run/test.
   - **Zjištěná struktura nahoře‑dolů**: pro každou úroveň uveď relativní cestu, zda byl README, a 1–2 věty zjištění + klíčové manifesty.
   - **Praktické příkazy**: odvozené `build/run/test` (jen pokud dávají smysl).
   - **Nejasnosti / co ověřit**: kde chybí README, možné ambivalence.
   - Odkazy na soubory uváděj jako relativní cesty v backticks. **Nic needituj.**

## Zásady
- Buď **úsporný v čtení** – sahni jen na nejsignálnější soubory (README/manifesty).
- U multi‑repo/mono‑repo to výslovně uveď.
- Je‑li výstup příliš dlouhý, nabídni „krátkou“ i „detailní“ verzi.
