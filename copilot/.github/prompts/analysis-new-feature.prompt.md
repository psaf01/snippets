
---
name: analysis
description: "Vytvoř strukturovanou analýzu nové funkce ve formátu Markdown."
argument-hint: "Zadej název funkce, kontext a cílové uživatele (např. 'Fakturace: export do CSV pro účetní')."
agent: "Analytik"
tools: ["codebase", "search", "usages"]
---

# Úloha: Analýza nové funkce (${featureName})

## Cíl
Připrav **jediný** dokument ve formátu **Markdown**: `analysis_${featureName}.md`.

## Postup (po krocích, s odůvodněním)
1. **Shrnutí záměru & scope**  
   - *Proč:* Zarámuje řešený problém a snižuje riziko rozšiřování scope.
2. **Stakeholdeři a business pravidla**  
   - *Proč:* Ovlivňují validaci a finální chování.
3. **Funkční požadavky (user stories + acceptance criteria)**  
   - *Proč:* Převádí požadavky do ověřitelných scénářů (Given/When/Then).
4. **Nefunkční požadavky (výkon, bezpečnost, observabilita)**  
   - *Proč:* Zamezí reworkům a nejasnostem po implementaci.
5. **Datový model & zdroje dat** (diagram/JSON příklad)  
   - *Proč:* Referenční rámec pro vývoj a testy.
6. **API/rozhraní návrh (pokud relevantní)**  
   - *Proč:* Vytvoří jasný kontrakt pro vývojáře/testera. Uveď mapování výsledků ve stylu **Ardalis.Result** (Success/Invalid/NotFound/Conflict) na HTTP kódy, bez implementace.
7. **Edge cases & rizika**  
   - *Proč:* Zlepší robustnost a pokrytí testů.
8. **Checklist pro handoff na Vývojáře**  
   - *Proč:* Minimalizuje dotazy před implementací.

## Výstup
Vrať kompletní `analysis_${featureName}.md` v těle odpovědi. Neprováděj úpravy kódu ani terminálu.
