# Elastic Search Cluster

## research
* [Diverse onderzoeksresultaten gebruikt voor inrichting](RESEARCH.md)

## uitgangspunten
* op iedere Dockerhost is de directory /mnt/gima gemount middels een toevoeging aan `/etc/fstab`

	```
kad-dca-nas-001.so.kadaster.nl:/ifs/customers/kad3/ont/gima  /mnt/gima  nfs  rsize=8192,wsize=8192,timeo=14,intr
```
* op iedere dockerhost is `fig` geïnstalleerd voor docker container management met het `install_fig.sh` script (middels `sudo`)
* in de directory `/mnt/gima/gitrepos/bigdata-elasticsearch` staat een clone van de betreffende github repo met daarin de relevante scripts

## werkwijze
Het basisimage voor elasticsearch is voldoende zie [dockerfile/elasticsearch](https://registry.hub.docker.com/u/dockerfile/elasticsearch/), op basis hiervan is wel een image gima/es gemaakt wat voorbereid is op werking achter de www-proxy van Kadaster, dit zorgt ervoor dat Elasticsearch zelf plugins kan downloaden, voor dit moment is dat echter niet nodig.

* per Dockerhost waarop elasticsearch nodes gaan draaien moet het script `prepare_container.sh {n}` worden uitgevoerd, waarbij `{n}` het aantal elasticsearch nodes is wat geactiveerd wordt op deze Dockerhost.
	* er wordt een directory `/var/appdata/es_node_x` gemaakt voor de persistentie van de data van de elasticsearch node
	* hierin wordt een [elasticsearch.yml](elasticsearch.yml) met de elasticsearch configuratie geplaatst
	* de management plugin `marvel` wordt geïnstalleerd
* de aanwezige `fig.yml` bevat de definities voor 4 elasticsearch nodes, die elk gemount worden aan  de directory voor persistent data
* het commando `fig up` zal vervolgens de 4 nodes opstarten en automatisch toevoegen aan het Elasticsearch cluster `gimabigdata`
* de Elasticsearch nodes zoeken zelfstandig een vrije poort, beginnend bij 9200, de nodes draaien in de praktijk dus op poort 9200 t/m 9203 

## benaderen van het cluster
Er is geen loadbalancer functionaliteit gerealiseerd (bijvoorbeeld met een nginx ha proxy of vergelijkbaar), praktisch gezien betekent dat dat iedere willekeurige node benaderd kan worden voor vragen via de uri van de betreffende Dockerhost en het gebruikte poortnummer. Het cluster selecteert zelfstandig een master.

* de [rest interface](http://gima-yoda2.so.kadaster.nl:9200/_cat)
* de [marvel beheer interface](http://gima-yoda2.so.kadaster.nl:9200/_plugin/marvel)