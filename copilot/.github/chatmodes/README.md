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

Pozn.: Chat mód má read‑only charakter a používá pouze kontext z workspace a vyhledávání; přesně takto se doporučuje konfigurovat „plánovací/analytické“ persony. [1](https://code.visualstudio.com/docs/copilot/customization/custom-agents)  
Umístění a formát `.chatmode.md` v `.github/chatmodes/` viz příklady a postupy. [3](https://harrybin.de/posts/github-copilot-custom-chat-modes/)[4](https://4sysops.com/archives/new-github-copilot-features-in-vs-code-custom-chat-modes-chat-tool-sets-undoing-edits-and-simple-browser/)

Chat módy umožňují přepnout personu tak, aby v daném módu byly povoleny jiné nástroje (např. terminál/editační schopnosti) a jiné instrukce — proto zde povolujeme editaci a sekvenční práci. [1](https://code.visualstudio.com/docs/copilot/customization/custom-agents)[3](https://harrybin.de/posts/github-copilot-custom-chat-modes/)

Příklad testovacího módu s nástroji jako `findTestFiles`, `codebase`, `terminal` najdeš v návodech ke custom chat modes — slouží to k cílené práci s testy a kódem. [3](https://harrybin.de/posts/github-copilot-custom-chat-modes/)


| Oblast | `.github/prompts` | `.github/chatmodes` |
|--------|---------------------|----------------------|
| Typ souboru | `.prompt.md` | `.chatmode.md` |
| Spouštění | jednorázově přes `/` | trvalé přepnutí režimu |
| Účel | definice konkrétního úkolu | definice osobnosti / role / chování |
| Ovlivnění chatu | pouze při spuštění | po celou dobu aktivního režimu |
| Obsah | „Co má Copilot udělat“ | „Jak se má Copilot chovat“ |
| Příklad | „Ověř mi bezpečnost CI pipeline“ | „Security Analyst Mode“ |

