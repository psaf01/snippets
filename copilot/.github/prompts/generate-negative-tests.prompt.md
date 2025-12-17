
---
name: generate-negative-tests
description: "Vytvoř negativní a chybové testy (Invalid, NotFound, Conflict) v xUnit."
argument-hint: "Zadej cílovou třídu/metodu (např. 'InvoiceService.GetById')."
agent: "Tester"
tools: ["codebase", "search", "usages", "findTestFiles", "terminal"]
---

# Úloha: Negativní testy pro ${classOrMethod}

## Kroky (s odůvodněním)
1. **Založ scénáře podle analýzy** (Invalid vstup, neexistující záznam, konflikt)  
   - *Proč:* Ověří chování při chybách.
2. **Mockuj závislosti** (NSubstitute)  
   - *Proč:* Deterministické výsledky.
3. **Generuj data** (AutoFixture) + **aserty** (AwesomeAssertions)  
   - *Proč:* Čitelné testy s minimem boilerplate.
4. **Spusť testy a zreportuj**  
   - *Proč:* Okamžitá zpětná vazba.

## Výstup
Vrať nové testy, diff a výsledky běhu; nefixuj produkční kód, pouze hlášení chyb.
