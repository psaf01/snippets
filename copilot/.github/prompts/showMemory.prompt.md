---
description: 'Zobrazit obsah Memory Bank – přehled o tom, co si pamatuješ z projektu'
---

# /showMemory – Přehled Memory Bank

Stručně vypíš obsah `memories/` adresáře, aby bylo jasné, jaké znalosti a pravidla máme uložené v paměti projektu.

## Volitelný vstup
- `focus = ${input:focus:Zaměř se na konkrétní část (workflows, constraints, tools, metadata) – nech prázdné pro kompletní přehled}`

## Postup
1. **Urči fokus**:
   - Pokud `focus` není zadáno → vypíš přehled všech kategorií
   - Pokud `focus` je `workflows` → vypíš obsah `memories/workflows/`
   - Pokud `focus` je `constraints` → vypíš obsah `memories/constraints/`
   - Pokud `focus` je `tools` → vypíš obsah `memories/tools/`
   - Pokud `focus` je `metadata` → vypíš obsah `memories/metadata/`

2. **Čtení a sumarizace**:
   - Projdi relevantní soubory z `/memories/{kategorie}/`
   - Pro každý soubor extrahuj **hlavní myšlenky** (max 3-4 klíčové body)
   - Nepiš celý obsah, jen krátké shrnutí

3. **Výstup (stručně)**:
   - **Pro každou kategorii/soubor**: název a 1-2 věty co obsahuje
   - Uvádění: `📁 workflows/` → seznam souborů a jejich účel
   - Pokud `focus` je specifický → detailnější výpis pro tu kategorii
   - Odkaz na soubory v backticks (cesty relativní k workspace)

## Příklady
```
/showMemory
→ Zobrazí: Memory Bank přehled (workflows, constraints, tools, metadata)

/showMemory focus:workflows
→ Zobrazí: Detaily o learned workflows

/showMemory focus:constraints
→ Zobrazí: Pravidla a omezení projektu
```

## Zásady
- **Stručnost** – jde o přehled, ne detaily
- **Čitelnost** – používej emoji a strukturu
- **Aktuálnost** – pokud soubor neexistuje, oznám to
