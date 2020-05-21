# galaxy-tool-synonym-checker

__!!Repo can be deleted, copy is also kept [here](https://github.com/JasperBoom/galaxy-tools-naturalis-internship)!!.__

Use a python script to utilize either the Global Names api or the TNRS api to collect accepted taxonomic names.  
The AcceptedTaxonomicName tool will utilize either the Global Names api or the Taxonomic Name Resolution Service api to collect accepted taxonomic names based on BLAST identifications.

Global Names is for every kingdom.  
TNRS is for plants only.

Sample names can not start with a "#".  
All columns in a OTU table should have a header starting with "#".

# Getting started

### Prerequisites
Download and install the following software according to the following steps.
```
sudo apt-get install python-pip
sudo pip install pandas
```

### Installing
Download and install the tool according to the following steps.
```
sudo mkdir -m 755 /home/Tools
cd /home/Tools
sudo git clone https://github.com/JasperBoom/galaxy-tool-synonym-checker
sudo chmod -R 755 galaxy-tool-synonym-checker
```
The following file in the galaxy-tool-synonym-checker folder should be made avaible from any location.
```
sudo ln -s /home/Tools/galaxy-tool-synonym-checker/getScientificName.py /usr/local/bin/getScientificName.py
```
Continue with the tool installation
```
sudo mkdir -m 755 /home/galaxy/tools/directoryname
sudo cp /home/Tools/galaxy-tool-synonym-checker/getScientificName.sh /home/galaxy/tools/directoryname/getScientificName.sh
sudo cp /home/Tools/galaxy-tool-synonym-checker/getScientificName.xml /home/galaxy/tools/directoryname/getScientificName.xml
```
Edit the following file in order to make galaxy display the tool.
```
/home/galaxy/config/tool_conf.xml
```
```
<tool file="airdentification/getScientificName.xml"/>
```

## Source(s)
* __Pyle RL__,  
  Towards a Global Names Architecture: The future of indexing scientific names.  
  ZooKeys. 2016; 550: 261-281. __doi: 10.3897/zookeys.550.10009__  
  [Global Names](https://resolver.globalnames.org/api)
* __Boyle B, Hopkins N, Lu Z, Garay JAR, Mozzherin D, Rees T__,  
  The taxonomic name resolution service: an online tool for automated standardization of plant names.  
  BMC Bioinformatics. 2013; 14(16). __doi: 10.1186/1471-2105-14-16__  
  [TNRS](http://tnrs.iplantcollaborative.org/api.html)
* __Giardine B, Riemer C, Hardison RC, Burhans R, Elnitski L, Shah P__,  
  Galaxy: A platform for interactive large-scale genome analysis.  
  Genome Research. 2005; 15(10) 1451-1455. __doi: 10.1101/gr.4086505__  
  [Galaxy](https://www.galaxyproject.org/)

```
Copyright (C) 2018 Jasper Boom

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License version 3 as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
```
