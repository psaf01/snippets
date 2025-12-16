# Analysis Standard

Standardy a šablony pro tvorbu analytických diagramů a dokumentace.

## Pokryté oblasti

### Sekvenční diagramy
Modelování business procesů, customer journey a integračních scénářů.
- Detaily v: `standard-modelovani-cjs-byznysprocesy.md`
- Šablony v: `diagram-sequence-template.puml`

### Component diagramy
Modelování architektur, závislostí a komunikačních kanálů.
- Detaily v: `component-diagram-rules.md`
- Šablony v: `diagram-component-template.puml`

## Barevné schéma

### Pro sekvenční diagramy
- `#d5e8d4` (zelená) - Komponenty v gesci squadu
- `#fff2cc` (žlutá) - Komponenty mimo gesci squadu
- `#MistyRose` - Změny (background)
- `#MediumVioletRed` - Změny (spojnice)

### Pro component diagramy
- `#d5e8d4` (zelená) - Standardní komponenty squadu
- `#fff4d6` (žlutá) - Externí systémy
- `#dae8fc` (modrá) - Frontend komponenty
- `#MistyRose` - Měněné/přidávané komponenty
- `White` - Databáze
- `WhiteSmoke` - Message queues (Kafka, JMS)

## Referenční soubory

Každý diagram by měl odkazovat na:
- API katalog u participantů
- Funkční specifikaci
- Data model, pokud je relevantní
