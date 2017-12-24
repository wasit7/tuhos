sudo apt-get -y install unrar
mkdir zeppelin/data/
mkdir zeppelin/data/pocrar
mkdir zeppelin/data/poc
#tar xvzf zeppelin/data_poc.tar.gz -C zeppelin/data
unrar e -r zeppelin/data_poc.rar zeppelin/data/pocrar

iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ADDRTYPE.csv > zeppelin/data/poc/ADDRTYPE.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARDBCODE.csv > zeppelin/data/poc/ARDBCODE.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARDBGRP.csv > zeppelin/data/poc/ARDBGRP.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARDBT.csv > zeppelin/data/poc/ARDBT.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARGRP.csv > zeppelin/data/poc/ARGRP.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARINV.csv > zeppelin/data/poc/ARINV.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/ARPT.csv > zeppelin/data/poc/ARPT.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/CHANGWAT.csv > zeppelin/data/poc/CHANGWAT.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/OCCPTN.csv > zeppelin/data/poc/OCCPTN.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/PTADDR.csv > zeppelin/data/poc/PTADDR.csv
iconv -f utf-16le -t utf8 zeppelin/data/pocrar/PT.csv > zeppelin/data/poc/PT.csv

mv zeppelin/data/pocrar/DataDictionary.xlsx zeppelin/data/poc/DataDictionary.xlsx
rm -rf zeppelin/data/pocrar

file --mime zeppelin/data/poc/ADDRTYPE.csv
file --mime zeppelin/data/poc/ARDBCODE.csv
file --mime zeppelin/data/poc/ARDBGRP.csv
file --mime zeppelin/data/poc/ARDBT.csv
file --mime zeppelin/data/poc/ARGRP.csv
file --mime zeppelin/data/poc/ARINV.csv
file --mime zeppelin/data/poc/ARPT.csv
file --mime zeppelin/data/poc/CHANGWAT.csv
file --mime zeppelin/data/poc/OCCPTN.csv
file --mime zeppelin/data/poc/PTADDR.csv
file --mime zeppelin/data/poc/PT.csv


