# AI Prompt Engineer: Příprava promptů pomocí AI

## Proč: Meta-Prompting

Cílem není říct AI, co má dělat. Cílem je říct AI, čeho chceš dosáhnout, a nechat ji, aby si sama navrhla, jak se jí to má zadat. Tomuto přístupu se říká **meta-prompting**. Místo abys se snažil ručně vytvořit dokonalý prompt, popíšeš cíl a necháš AI, aby si sama zkonstruovala optimální zadání.

Ruční psaní promptů je jako mluvit na experta cizím jazykem, který sotva umíš. Znáš cíl, ale nevíš, jak ho správně formulovat, aby ti AI co nejlépe rozuměla. Výsledkem jsou nepřesnosti, zdlouhavé vysvětlování a nekonzistentní výsledky.

**AI Prompt Engineer workflow** tento problém řeší. Pomocí custom příkazu `/create-prompt` (viz definice níže) přeneseš zodpovědnost za tvorbu promptu na samotného Copilota. Ty dodáš cíl, Copilot dodá strukturovaný, optimalizovaný a okamžitě použitelný prompt.

### Přínosy

**Copilot si navrhuje instrukce sám pro sebe**  
Kdo lépe ví, jak napsat instrukce pro Copilota, než samotný Copilot? Zná strukturu, která funguje, ví, jak formulovat kroky, aby je správně interpretoval, a jaké informace potřebuje v kontextu. Výsledný prompt je optimalizovaný pro strojové zpracování.

**Strukturovaný a srozumitelný prompt**  
Copilot používá pro strukturování promptů XML tagy (např. `<objective>`, `<context>`, `<success_criteria>`). To rozděluje komplexní úkoly do menších, srozumitelných částí a dramaticky zlepšuje pochopení zadání.

**Konzistence a předvídatelnost**  
Všechny prompty vytvořené tímto způsobem dodržují stejnou strukturu a konvence. To usnadňuje jejich údržbu, orientaci v nich a zajišťuje předvídatelné chování Copilota.

**Okamžitá použitelnost a automatizace**  
Prompt je vytvořen, otestován a připraven k použití během vteřin. Pokud existuje relevantní skript v `scripts/`, Copilot ho automaticky zahrne do workflow, čímž kombinuje flexibilitu Copilota s determinismem skriptů.

### Kdy použít tento přístup

Vytvoř nový prompt pomocí Copilota, když:
- Chceš zajistit konzistentní a vysoce kvalitní výstup.
- Máš komplexní úkol s více kroky.
- Chceš, aby Copilot kladl doplňující otázky, pokud je zadání nejasné.

## Jak to funguje

**Důležité:** Copilot vytváří prompt autonomně. Tvoje role je pouze popsat úkol a odpovídat na doplňující otázky. Copilot si sám navrhne optimální strukturu zadání, identifikuje potřebný kontext a definuje kroky k dosažení cíle.

### 1. Popiš úkol

V chatu stručně popiš, čeho chceš dosáhnout. Nemusíš vymýšlet detailní postup - to je práce pro Copilota.

```
> /create-prompt Potřebuji refaktorovat autentizační modul z custom OAuth implementace 
na Azure AD B2C. Systém má 3 microservices (API Gateway, User Service, Order Service) 
a frontend v React. Všechny komponenty musí zůstat funkční.
```

### 2. Copilot analyzuje a klade otázky

Copilot si uvědomí složitost úkolu a zeptá se na klíčové detaily:
- "Jaké frameworky používáš pro API (Spring Boot, .NET, Node.js)?"
- "Máš již Azure AD B2C tenant nakonfigurovaný?"
- "Potřebuješ zachovat existující uživatelská data, nebo začínáš čistou migrací?"
- "Používáš nějaký API gateway framework (Kong, APIGW, Ocelot)?"

### 3. Copilot sestaví strukturovaný prompt

Na základě odpovědí Copilot vytvoří komplexní prompt s XML strukturou:

```markdown
<objective>
Refaktorovat autentizační systém ze samostatné OAuth implementace na Azure AD B2C 
napříč microservice architekturou (API Gateway + 2 backend services + React frontend) 
při zachování funkčnosti všech komponent.
</objective>

<context>
- Architektura: 3 microservices (.NET Core) + React SPA
- API Gateway: Ocelot
- Současný stav: Custom OAuth2 server s JWT tokeny
- Cílový stav: Azure AD B2C s MSAL.js a Microsoft.Identity.Web
- Azure AD B2C tenant: production-b2c.onmicrosoft.com (již nakonfigurován)
- Databáze uživatelů: PostgreSQL (migrace dat nutná)
</context>

<requirements>
1. **Analyzuj současný stav**
   - Zmapuj všechny endpointy používající autentizaci
   - Identifikuj závislosti na custom OAuth tokenech
   - Zdokumentuj user flow a permissions

2. **Navrhni migrační strategii**
   - Blue-green deployment pro postupný přechod
   - Mapování custom user claims na B2C custom policies
   - Backward compatibility během migrace

3. **Implementuj změny**
   - Frontend: MSAL.js integrace + token refresh handling
   - API Gateway: Ocelot downstream authentication + B2C JWT validace
   - Backend services: Microsoft.Identity.Web middleware
   - Migrace uživatelů: skript pro přesun dat do B2C

4. **Testování**
   - Unit testy pro auth middleware
   - Integration testy pro každou službu
   - E2E testy user flows (login, refresh, logout)

5. **Dokumentace**
   - Architektonické změny
   - Deployment guide
   - Rollback plán
</requirements>

<success_criteria>
- Všechny microservices validují tokeny z Azure AD B2C
- Uživatelé se mohou přihlásit přes B2C bez ztráty přístupu
- Existující user sessions jsou migrovány nebo gracefully ukončeny
- Dokumentace pokrývá celý proces včetně rollback scénáře
- Všechny testy (unit, integration, E2E) procházejí
</success_criteria>
```

### 4. Použij prompt v čistém kontextu

Pro složité úkoly jako je tento je vhodné otevřít nový chat bez předchozí historie. V novém chatu připoj vygenerovaný prompt jako soubor a požádej Copilota o sestavení detailního implementačního plánu. Copilot na základě strukturovaného promptu vytvoří krok-za-krokem plán, který uloží do samostatného souboru (např. `PLAN.md`).

Tento přístup odděluje **přípravu zadání** (meta-prompting) od **samotné implementace** (exekuce podle plánu). Více o tomto workflow doplním v některém z následujících tipů.
