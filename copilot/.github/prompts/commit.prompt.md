# Úkol
Vygeneruj commit message a proveď commit pomocí skriptu `scripts/commit-all.ps1`.

## Workflow (POVINNÉ KROKY)
1.  **Vygeneruj commit message** podle formátu níže.
2.  **Spusť commit skript** `scripts/commit-all.ps1` s vygenerovanou zprávou jako parametrem `-Message`.


## Kontext
- Commit message musí být v **češtině** a dodržovat **Conventional Commits**.
- PowerShell skript pro commit je v `scripts/commit-all.ps1`.

## Formát commit message
- **První řádek (subject)**:  
  - max 72 znaků  
  - formát: `type(scope): stručný popis`  
  - `type` vyber z: feat, fix, refactor, docs, test, chore, ci, style, perf, build  
  - `scope` volitelný (např. api, ui, deps)
  - bez tečky na konci
- **Prázdný řádek**
- **Tělo (body)**:  
  - stručně vysvětli, co a proč se mění (odrážky `- `)

## Pravidla
- Nepiš generické fráze typu „update code“.
- **Výstupem je POUZE spuštění terminálového příkazu.** Žádný text navíc.

## Příklady
feat(auth): Přidat obnovu hesla přes e-mailový token

- Přidána endpoint logika pro generování a ověření tokenu
- Uložení expirace a invalidace starších tokenů

fix(api): Ošetřit null u filtru v /users/{id}

- Zabránit pádu na prázdné hodnoty v query parametru `filter`
