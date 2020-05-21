#!/usr/bin/env bash

# Copyright (C) 2018 Jasper Boom

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Prequisites:
# - sudo apt-get install python
# - sudo apt-get install python-pip
# - sudo pip install pandas

# Galaxy prequisites:
# - sudo ln -s /path/to/folder/galaxy-tool-synonym-checker/getScientificName.py 
#              /usr/local/bin/getScientificName.py

# The getFormatFlow function.
# This function creates a temporary storage directory in the output directory.
# It then calls the getScientificName.py script with the correct input values.
# After the script is finished, output is send to the expected location and
# the temporary storage directory is deleted.
getFormatFlow() {
    strDirectory=${fosOutput::-4}
    mkdir -p "${strDirectory}_temp"
    getScientificName.py -i ${fisInput} -o ${strDirectory}_temp/ \
                         -s ${disProcess} -f ${disFormat}
    cat ${strDirectory}_temp/flNewOutput.tabular > ${fosOutput}
    rm -rf ${strDirectory}_temp
}

# The main function.
main() {
    getFormatFlow
}

# The getopts function.
while getopts ":i:o:s:f:vh" opt; do
    case ${opt} in
        i)
            fisInput=${OPTARG}
            ;;
        o)
            fosOutput=${OPTARG}
            ;;
        s)
            disProcess=${OPTARG}
            ;;
        f)
            disFormat=${OPTARG}
            ;;
        v)
            echo ""
            echo "getScientificName.sh [0.1.0]"
            echo ""

            exit
            ;;
        h)
            echo ""
            echo "Usage: getScientificName.sh [-h] [-v] [-i INPUT] [-o OUTPUT]"
            echo "                            [-s SERVICE] [-f FORMAT]"
            echo ""
            echo "Optional arguments:"
            echo " -h                    Show this help page and exit"
            echo " -v                    Show the software's version number"
            echo "                       and exit"
            echo " -i                    The location of the input file(s)"
            echo " -o                    The location of the output file(s)"
            echo " -s                    The name resolution service"
            echo "                       [global/tnrs]"
            echo " -f                    The format of the input"
            echo "                       file(s) [otu_old/otu_new/lca/blast]"
            echo ""
            echo "The AcceptedTaxonomicName tool will utilize either the"
            echo "Global Names api or the Taxonomic Name Resolution Service api"
            echo "to collect accepted taxonomic names based on BLAST"
            echo "identifications."
            echo ""
            echo "Global Names is for every kingdom."
            echo "TNRS is for plants only."
            echo ""
            echo "Sample names can not start with a '#'."
            echo "All columns in a OTU table should have a header starting"
            echo "with '#'."
            echo ""
            echo "Source(s):"
            echo " - Pyle RL, Towards a Global Names Architecture: The future"
            echo "   of indexing scientific names."
            echo "   ZooKeys. 2016; 550: 261-281."
            echo "   doi: 10.3897/zookeys.550.10009"
            echo "   https://resolver.globalnames.org/api"
            echo " - Boyle B, Hopkins N, Lu Z, Garay JAR, Mozzherin D,"
            echo "   Rees T, The taxonomic name resolution service: an online"
            echo "   tool for automated standardization of plant names."
            echo "   BMC Bioinformatics. 2013; 14(16)."
            echo "   doi: 10.1186/1471-2105-14-16"
            echo "   http://tnrs.iplantcollaborative.org/api.html"
            echo ""

            exit
            ;;
        \?)
            echo ""
            echo "You've entered an invalid option: -${OPTARG}."
            echo "Please use the -h option for correct formatting information."
            echo ""

            exit
            ;;
        :)
            echo ""
            echo "You've entered an invalid option: -${OPTARG}."
            echo "Please use the -h option for correct formatting information."
            echo ""

            exit
            ;;
    esac
done

main

# Additional information:
# =======================
#
# Sample names can not start with a "#".
# All columns in a OTU table should have a header starting with "#".
