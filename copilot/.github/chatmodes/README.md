# Chat modes ve VSC
[GitHub Copilot Custom Chat Modes](https://harrybin.de/posts/github-copilot-custom-chat-modes/)
[Modes of Chatting with GitHub Copilot](https://www.codemag.com/Blog/AIPractitioner/GHCPCM)

Poznámka: V novějších verzích VS Code (od 1.106) byly custom chat modes přejmenovány na custom agents a používají soubory `.agent.md` v `.github/agents/`. Pokud jedeš na této verzi, stačí přejmenovat příponu a přesunout do `.github/agents/` — jinak obsah zůstává stejný.

K čemu slouží:
Custom chat modes definují trvalý režim osobnosti/role, který si můžeš v chatu aktivně přepnout.
Jde o .chatmode.md soubory, které vytvářejí vlastní „módy“ Copilota — tedy „jak se má Copilot chovat“.
Příklady použití:

„Security Scout“ – hledání zranitelností
„Testing Mode“ – zaměření na testy
„Code Review Mode“ – persistentní code reviewer
„Architect Mode“ – návrhové vzory, architektura

📌 Charakteristiky custom chat modes:

Ukládají se do .github/chatmodes.
Definují chování, tón, nástroje a povolené operace.
Aktivují se přepnutím režimu v Copilot UI.
Umožňují vytvořit více „osobností“ pro různé workflow.
Ovlivňují, jak Copilot reaguje v celém chatu, dokud režim nezměníš.


| Oblast | `.github/prompts` | `.github/chatmodes` |
|--------|---------------------|----------------------|
| Typ souboru | `.prompt.md` | `.chatmode.md` |
| Spouštění | jednorázově přes `/` | trvalé přepnutí režimu |
| Účel | definice konkrétního úkolu | definice osobnosti / role / chování |
| Ovlivnění chatu | pouze při spuštění | po celou dobu aktivního režimu |
| Obsah | „Co má Copilot udělat“ | „Jak se má Copilot chovat“ |
| Příklad | „Ověř mi bezpečnost CI pipeline“ | „Security Analyst Mode“ |

