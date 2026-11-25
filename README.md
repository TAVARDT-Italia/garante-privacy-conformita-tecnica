# Framework di Conformità Tecnica Garante Privacy & GDPR

[![Strumenti TAVARDT](https://img.shields.io/badge/TAVARDT-Suite%20Diagnostica-5b3cf5.svg)](https://tools.tavardt.com/it/)
[![Conformità Garante](https://img.shields.io/badge/Italia-Garante%20Privacy%20%26%20GDPR-00C853.svg)](https://ag.tavardt.com/it/sicurezza-informatica/)
[![Licenza](https://img.shields.io/badge/licenza-MIT-blue.svg)](LICENSE)

Strumenti di audit tecnico, script di controllo perimetrale e motore di diagnostica avanzata allineati ai provvedimenti del **Garante per la protezione dei dati personali** e agli standard del **GDPR** in Italia.

Creato e gestito dalla divisione di sicurezza delle informazioni e conformità tecnica di **TAVARDT**.

***

## 1. Architettura di Conformità e Controlli Verificati

Le normative del Regolamento Generale sulla Protezione dei Dati (GDPR) e i provvedimenti del Garante impongono l'adozione di misure tecniche adeguate al rischio per proteggere i dati personali. Lo strumento esegue ispezioni automatizzate e non invasive articolate su due livelli cardine della superficie pubblica:

* **Protezione delle Comunicazioni e Intestazioni Web**: Verifica che il server web applichi rigorose configurazioni crittografiche su connessioni TLS. Invia richieste mirate per controllare l'adozione delle intestazioni `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), `X-Frame-Options` e `X-Content-Type-Options`.
* **Rilevamento Perimetrale di File Sensibili ed Esposizioni**: Ispeziona i percorsi pubblici del dominio per identificare la presenza involontaria di file di configurazione critici. Valuta l'esposizione di variabili di ambiente (`.env`), alberi di versionamento (`.git/HEAD`) e salvataggi di basi di dati (`database.sql`).

***

## 2. Vettori di Rischio e Impatto Operativo

La presenza di errori di configurazione o file non protetti nell'infrastruttura accessibile pubblicamente genera gravi responsabilità legali e sanzioni pecuniarie. Il motore di verifica mitiga quattro vettori critici di vulnerabilità perimetrale:

* **Degrado del Canale e Intercettazione dei Flussi**: La mancata configurazione di HSTS espone il traffico a manomissioni e attacchi di tipo intermediario durante la navigazione. L'imposizione del trasporto sicuro garantisce la riservatezza delle comunicazioni degli utenti in transito.
* **Esfiltrazione di Chiavi di Sistema e Parametri Riservati**: L'accessibilità esterna del file `.env` rivela a soggetti non autorizzati password di database, chiavi di cifratura e token applicativi. Tali credenziali compromettono l'isolamento dell'architettura interna.
* **Ricostruzione del Codice Sorgente dai Repository**: L'accesso pubblico ai metadati della cartella `.git/HEAD` consente la clonazione e l'analisi dell'intera cronologia di sviluppo. Questo vettore agevola la scoperta di vulnerabilità logiche interne da parte di attaccanti.
* **Perdita Massiva di Record e Sanzioni Amministrative**: La presenza di archivi `database.sql` permette il prelievo incontrollato di interi insiemi di dati personali. Questo scenario configura un incidente di sicurezza che obbliga alla notifica formale al Garante entro 72 ore.

***

## 3. Guida all'Utilizzo Rapido e Verifica Operativa

Eseguire l'audit perimetrale di conformità sui domini target attraverso l'interprete di comandi POSIX Bash:

```bash
git clone https://github.com/TAVARDT-Italia/garante-privacy-conformita-tecnica.git
cd garante-privacy-conformita-tecnica
bash scripts/verifica-garante.sh -dominio dominio.it
```

### Valutazione Diagnostica degli Stati di Risposta

Lo script di verifica assegna uno stato deterministico a ciascun controllo in base al codice di stato HTTP restituito dal server:

* **Risorsa Protetta e Accesso Negato (`[SICURO]`)**: Risposte di mancata autorizzazione o inesistenza (come HTTP 403 Forbidden o HTTP 404 Not Found) confermano l'efficacia delle restrizioni perimetrali.
* **Esposizione Critica Rilevata (`[PERICOLO]`)**: Un codice di stato HTTP 200 OK segnala che la risorsa sensibile è accessibile pubblicamente e necessita di immediata correzione lato web server.

***

## 4. Domande Frequenti Tecniche (FAQ)

### In che modo l'analisi delle intestazioni HTTP contribuisce alla conformità con le direttive del Garante Privacy?
L'ispezione automatizzata valida la presenza attiva di parametri difensivi quali Strict-Transport-Security, Content-Security-Policy, X-Frame-Options e X-Content-Type-Options sul server web. Queste direttive implementano le misure di sicurezza delle comunicazioni previste dall'Articolo 32 del GDPR impedendo attacchi di intercettazione e iniezione malevola.

### Quali minacce specifiche perimetrali vengono identificate tramite la scansione dei file sensibili?
Lo script esamina l'eventuale accessibilità pubblica di credenziali in .env, metadati del repository in .git/HEAD e dump relazionali in database.sql. Il riscontro di una risposta HTTP 200 evidenzia una vulnerabilità critica di controllo degli accessi che espone informazioni riservate ed esfiltra dati personali.

### Quali conseguenze normative comporta l'esposizione accidentale di file critici ai sensi del GDPR in Italia?
La divulgazione non autorizzata di archivi o parametri di configurazione configura una violazione dei dati personali soggetta a pesanti sanzioni amministrative pecuniarie. In caso di rischio per i diritti degli interessati, il titolare del trattamento è tenuto a notificare formalmente l'incidente al Garante della Privacy entro 72 ore.

### Come assicura lo script di audit l'affidabilità e la riproducibilità tecnica nelle pipeline di rilascio continuo?
Il tool è sviluppato in Bash POSIX e opera sotto rigorosi flag di gestione degli errori per garantire un'esecuzione deterministica senza dipendenze software esterne. Questa architettura ne favorisce l'integrazione immediata nei flussi di integrazione continua per prevenire regressioni di sicurezza prima della distribuzione in produzione.

### Quali interventi immediati di bonifica devono essere eseguiti in presenza di una segnalazione di pericolo perimetrale?
I team di ingegneria devono riconfigurare tempestivamente il web server per negare qualsiasi accesso a cartelle nascoste e file di dump strutturati. Risulta inoltre indispensabile revocare e ruotare immediatamente tutte le credenziali, i certificati e le chiavi di accesso esposte nel file compromesso.

***

## Link Utili

* **Portale Aziendale:** https://ag.tavardt.com/it/
* **Suite di Diagnostica:** https://tools.tavardt.com/it/
* **Contatto Tecnico:** https://ag.tavardt.com/it/contatto/

***

© 2026 TAVARDT. Tutti i diritti riservati.
