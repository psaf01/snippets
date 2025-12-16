# Context Management: Čistý start s relevantním kontextem

## Co je kontext

**Kontext** je veškerá informace, kterou má Copilot k dispozici při generování odpovědí a rozhodování o následující akci: historie konverzace v chatu, aktuálně otevřené soubory, označený kód a připojené soubory. Copilot využívá tento kontext k pochopení, na čem pracuješ a co potřebuješ. Čím relevantnější kontext, tím přesnější a užitečnější odpovědi dostaneš. Naopak přeplněný nebo irelevantní kontext vede k odpovědím, které neodpovídají aktuálnímu úkolu.

## Proč spravovat kontext

Když pracuješ s Copilotem na různých úkolech během dne, kontext chatu postupně narůstá. Diskutoval jsi o feature A, pak jsi řešil bug B, pak se díval na dokumentaci C. Když teď otevřeš soubor v projektu D a chceš začít nový úkol, Copilot má v hlavě všechny předchozí konverzace, které jsou pro aktuální úkol irelevantní.

**Context management** znamená vědomě řídit, co má Copilot v kontextu. Když začínáš nový nesouvisející úkol, vytvoř nový chat s čistým kontextem. Pak jediným příkazem `/init` (definice viz níže) naplň kontext relevantnými informacemi o projektu, ve kterém pracuješ. Copilot začne s čistým štítem a zaměří se pouze na aktuální projekt bez balasu z předchozích konverzací.

### Efektivní naplnění kontextu jediným příkazem

Místo postupného vysvětlování, co projekt dělá, jaké technologie používá a jak je strukturovaný, použiješ `/init`. Copilot systematicky projde README soubory od aktuálního souboru směrem nahoru, vytěží klíčové informace a vrátí ti strukturovaný přehled. Během 10 sekund máš v kontextu vše potřebné.

### Ochrana před context overload

Init prompt se automaticky zastaví na úrovni umbrella workspace a neprochází tak desítky nesouvisejících projektů. Zaměří se pouze na aktuální projekt a jeho bezprostřední okolí. Tím šetří tokeny a udržuje kontext relevantní.

### Kdy začít nový chat s /init

Začni nový chat a použij `/init`, když:
- Přepínáš na nesouvisející úkol v jiném projektu
- Kontext aktuálního chatu je dlouhý a nepřehledný
- Otevíráš projekt poprvé nebo se k němu vracíš po delší době
- Chceš se zaměřit na konkrétní část workspace bez balasu z předchozích diskuzí

## Jak spravovat kontext

### 1. Rozpoznej potřebu čistého kontextu

Všimni si, kdy je vhodné začít nový chat:
- Přepínáš z projektu A na projekt B
- Chat je dlouhý (více než 20 zpráv) a začíná být nepřehledný
- Copilot odpovídá s informacemi z předchozího úkolu
- Chceš se zaměřit na konkrétní soubor a jeho okolí

### 2. Vytvoř nový chat

V GitHub Copilot rozhraní klikni na "New Chat". Tím získáš prázdný kontext bez historie předchozích diskuzí.

### 3. Otevři relevantní soubor

Přejdi do souboru v projektu, na kterém chceš pracovat. Init prompt začne analýzu od adresáře tohoto souboru a postupuje směrem nahoru k rodičovským složkám.

### 4. Spusť /init pro naplnění kontextu

V novém chatu napiš `/init` a potvrď. Copilot automaticky:
- Určí výchozí složku z aktuálně otevřeného souboru
- Přečte README.md v aktuálním adresáři a rodičovských složkách
- Vytěží informace z manifestů (package.json, pom.xml, atd.)
- Zastaví se na úrovni umbrella workspace
- Vrátí strukturovaný přehled projektu

### 5. Pracuj s relevantním kontextem

Copilot teď má v kontextu přesně to, co potřebuješ: přehled projektu, technologie, struktura a build příkazy. Můžeš rovnou začít pracovat na úkolu bez dalšího vysvětlování.
