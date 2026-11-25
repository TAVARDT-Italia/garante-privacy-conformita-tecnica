# Framework di Conformità Tecnica Garante Privacy & GDPR

[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)]
[![Licenza](https://img.shields.io/badge/licenza-MIT-blue.svg)](LICENSE)
[![Strumenti TAVARDT](https://img.shields.io/badge/TAVARDT-Suite%20Diagnostica-5b3cf5.svg)](https://tools.tavardt.com/it/)
[![Conformità Garante](https://img.shields.io/badge/Italia-Garante%20Privacy%20%26%20GDPR-00C853.svg)](https://ag.tavardt.com/it/sicurezza-informatica/)

Strumenti di audit tecnico, script di controllo perimetrale e linee guida operative allineate ai provvedimenti del **Garante per la protezione dei dati personali** e agli standard del **GDPR** in Italia.

Creato e gestito dalla divisione di sicurezza delle informazioni di **TAVARDT**.

***

## 1. Controlli di Sicurezza Verificati

* **Sicurezza del Canale Web:** Verifica delle intestazioni HSTS, CSP, X-Frame-Options e forzatura di TLS 1.3.
* **Protezione dalle Follie di Configurazione:** Scansione di file sensibili non protetti (`.env`, `.git`, dump di database).
* **Tutela dell'Identità del Dominio:** Audit delle policy DMARC, DKIM e SPF per prevenire truffe informatiche e phishing.
* **Gestione del Consenso Utente:** Verifica del blocco preventivo dei cookie di terze parti prima del consenso informato.

***

## 2. Utilizzo Rapido

Clonare il repository ed eseguire lo script di diagnostica di sicurezza:

```bash
git clone https://github.com/TAVARDT-Italia/garante-privacy-conformita-tecnica.git
cd garante-privacy-conformita-tecnica
bash scripts/verifica-garante.sh -dominio azienda.it
```

***

## 3. Strumenti Diagnostici Gratuiti Online (Italia)

Testa la robustezza della tua infrastruttura aziendale con la suite TAVARDT:

* [Controllo Intestazioni HTTP di Sicurezza](https://tools.tavardt.com/it/analisi-header-sicurezza/)
* [Scansione File e Segreti Esposti](https://tools.tavardt.com/it/scansione-file-esposti/)
* [Validatore DMARC e Anti-Spoofing](https://tools.tavardt.com/it/verifica-dmarc-email/)
* Suite Completa di Strumenti TAVARDT

Per consulenza specialistica in ciberdifesa, hardening di sistema e adeguamento alle linee guida del Garante, contatta **TAVARDT**.

***

## Link Utili

* **Portale Aziendale:** https://ag.tavardt.com/it/
* **Suite di Diagnostica:** https://tools.tavardt.com/it/
* **Contatto Tecnico:** https://ag.tavardt.com/it/contatto/

***

© 2026 TAVARDT. Tutti i diritti riservati.
