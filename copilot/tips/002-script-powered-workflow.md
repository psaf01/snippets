# Script-Powered Workflow: Naučte Copilota používat skripty

## Proč

Když pracuješ s GitHub Copilotem, opakovaně žádáš o stejné úkoly (backup, commit, analýza). Copilot vždy generuje nové příkazy, což spotřebovává tokeny a může vést k nestabilním výsledkům. Výsledek jednou vyzkoušený a otestovaný se ztrácí.

**Script-powered workflow** mění tento přístup: jednou vytvoříš skript pro opakovaný úkol, nauč Copilota ho používat. Skript funguje deterministicky, šetří tokeny a Copilot ho spouští místo opakovaného generování příkazů.

### Přínosy

**Determinismus a stabilita**  
Skript vždy udělá přesně to samé. Žádné drobné rozdíly v generovaných příkazech, žádné překvapení. Jednou otestovaný workflow funguje spolehlivě.

**Úspora tokenů a času**  
Jeden skript = tisíce ušetřených tokenů při opakovaném použití. Copilot nemusí vždy znovu generovat příkazy, jen najde skript a spustí ho.

**Živá dokumentace**  
Skript je zároveň dokumentace postupu. Koukneš do něj a okamžitě vidíš, jaké kroky úkol zahrnuje.

### Kdy použít skripty

Vytvoř skript, když:
- Úkol děláš opakovaně
- Workflow má klidně i jen 1 krok, ale chceš ho dělat právě tímto způsobem
- Potřebuješ stabilní, předvídatelný výsledek

Nech na Copilota generování, když jde o jednorázový nebo kreativní úkol vyžadující kontext z více zdrojů.

## Jak to nastavit

**Důležité:** Všechny následující kroky vytváří a spravuje Copilot, ne ty ručně. **Copilot vytvoří adresář, napíše skript, zdokumentuje ho v README, otestuje na reálných datech a případně opraví chyby.** Pro složitější skripty je vhodné nechat vygenerovat i testy. Tvoje role je pouze definovat úkol a Copilot se postará o implementaci, testování a údržbu. To je klíčová část script-powered workflow - automatizace nejen provádění úkolů, ale i správy samotných skriptů.

### 1. Struktura workspace

Vytvoř adresář `scripts/` v kořeni workspace s README dokumentací:

```
workspace/
└── scripts/
    ├── README.md          # Dokumentace všech skriptů
    ├── commit-all.ps1
    └── backup-workspace.ps1
```

### 2. Dokumentace skriptů

V `scripts/README.md` dokumentuj každý skript s účelem, použitím a funkcionalitou. Copilot pak najde správný skript pro daný úkol.

Příklad dokumentace:
```markdown
## `commit-all.ps1`
**Účel:** Rychlý commit všech změn

**Použití:**
```powershell
.\scripts\commit-all.ps1 -Message "Popis změn"
```

### 3. Nastavení Copilota

Přidej do custom instructions nebo [chatmode](https://wiki.kb.cz/pages/viewpage.action?pageId=1221091792) agenta pravidlo:

```markdown
## 🚨 SKRIPTY MAJÍ PRIORITU
- Před terminálovými příkazy zkontroluj `scripts/README.md`
- Pokud existuje skript pro úkol, použij ho
- Vytvoř nový skript, když činnost je deterministická a má více kroků
```

To zajistí, že Copilot nejprve hledá existující skripty, než začne generovat příkazy.

## Praktický příklad

Prompt: **"Potřebuji commitnout všechny změny"**

Copilot se script-powered workflow:
1. Zkontroluje `scripts/README.md`
2. Najde `commit-all.ps1` s dokumentací
3. Spustí: `.\scripts\commit-all.ps1 -Message "Update"`

