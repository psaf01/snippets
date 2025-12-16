---
description: Vytvoření nového úkolu se zásadou obohacení kontextu
argument-hint: "<popis úkolu>"
---

<objective>
Přidá nový úkol do souboru TODO.md (výchozí umístění: kořen workspace, lze nakonfigurovat v package.json) s inteligentním obohacením kontextu.

🚨 **CRITICAL: TVOJE JEDINÁ ROLE JE ZAPSAT ÚKOL DO TODO.MD - NIC VÍC!**
- ❌ NIKDY nezačínej plnit úkol
- ❌ NIKDY nevytvářej soubory související s úkolem
- ❌ NIKDY nespouštěj příkazy související s úkolem
- ✅ POUZE přidej úkol do TODO.md s obohaceným kontextem
- ✅ POUZE potvrď uživateli, že úkol byl zapsán
</objective>

<context>
Popis úkolu: $ARGUMENTS

Seznam TODO je uložen v souboru TODO.md. Umístění souboru:
- Výchozí: TODO.md v kořenu workspace
- Vlastní: Nakonfiguruj cestu v package.json klíčem `todo.filePath`
Systém automaticky načítá konfiguraci a používá automatické číslování s jedinečnými ID.
</context>

<process>

<step_1_enrich_description>
Analyzuj provided popis úkolu a obohať jej o relevantní kontext:

1. **Ověř kontext projektu:**
   - Pokud úkol zmiňuje soubory, zkontroluj, zda existují a zaznamenej jejich umístění
   - Pokud úkol zmiňuje funkce, zkontroluj, zda existují podobné funkce
   - Pokud úkol zmiňuje chyby, zkontroluj, zda existuje související kód

2. **Udělej popis bohatý na informace:**
   - Přidej cesty k souborům, pokud jsou konkrétní soubory zmíněny
   - Přidej čísla řádků, pokud jsou relevantní konkrétní místa v kódu
   - Přidej kontext o závislostech nebo souvisejících úkolech
   - Udržuj popis kompaktní, ale informativní

3. **Příklady obohacení:**
   - Vstup: "Oprav chybu autentizace"
   - Obohaceno: "Oprav chybu autentizace v src/auth.py:156 (logika OAuth přesměrování)"

   - Vstup: "Přidej testy"
   - Obohaceno: "Přidej testy pro TODO příkazy (test/test_todo.py)"

   - Vstup: "Aktualizuj README"
   - Obohaceno: "Aktualizuj README.md o dokumentaci TODO příkazů"

**DŮLEŽITÉ:** Udržuj obohacení jemné a kompaktní. Nepředelávej. Cílem je přidat právě tolik kontextu, aby byl úkol jasný a proveditelný.
</step_1_enrich_description>

<step_2_add_todo>
Přidej nový úkol do TODO.md:

**Struktura úkolu:**
Každý úkol MUSÍ být ve formátu:
```
## [ ] #ID Název úkolu

Popis úkolu...
```

Kde ID je automaticky přiřazené číslo (1, 2, 3, ...). Formát `[ ]` slouží jako checkbox pro označení dokončení úkolu.

**Postup:**
1. Načti soubor TODO.md (cesta v package.json `todo.filePath`)
2. Určí poslední ID v souboru
3. Přidej nový úkol s číslem (ID + 1)
4. Ulož změny do TODO.md
</step_2_add_todo>

<step_3_report_result>
Oznám výsledek uživateli:

**Při úspěchu:**
- Potvrď, že byl úkol přidán s jeho číslem
- Zobraz obohacený popis
- Volitelně zobraz náhled aktuálního seznamu úkolů

**Při selhání:**
- Zobraz chybu ze skriptu
- Poskytni užitečné návrhy

</step_3_report_result>

</process>

<execution_notes>
🚨 **ABSOLUTNÍ ZÁKAZ PROVÁDĚNÍ ÚKOLU:**
- Tvoje role končí přidáním úkolu do TODO.md
- Po zápisu úkolu OKAMŽITĚ skonči - nic dalšího nedělej
- NIKDY nespouštěj příkazy, nevytvářej soubory, nezačínej implementaci
- Uživatel bude úkol řešit později - ne teď, ne ty

**Technické požadavky:**
1. Vždy obohať popis kontextem projektu, pokud je dostupný
2. Používej grep/read nástroje pro sběr kontextu zmíněných souborů nebo funkcí
3. Udržuj obohacení kompaktní a zaměřené
4. Zajistí, aby skript byl zavolán se správně zmapovanými argumenty
5. Skript automaticky zpracovává číslování a jedinečnost
6. **POVINNÝ FORMÁT:** Každý úkol musí začínat s `## [ ] #ID` kde ID je číslo (např. `## [ ] #1 Název úkolu`)
7. Při přidávání nového úkolu zkontroluj poslední ID v souboru a použij následující číslo
8. Checkbox `[ ]` se změní na `[x]` když je úkol dokončen
</execution_notes>

<success_criteria>
- Úkol byl úspěšně přidán do TODO.md
- Popis je obohacen relevantním kontextem projektu
- Uživatel obdrží potvrzení s číslem úkolu
</success_criteria>
