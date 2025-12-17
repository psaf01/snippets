
---
name: run-tests
description: "Spusť xUnit testy, zpracuj report a navrhni doplnění pokrytí."
argument-hint: "Zadej cestu k test projektu (např. 'tests/Invoicing.Tests')."
agent: "Tester"
tools: ["codebase", "findTestFiles", "terminal"]
---

# Úloha: Spuštění testů a report

## Kroky (s odůvodněním)
1. **Najdi a ověř test projekt**  
   - *Proč:* Správné cílení běhu.
2. **Spusť testy** (např. `dotnet test`) a získej výstup  
   - *Proč:* Ověření stavu po posledních změnách.
3. **Vyhodnoť neúspěšné testy** + doporuč doplnění pokrytí  
   - *Proč:* Iterativní zlepšování kvality.
4. **Checklist regresí**  
   - *Proč:* Předejde nechtěným dopadům.

## Výstup
Vrať souhrnný report (přehled pass/fail), seznam testů ke doplnění a návrhy na zlepšení.
