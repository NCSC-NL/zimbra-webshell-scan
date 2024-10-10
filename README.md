# Zimbra webshell scan
## Author: NCSC-NL CTI & IROn

### Disclaimer
**English:** This script is provided without any guarantees regarding its effectiveness. Always ensure your system is up-to-date and adhere to security recommendations provided by the software provider. The detection capabilities of this script are based on a limited set of product versions. Make sure no sensitive information is disclosed when sharing the output of this script.

**Nederlands:** Dit script wordt aangeboden zonder enige garantie betreffende de effectiviteit ervan. Zorg dat uw systeem altijd up-to-date is en volg de beveiligingsaanbevelingen van de software provider. De detectiemogelijkheden van dit script zijn gebaseerd op een beperkte set product versies. Zorg ervoor dat er geen gevoelige informatie wordt vrijgegeven bij het delen van de uitvoer van dit script.

---
### GB Instructions

**Description**
This repository contains a script to scan for Zimbra webshell [CVE-2024-45519](https://nvd.nist.gov/vuln/detail/CVE-2024-45519) on your system. The script looks for files that should not be in the default public folders of Zimbra's websever application. This happens with a ```find``` command and with ```grep -v``` the default folders are excluded. The webshell can be found in a file, that is not in the default folder path. It is possible that this malicious file has the same timestamp or name as other legit files, which is why we search for full folder paths, instead of just names. 

This script is based on clean set-ups of Zimbra version 8.8.15_GA, 9.0.0_GA en 10.1.0_GA.

#### Prerequisites
- A Linux system running Zimbra version 8.8.15 or 9.0.0 or 10.1.0
- Root access is preferable

#### Usage
1. **Download the script:**
- Visit the GitHub Repository at `https://github.com/NCSC-NL/zimbra-webshell-scan`
- Download the script as is and save it on the system that is running Zimbra.

2. **Prepare the script:** 
- Make the script executable by using the following command: ```~: chmod +x find_zimbra_webshell.sh```

3. **Run the script**
- Run the script by using the following command, in the path location you saved it: ```~: ./find_zimbra_webshell.sh```

#### Reading the results
- The script will only return an output if it has found mismatch(es) between the default folders/files vs. on your system. If the script is finished running and there are no folder paths displayed, no mismatch was found.
- In the event of discovering unknown files, it might indicate that there is a webshell active on your system. To verify this, you could search these files to find specific keywords, such as:
	* "JCMD"
	* "JACTION"

The webshell is known to use these cookies, containing base64-encoded commands that can be executed.

#### Troubleshooting
If the script does not run, it may indicate that the script is not compatible with your Zimbra version. 

Optionally, you can perform a manual analysis in the public folders. 
Look in the public folders for files you do not recognize or aren't in the default configuration of Zimbra.

#### What if files are found by using the script?
1. **Verification:**
Double check if the files are truly unknown to you. 
2. **Containment:**
In case you do not recognize them or aren't sure, and they contain elements of the webshell, we advise making a snapshot or copy with memory of the system and isolating it. Do not turn off the system nor remove files yourself.
3. **Contact:**
If you are a constituant of NCSC-NL, please reach out to us directly. For other cases, we advise to reach out to your national, sectoral or commercial CERT.

#### Additional information
For more detailed information about the webshell, we kindly refer you to:
[Bleeping Computer](https://www.bleepingcomputer.com/news/security/critical-zimbra-rce-flaw-exploited-to-backdoor-servers-using-emails/)

---

### NL Instructies

**Beschrijving**
Deze repository bevat een script die gebruikt kan worden om te scannen op Zimbra een webshell [CVE-2024-45519](https://nvd.nist.gov/vuln/detail/CVE-2024-45519) op een systeem. Het script zoekt naar bestanden die niet in de default public folders van Zimbra's webserver applicatie staan. Dit wordt gedaan aan de hand van een ```find``` command, en met ```grep -v``` worden de standaard folders uitgesloten. Het kan zijn dat de webshell dezelfde timestamps of naam heeft als andere standaard bestanden, dit is de reden dat we in het script kijken naar de volledige filepaths. 

Dit script is gebasseerd op clean set-ups van Zimbra versie 8.8.15_GA, 9.0.0_GA en 10.1.0_GA. 

#### Benodigdheden
- Een Linux systeem met Zimbra versie 8.8.15 or 9.0.0 of 10.1.0
- Root access is gewenst

#### Gebruik
1. **Script downloaden:**
- Bezoek the GitHub Repository op `https://github.com/NCSC-NL/zimbra-webshell-scan`
- Download het script en sla op, op het systeem wat Zimbra draait.

2. **Script voorbereiden:** 
- Maak het script uitvoerbaar door middel van het volgende command, in de filepath waar het script is opgeslagen: ```~: chmod +x find_zimbra_webshell.sh```

3. **Script draaien**
- Draai het script door middel van het volgende command, in de filepath waar het script is opgeslagen:```~: ./find_zimbra_webshell.sh```

#### De resultaten uitlezen
- Het script geeft alleen output op het moment dat er mismatch(es) is/zijn gevonden tussen de standaard folders vs. op het gescande systeem. Als het script klaar is en er zijn geen folder paden weergeven, zijn er mismatches gevonden.
- In het geval dat er wel onbekende files zijn gevonden, is dit mogelijk een indicatie dat er een webshell actief is op het gescande systeem. Om dit te verifieren, kun je handmatig door deze bestanden opzoek naar specifieke kernwoorden, zoals: 
	* "JCMD"
	* "JACTION" 

Het is bekend dat de webshell momenteel gebruik maakt van deze bovenstaande cookies, die base64-encoded commands bevatten die kunnen worden uitgevoerd. 

#### Troubleshooting
Als het script niet goed werkt, is het mogelijk dat het script niet compatible is met de Zimbra versie op het systeem.

Optioneel, kun je ook handmatig analyse uitvoeren in de /public/ folders en zoeken naar bestanden die niet tot de standaard configuratie van Zimbra behoren. Let hierbij goed op de volledige file paths. 

#### Wat als er onbekende bestanden zijn gevonden?
1. **Verificatie:**
Ga eerst na of je deze bestanden zelf herkent.
2. **Isolatie:**
Indien je ze niet herkent, en het bevat elementen van de webshell, raden we aan om een snapshot of kopie met memory te maken van het systeem. Zet het systeem niet uit en verwijder niet zelf bestanden. 
3. **Contact:**
Indien jouw organisatie doelgroep is van het NCSC-NL, neem direct contact met ons op. In alle andere gevallen, raden we aan om contact op te nemen met een sectorale of commerciele CERT.

#### Extra informatie
Voor meer gedetailleerde informatie over de webshell, verwijzen we graag naar deze blog: 
[Bleeping Computer](https://www.bleepingcomputer.com/news/security/critical-zimbra-rce-flaw-exploited-to-backdoor-servers-using-emails/)

