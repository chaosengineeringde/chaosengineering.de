---
title: So dokumentieren wir unsere Experimente
subtitle: Ein Template mit Ausfüllhinweisen
summary: >-
  Das Template dass wir nutzen um unsere Experimente bei den Gamedays zu
  dokumentieren. 
authors:
  - jonasvordemberge
tags:
  - gamedays
categories:
  - knowledgebase
date: 2020-03-20T13:47:49.912Z
lastmod: 2020-03-20T13:47:49.972Z
featured: false
draft: false
image:
  file: featured.png
  preview_only: false
---
Wir nutzen für unsere Gamedays meist folgende Tabelle um die Experimente zu dokumentieren. 

| Experiment name | |
| --------------- | ------------ |
| Planned start | Zeitpunkt an dem die Attacke beginnt - so genau wie möglich (hilft später um Logs zu finden etc) |
| Planned end | |
| Type of attack | z.B. "Rolling Update unter Last, DB Failover, ... |
| Target | Was wird angegriffen? (Service, DB, EC2 Instanz) <br> Sei präzise! Name, Umgebung, Branch, Labels... alles was hilft das Target später wiederzufinden. <br> Am besten mit Link zum Repo, inkl. Commit-ID <br> |
| Details of attack | Wie genau wird die Attacke ausgeführt? <br> Kopier am besten die vollständigen Befehle hier rein die du ausführen wirst! <br> Wenn möglich so genau beschreiben, dass jemand anderes das Experiment wiederholen kann ohne dabei gewesen zu sein. <br>Wenn du ein Script benutzt um Traffic für das Experiment zu erzeugen: füge einen Link ein (inkl. Commit-ID)
| Rollback | Notwendige Schritte um den Angriff abzubrechen / zurückzurollen |
| Blast radius | Was wird voraussichtlich alles vom Angriff betroffen sein? (z.B. die Consumer des angegriffenen Services, das Frontend, der User, ...) |
| Steady state | Was ist der Normalzustand des Systems vor dem Experiment? Zu messen am besten in eurem Monitoring. <br> Z.B. 0% Error Rate, 150ms Latency (95 perzentil) bei 100 Requests/min  <br> Je fachlicher der gemessene Steady State ist desto besser, z.B. ist "100 erfolgreiche Bestellungen / min" besser als "100 Requests / min auf service x" |
| Hypothesis | Beschreibe die Hypothese des Experiments. Sei genau und ausführlich! <br>Z.B: Wenn wir eine Instanz von Service x unter Last terminieren, erwarten wir<br>- max x% Fehlerate über einen Zeitraum von z Sekunden <br>- max x% gestiegene Antwortzeiten über einen Zeitraum von z Sekunden<br>- die fehlerhaften Requests sollen durch Retries des Aufrufers abgefangen werden<br>- innerhalb von x Sekunden wird eine neue Instanz hochgefahren und der Steady State wiederhergestellt
| Steady state before | Überprüfe vor dem Experiment den Steady State. Wenn er dem definierten State entspricht: "ok" |
| Steady state during / after | Messe während des Experiments den State deiner Applikation.<br>Wenn er der Hypothese entspricht: "ok"<br>Wenn nicht: "failed" |
| Findings | Beschreibe deine Findings. Sei genau und ausführlich! Gehe dazu alle Punkte deiner Hypothese Schritt für Schritt durch und überprüfe ob sie zugetroffen sind oder nicht.<br><br>Das Motto hier ist: "Screenshot or it didn't happen" ;-)<br>Mache Screenshots von allem was dir auffällt im Monitoring, Tracing, Logging, Cloudwatch, der Applikation selber, ...<br>Beschreibe / verlinke alles was dir später bei der Analyse deiner Findings hilft, was nochmal überprüft werden sollte, oder was dir sonst noch aufgefallen ist (z.B. "fachlicher Prozess unklar", "Dokumentation veraltet", ...)
| Links / Attachments | Füge hier alle wichtigen Links hinzu, z.B. zu Monitoring-Views, Dashboards oder Log-Streams hinzu. <br>Das erleichtert die Nacharbeit sehr! |


Dies ist die Tabelle die wir benutzen (und stetig weiterentwickeln), lass dich gerne davon inspirieren, aber halte dich nicht sklavisch dran - es ist ein Vorschlag, kein Gesetz! 

Die Tabelle hilft dabei strukturierte Experimente durchzuführen und saubeere Dokumentation zu erstellen, sorgt aber auch dafür dass man automatisch in eine bestimmte Richtung denkt. Nutze daher nicht für jeden Gameday diese Tabelle, sondern mach auf jeden Fall auch mal andere / freie Formate!
