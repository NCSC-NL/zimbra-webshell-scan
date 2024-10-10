## Waar kun je op detecteren?
* Kijk in de public folders of er bestanden staan die je niet herkent of niet in de standaard configuratie staan. We hebben hiervoor een bash-script geschreven dat gemakkelijk is te runnen op een eigen systeem. [Github NCSC-NL](https://github.com/NCSC-NL/zimbra-webshell-scan).
* Indien je onbekende bestanden hebt aangetroffen, is er mogelijk een indicatie van de webshell. Om dit te verifieren, kun je deze bestanden doorzoeken op de volgende keywords:
	* "JCMD"
	* "JACTION" 

De webshell gebruikt momenteel deze bovenstaande cookies, die base64-encoded commands bevatten die kunnen worden uitgevoerd.

## Hoe werkt het script?
Dit script zoekt naar bestanden die niet standaard in de public folders van Zimbra web server applicatie horen te staan. Dit wordt gedaan aan de hand van een "find" command, en met "grep -v" worden de standaard folders uitgesloten. Het kan zijn dat de webshell dezelfde timestamps of naam heeft als andere standaard bestanden, dit is de reden dat we in het script kijken naar de volledige filepaths. 

Dit script is gebasseerd op clean set-ups van Zimbra versie 8.8.15_GA, 9.0.0_GA en 10.1.0_GA. 
Let op: Het script kan hierdoor false-positives teruggeven op je eigen systeem. Check altijd eerst of je de bestanden van de output herkent.

## Hoe gebruik je het script?
Kopieer het script en sla het op als "find_zimbra_webshell.sh", op het systeem waar Zimbra op staat.
Maak het script vervolgens uitvoerbaar met het commando
```
 	~: chmod +x find_zimbra_webshell.sh
```
Je kunt het script uitvoeren met het commando op de locatie waar je het hebt opgeslagen:
```
       ~: ./find_zimbra_webshell.sh
```

## Wat als er onbekende bestanden zijn gevonden?
1. Ga eerst na of je deze bestanden zelf herkent.
2. Indien je ze niet herkent, en het bevat elementen van de webshell, raden we aan om een snapshot of kopie met memory te maken van het systeem. Zet het systeem niet uit en verwijder niet zelf bestanden. 
3. Isoleer het systeen en indien jouw organisatie doelgroep is van het NCSC-NL, neem direct contact met ons op. In alle andere gevallen, raden we aan om contact op te nemen met een sectorale of commerciele CERT. 

## Extra informatie
Voor meer gedetailleerde informatie over de webshell, verwijzen we graag naar deze blog: 
[Bleeping Computer](https://www.bleepingcomputer.com/news/security/critical-zimbra-rce-flaw-exploited-to-backdoor-servers-using-emails/)


========================================
## What can you detect?
1. Look in the public folders for files you do not recognize or aren't in the default configuration of Zimbra. We have written a short bash-script that you can run on your own system. [Github NCSC-NL](https://github.com/NCSC-NL/zimbra-webshell-scan).
2. In the event of discovering unknown files, it might indicate that there is a webshell active on your system. To verify this, you could search these files to find specific keywords, such as:
	*"JCMD"
	*"JACTION"

The webshell is known to use these cookies, containing base64-encoded commands that can be executed.  

## How does the script work?
This script looks for files that should not be in the default public folders of Zimbra's websever application. This happens with a "find" command and with "grep -v" the default folders are excluded. The webshell can be found in a file, that is not in the default folder path. It is possible that this malicious file has the same timestamp or name as other legit files, which is why we search for full folder paths, instead of just names. 

This script is based on clean set-ups of Zimbra version 8.8.15_GA, 9.0.0_GA en 10.1.0_GA.
Be aware: due to this, the script can return false-positives on your own system. Please check if you recognize the returned files.

## How to use the script?
Copy the script and save it as "find_zimbra_webshell.sh", on the system that is running Zimbra.
Make the script executable by using the following command:
 ```
    ~: chmod +x find_zimbra_webshell.sh
```
You can run the script by using the following command, in the path location you saved it:
```
    ~: ./find_zimbra_webshell.sh
```
## What if files are found by using the script?
1. Double check if the files are truly unknown to you. 
2. In case you do not recognize them or aren't sure, and they contain elements of the webshell, we advise making a snapshot or copy with memory of the system and isolating it. Do not turn off the system nor remove files yourself.
3. If you are a constituant of NCSC-NL, please reach out to us directly. For other cases, we advise to reach out to your national, sectoral or commercial CERT.

## Additional information
For more detailed information about the webshell, we kindly refer you to:
[Bleeping Computer](https://www.bleepingcomputer.com/news/security/critical-zimbra-rce-flaw-exploited-to-backdoor-servers-using-emails/)


