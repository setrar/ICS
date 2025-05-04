

SOURCE=http://eala.destevez.net/~daniel/LTE
FILE=LTE_uplink_847MHz_2022-01-30_30720ksps

curl ${SOURCE}/${FILE}.sigmf-data --output data/${FILE}.sigmf-data
curl ${SOURCE}/${FILE}.sigmf-meta --output data/${FILE}.sigmf-meta
