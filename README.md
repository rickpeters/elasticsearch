# Elastic Search CLuster

## research
* [Diverse onderzoeksresultaten gebruikt voor inrichting](RESEARCH.md)

## uitgangspunten
* de isilon share is gemount 
## werkwijze
Het basisimage voor elasticsearch is voldoende zie [dockerfile/elasticsearch](https://registry.hub.docker.com/u/dockerfile/elasticsearch/), op basis hiervan is wel een image gima/es gemaakt wat voorbereid is op werking achter de www-proxy van Kadaster, dit zorgt ervoor dat Elasticsearch zelf plugins kan downloaden.

* per Dockerhost waarop elasticsearch nodes gaan draaien moet het script

