
---
name: generate-tests
description: "Vytvoř unit testy v xUnit s AwesomeAssertions, AutoFixture, NSubstitute (pozitivní scénáře)."
argument-hint: "Zadej cílovou třídu/metodu a test projekt (např. 'InvoiceService.CalculateTotal', 'tests/Invoicing.Tests')."
agent: "Tester"
tools: ["codebase", "search", "usages", "findTestFiles", "terminal"]
---

# Úloha: Generování testů pro ${classOrMethod}

## Kroky (s odůvodněním)
1. **Ověř test projekt** (xUnit, reference na knihovny)  
   - *Proč:* Zajišťuje správný běh testů.
2. **Vytvoř testy pozitivních scénářů** s **AutoFixture** pro vstupy  
   - *Proč:* Pokryje základní funkčnost.
3. **Použij mocking s NSubstitute** pro externí závislosti  
   - *Proč:* Izolace jednotky.
4. **Asserty přes AwesomeAssertions**  
   - *Proč:* Čitelné a srozumitelné kontroly.

## Výstup
Ukaž nové test soubory, diff a spusť testy s reportem výsledků.
