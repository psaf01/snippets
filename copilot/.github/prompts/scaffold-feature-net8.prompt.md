
---
name: scaffold-feature
description: "Scaffold implementace feature v .NET 8 s použitím Ardalis.Result (inkrementálně)."
argument-hint: "Zadej feature, cílový namespace a složku (např. 'Invoicing', 'CoolPeople.Invoicing', 'src/Invoicing')."
agent: "Vývojář"
tools: ["codebase", "search", "usages", "terminal"]
---

# Úloha: Scaffold ${featureName} (.NET 8, Ardalis.Result)

## Zásady
- **Jeden krok v jeden čas**; po každém kroku uveď *odůvodnění* a *diff*.
- Nepiš testy (to je úloha Tester módu).

## Kroky (s odůvodněním)
1. **Navrhni strukturu složek a souborů** (API, Application, Domain)  
   - *Proč:* Umožní čisté oddělení odpovědností.
2. **DTOs + kontrakty podle analýzy**  
   - *Proč:* Stabilní rozhraní pro klienta i testy.
3. **Aplikační logika** vracející `Ardalis.Result<T>`  
   - *Proč:* Jednotné zacházení s úspěchem/chybami.
4. **Minimal API endpointy** + mapování `Result` → HTTP  
   - *Proč:* Konzistentní odpovědi.
5. **Lehká validace vstupů** (bez externí knihovny, pokud není v projektu)  
   - *Proč:* Ochrana před nekorektními daty.

## Výstup
Po každém kroku ukaž seznam změněných souborů + diff. Změny aplikuj až po návrhu.

