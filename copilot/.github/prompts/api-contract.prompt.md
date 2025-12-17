
---
name: api-contract
description: "Vytvoř detailní API kontrakt (endpointy, DTOs, chybové stavy) dle analýzy."
argument-hint: "Zadej feature a prefix API (např. 'Reporting', '/api/reports')."
agent: "Analytik"
tools: ["codebase", "search", "usages"]
---

# Úloha: API kontrakt pro ${featureName}

## Cíl
Připrav **Markdown** specifikaci API: endpointy, metody, request/response DTOs, kódy chyb, hlavičky.

## Postup (s odůvodněním)
1. **Katalog endpointů** s krátkým popisem  
   - *Proč:* Umožní rychlý přehled pro implementaci a testy.
2. **Request/response DTOs** (typy, povinná pole, validace)  
   - *Proč:* Jednoznačný kontrakt mezi klientem a serverem.
3. **Mapování výsledků (Ardalis.Result)** → HTTP statusy  
   - *Proč:* Konzistence napříč API.
4. **Chybové kódy & payload** (Invalid, NotFound, Conflict)  
   - *Proč:* Umožní přesné testování a monitoring.
5. **Edge cases** (prázdná data, velké objemy, časové limity)  
   - *Proč:* Předchází chybám v produkci.

## Výstup
Vrať `api_contract_${featureName}.md`. Needituj kód; pouze dokumentuj.
