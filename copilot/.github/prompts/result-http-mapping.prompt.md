---
name: result-mapping
description: "Doplň/zkontroluj mapování Ardalis.Result na HTTP kódy v Minimal API."
argument-hint: "Zadej, které endpointy zkontrolovat (např. '/api/invoices/*')."
agent: "Vývojář"
tools: ["codebase", "search", "usages", "terminal"]
---

# Úloha: Mapování Ardalis.Result → HTTP

## Kroky (s odůvodněním)
1. **Vyhledej endpointy** vracející `Result<T>`  
   - *Proč:* Zaměříme se na relevantní místa.
2. **Zkontroluj a sjednoť mapování**  
   - *Proč:* Konzistence: `Success`→200/201, `NotFound`→404, `Invalid`→400/422, `Conflict`→409.
3. **Navrhni helper/metodu pro mapování** (pokud se opakuje)  
   - *Proč:* Eliminace duplikace a chyb.

## Výstup
Uveď navržené změny a jejich odůvodnění; poté aplikuj.
