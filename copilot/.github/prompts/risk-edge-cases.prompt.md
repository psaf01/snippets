
---
name: edge-cases
description: "Identifikuj rizika a edge případy pro plánovanou funkci."
argument-hint: "Zadej feature a klíčové datové toky (např. 'Import objednávek, dávkové zpracování')."
agent: "Analytik"
tools: ["codebase", "search", "usages"]
---

# Úloha: Rizika & Edge cases pro ${featureName}

## Postup (s odůvodněním)
1. **Seznam vstupních variací** (null/empty/duplicitní/velké)  
   - *Proč:* Odhalí křehká místa logiky.
2. **Sekvenční a konkurenční scénáře**  
   - *Proč:* Ochrana proti race conditions a deadlockům.
3. **Limitní podmínky výkonu a paměti**  
   - *Proč:* Plán pro škálování a SLA.
4. **Bezpečnostní hrozby** (vstřiky, autorizace, logging citlivých dat)  
   - *Proč:* Minimalizace rizik v produkci.
5. **Doporučení pro testy** (pozitivní/negativní/edge)  
   - *Proč:* Vstup pro Tester mód.

## Výstup
Vrať `risks_${featureName}.md` jako Markdown. Bez úprav kódu.
