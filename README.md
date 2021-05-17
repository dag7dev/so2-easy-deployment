# so2-easy-deployment
easy deployment bash script for operating system homework - Università La Sapienza

# Cosa fa questo script
Scritto affinché testare gli esercizi di sistemi operativi non fosse un'impresa micidiale ogni volta.
Questo script serve a testare gli homework di SO2 in maniera semplice, evitando di copiare e creare file manualmente.
Crea un file zippato pronto per la consegna che puoi trovare in grader.<graderNumber>

**NB: Al momento funziona ed è testato solo per l'homework 2**.



# Istruzioni 📝
Mettere questo file in una cartella, insieme a:
- cartella già scompattata del grader (deve chiamarsi grader.<graderNumber>)

Per l'homework 2:
- cartella relativa all'esercizio o agli esercizi che si sta svolgendo

```
Uso: ./deploy.sh matricola ngrader es
  
  matricola = la tua matricola
  ngrader = il numero del grader, 1 o 2 (a seconda dell'homework
  es = il numero dell'esercizio che hai fatto. Se tutti scrivi all
```

# QA Time 🕐
Q: Gli anni della cartella che mi crea sono sbagliati, cosa posso fare?
A: In caso di necessita', e' necessario settare a mano gli anni nel quale si sta eseguendo l'homework nello script, cambiando manualmente i parametri year1 e year2

Q: ho inserito l'archivio compressato del prof, grader.<graderNumber> ma non funziona nulla, che devo fare?
A: lo script prevede che tu abbia già scompattato l'archivio. Però se vuoi implementare tu questa funzione, fai una PR, sei il benvenuto!

Q: Ho fatto solo HW1 e HW3 e voglio testare solo quegli homework lì. Come posso fare?
A: Non ho tempo per implementare la scelta selettiva degli homework, testerei gli hw singolarmente, però se vuoi effettuare una PR e darmi una mano sei il benvenuto!

Q: Ho eseguito lo script senza file, non funziona nulla. Che succede?
A: questo script deve trovarsi in una cartella con: grader.<numeroGrader> e cartelle con gli homework dentro (es. 1)\n
Esempio dopo aver eseguito ls: 1  deploy.sh  grader.2

Q: Lo renderai compatibile con la procedura dell'homework 1?
A: Non ho tempo per farlo ora, però se vuoi effettuare una PR e darmi una mano sei il benvenuto!

# Nota finale
Settare il deployment è importante, ricordati di lasciare una 💫 se lo script ti è stato utile!

