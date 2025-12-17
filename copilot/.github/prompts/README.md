## Dokumetace na MS VSC
[Use prompt files in VS Code](https://code.visualstudio.com/docs/copilot/customization/prompt-files)
[GitHub Copilot DevOps Excellence: Prompt Files vs Instructions vs Chat Modes](https://azurewithaj.com/posts/github-copilot-prompt-instructions-chatmodes/)

K čemu slouží:
Prompt files jsou samostatné úlohové (task‑specific) prompt šablony, které můžeš v chatu spouštět přes / jako opakovatelné akce.
Používají se pro konkrétní úkoly typu:

generování kódu
code review
scaffolding
testování
DevOps úkoly

Každý soubor je .prompt.md a funguje jako jednorázový návod – tedy „co má Copilot udělat“.
Nepřepínají režim chatu, pouze se jednou spustí.
📌 Charakteristiky prompt files:

Ukládají se do `.github/prompts` v rámci workspace.
Obsahují YAML hlavičku s popisem a parametry.
Spouští se na vyžádání (nejsou stálé).
Definují instrukce pro konkrétní úkol.


| Oblast | `.github/prompts` | `.github/chatmodes` |
|--------|---------------------|----------------------|
| Typ souboru | `.prompt.md` | `.chatmode.md` |
| Spouštění | jednorázově přes `/` | trvalé přepnutí režimu |
| Účel | definice konkrétního úkolu | definice osobnosti / role / chování |
| Ovlivnění chatu | pouze při spuštění | po celou dobu aktivního režimu |
| Obsah | „Co má Copilot udělat“ | „Jak se má Copilot chovat“ |
| Příklad | „Ověř mi bezpečnost CI pipeline“ | „Security Analyst Mode“ |

