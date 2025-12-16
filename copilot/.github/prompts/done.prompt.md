---
description: Označit úkol jako dokončený - s číslem, nebo automaticky z kontextu, nebo vybrat ze seznamu
argument-hint: "[číslo]"
---

<objective>
Označit konkrétní úkol jako dokončený v souboru TODO.md (výchozí umístění: kořen workspace, lze nakonfigurovat v package.json) s inteligentní detekcí kontextu nebo zobrazit seznam všech dokončitelných (nedokončených) úkolů.
</objective>

<context>
Poskytnutý argument: $ARGUMENTS

- Pokud je poskytnuto číslo: Označ tento úkol jako dokončený
- Pokud není poskytnuto číslo: Detekuj z kontextu, na kterém úkolu jsme pracovali, a označ ho jako dokončený
</context>

<process>

<step_1_context_detection>
**Pokud NENÍ poskytnuto číslo:**

1. **Analyzuj aktuální kontext konverzace:**
   - Jaký úkol byl naposledy diskutován nebo implementován?
   - Jaké soubory byly upraveny v rámci poslední práce?
   - Jaké klíčové termíny se objevily v poslední práci?

2. **Načti TODO.md a porovnej:**
   - Projdi všechny nedokončené úkoly (formát `## [ ] #ID Název`)
   - Porovnej popis a název úkolů s aktuálním kontextem
   - Hledej shodu v klíčových slovech, souborech, nebo tématu

3. **Rozhodnutí:**
   - **JEDNOZNAČNÁ SHODA:** Pokud je jasně identifikovatelný jeden úkol → pokračuj na step_2 s tímto číslem
   - **ŽÁDNÁ nebo NEJEDNOZNAČNÁ SHODA:** Pokračuj na step_3 - zobraz seznam úkolů

**Pokud JE poskytnuto číslo:**
- Pokračuj přímo na step_2 s poskytnutým číslem
</step_1_context_detection>

<step_2_mark_done>
Označ úkol jako dokončený:

**Načti TODO.md:**
- Najdi úkol s formátem `## [ ] #ID`
- Zkontroluj, že úkol existuje a není již dokončen

**Proveď změnu:**
- Změň `## [ ] #ID` na `## [x] #ID`
- Ulož změny do TODO.md

**Formát úkolů:**
- Nedokončený: `## [ ] #ID Název úkolu`
- Dokončený: `## [x] #ID Název úkolu`
</step_2_mark_done>

<step_3_list_tasks>
**Pouze pokud není číslo poskytnuto A kontext není jednoznačný:**
<execution_notes>
1. **Priorita detekce kontextu:** Vždy se pokus identifikovat úkol z kontextu, pokud číslo není poskytnuto
2. **Formát úkolů:** `## [ ] #ID Název úkolu` (nedokončené) nebo `## [x] #ID Název úkolu` (dokončené)
3. Dokončené úkoly zůstávají v souboru, ale jsou označeny s `[x]` místo `[ ]`
4. **Kontext zahrnuje:** nedávné změny souborů, diskutovaná témata, implementované funkce
5. Seznam úkolů zobraz POUZE pokud není číslo poskytnuto A kontext není jednoznačný
6. Při detekci z kontextu informuj uživatele, který úkol byl identifikován a proč
</execution_notes>

<success_criteria>
- Pokud je číslo poskytnuto: Úkol je označen jako dokončený v TODO.md
- Pokud není číslo a kontext je jednoznačný: Správný úkol je automaticky označen jako dokončený
- Pokud není číslo a kontext není jednoznačný: Je zobrazen seznam dokončitelných úkolů
- Uživatel obdrží jasné potvrzení nebo chybovou zprávu
</success_criteria>
**Při úspěchu (úkol označen):**
- Potvrď, který úkol byl označen jako dokončený
- Zobraz číslo a název úkolu
- Pokud byl úkol detekován z kontextu, zmíň to
- Volitelně zobraz aktualizovaný seznam úkolů

**Při výpisu úkolů:**
- Zobraz seznam dokončitelných úkolů s čísly
- Vysvětli, že kontext nebyl jednoznačný
- Vyzvej k použití `/done <číslo>` pro výběr

**Při selhání:**
- Zobraz chybovou zprávu
- Poskytni užitečné návrhy
</step_4_report_result>

</process>

<execution_notes>
1. Ověř, že $ARGUMENTS je buď prázdný nebo platné kladné číslo
2. Skript zpracovává veškeré ověření a kontrolu chyb
3. Dokončené úkoly zůstávají v souboru, ale jsou označeny s [x]
</execution_notes>

<success_criteria>
- Pokud je číslo poskytnuto: Úkol je označen jako dokončený v TODO.md
- Pokud není číslo: Je zobrazen seznam dokončitelných úkolů
- Uživatel obdrží jasné potvrzení nebo chybovou zprávu
</success_criteria>
