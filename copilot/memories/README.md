# Memory Bank

Databáze naučených znalostí, pravidel a workflow pro projekt.

## Struktura

### `workflows/`
Naučené procesy a best practices, které se dají replikovat v jiných projektech.
- Jak pracujeme
- Opakované postupy
- Osvědčené přístupy

### `constraints/`
Pravidla, omezení a co NEDĚLAT.
- Dokumentační standardy
- Projektová pravidla
- Omezení a důvody

### `tools/`
Dostupné nástroje a skripty, které máme k dispozici.
- PowerShell skripty
- Custom prompty
- Jak je používat

### `metadata/`
Kontext a meta-informace o projektu.
- Technologický stack
- Architektura
- Přehled projektu

## Principy

✅ **Ukládej:**
- Meta-znalosti (vzory, principy)
- Obecně použitelné postupy
- Pravidla a konvence
- Odkazy na detaily

❌ **Neukládej:**
- Konkrétní detaily projektu
- Implementační specifika
- Logy a statistiky
- Duplicitní informace

## Aktualizace

Po skončení session, pokud ses něco naučil:
```
/updateMemory
```

Periodicky proveď čištění:
```
/pruneMemory
```
