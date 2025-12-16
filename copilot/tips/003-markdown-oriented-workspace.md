# Markdown-Oriented Workspace: README first přístup

## Proč README-first organizace workspace

Když vstupuješ do nového adresáře nebo projektu, místo procházení jednotlivých souborů můžeš získat kompletní přehled čtením README.md. Stejně to funguje i pro AI agenty – README slouží jako rychlá orientační mapa, která eliminuje potřebu zkoumání obsahu všech souborů.

**README-first přístup** znamená, že každý adresář obsahuje aktuální dokumentaci účelu, struktury a obsahu. Agent se orientuje čtením README souborů a pouze v případě potřeby konkrétních detailů sahá k jednotlivým souborům. Výsledek je efektivnější navigace, rychlejší pochopení kontextu a menší spotřeba tokenů.

### Orientace ve workspace bez ztráty kontextu

**Rychlá orientace**  
Jeden README.md ti řekne více než procházení desítek souborů. Agent okamžitě pochopí účel adresáře, klíčové soubory a logiku organizace.

**Efektivní token management**  
Místo čtení mnoha souborů stačí načíst README. Agent získá přehled bez plýtvání tokeny na obsah, který možná nepotřebuje.

**Konzistentní dokumentace**  
Každý adresář má jasnou dokumentaci svého účelu a obsahu. Žádné hádání, co se v složce nachází nebo jak je organizovaná.

**Snadná publikace na Confluence**  
Markdown soubory lze okamžitě publikovat na Confluence pomocí "markdown" makra. Zkopíruješ zdrojový obsah, vložíš do makra a máš hotovou zformátovanou wiki stránku. Tahle stránka vznikla právě tak.

## Jak nastavit README-first workspace

**Důležité:** Tyto kroky může provádět Knowledge Base Agent automaticky. Pokud máš nastavený agent pro správu znalostní báze, stačí mu zadat úkol a on vytvoří, aktualizuje a udržuje README soubory podle potřeby.

### 1. Povinné README v každém adresáři

Každý adresář obsahuje `README.md` s jasnou strukturou:

```markdown
# Název adresáře

Stručný popis účelu adresáře (1-2 věty).

## Obsah

### Kategorie 1
- `soubor1.md` - Popis obsahu souboru
- `soubor2.md` - Popis obsahu souboru

### Kategorie 2  
- `podadresar/` - Popis podsložky

## Klíčové informace

- Hlavní myšlenky nebo závěry z adresáře
- Odkazy na související dokumenty
- Speciální pokyny pro práci s obsahem
```

### 2. Hierarchická dokumentace

README soubory tvoří hierarchii od obecného k specifickému:

```
projekt/
├── README.md              # Přehled celého projektu
├── analyza/
│   ├── README.md          # Přehled analytických dokumentů
│   ├── data-model.md
│   └── findings.md
└── implementace/
    ├── README.md          # Přehled implementačních souborů
    └── architektura.md
```

### 3. Automatická aktualizace dokumentace

Nastav Knowledge Base Agent, aby:
- Automaticky vytvářel README při vzniku nového adresáře
- Aktualizoval README při přidání nových souborů
- Udržoval konzistentní strukturu dokumentace
- Eliminoval zastaralé informace
