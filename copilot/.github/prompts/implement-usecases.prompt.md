
---
name: implement-usecases
description: "Implementuj jednotlivé use-cases v malých inkrementech (Command/Query), s Result<T>."
argument-hint: "Zadej název use-case a cílovou třídu/handler (např. 'CreateInvoice', 'CreateInvoiceHandler')."
agent: "Vývojář"
tools: ["codebase", "search", "usages", "terminal"]
---

# Úloha: Implementace use-case ${useCaseName}

## Kroky (s odůvodněním)
1. **Specifikace vstupů/výstupů** dle analýzy  
   - *Proč:* Vyhne se změnám kontraktu později.
2. **Handler/Service** s návratovým typem `Result<T>`  
   - *Proč:* Umožní jednotné mapování na HTTP a lepší testování.
3. **Chybové stavy** (`Invalid`, `NotFound`, `Conflict`)  
   - *Proč:* Kompletní pokrytí doménových situací.
4. **Napojení na API** (endpoint/route)  
   - *Proč:* Zpřístupní funkcionalitu spotřebitelům.

## Výstup
Ukaž diff a krátké odůvodnění každé změny; teprve poté změnu aplikuj.
