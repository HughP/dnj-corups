#commands for creating Typing compliant data

silcc -u -t fra-james-Trans-Mande-to-QWERTY-table.cct fra-james.txt > fra-james-Trans-Mande-as-QWERTY.txt

UnicodeCCount.pl -n -m fra-james-Trans-Mande-as-QWERTY.txt > fra-james-UnincodeCCount-n-m-Trans-Mande-QWERTY.txt

chary ngram -f fra-james-Trans-Mande-as-QWERTY.txt -n 2 > long-ngramed.txt

sed -e :a -e '$d;N;2,3ba' -e 'P;D' long-ngramed.txt >short-ngramed.txt

awk '{print $1 " " $2}' short-ngramed.txt > bigram.txt

sed -i 's/\\/ \\\\/g' bigram.txt
sed -i 's/␠/ /g' bigram.txt
sed -i 's/␉/\\t/g' bigram.txt
sed -i 's/␊/\\n/g' bigram.txt

rm short-ngramed.txt
rm long-ngramed.txt
mv bigram.txt allDigraphs.txt

chary ngram -f fra-james-Trans-Mande-as-QWERTY.txt -n 1 > long-sologramed.txt
sed -e :a -e '$d;N;2,3ba' -e 'P;D' long-sologramed.txt >short-sologramed.txt

awk '{print $1 " " $2}' short-sologramed.txt > sologramed.txt

sed -i 's/\\/ \\\\/g' sologramed.txt
sed -i 's/␠/ /g' sologramed.txt
sed -i 's/␉/\\t/g' sologramed.txt
sed -i 's/␊/\\n/g' sologramed.txt

rm short-sologramed.txt
rm long-sologramed.txt
mv sologramed.txt allChars.txt
mv allChars.txt fra-james-Trans-Mande-counts-for-Typing
mv allDigraphs.txt fra-james-Trans-Mande-counts-for-Typing

mv fra-james-Trans-Mande-as-QWERTY.txt fra-james-Trans-Mande-KLE
mv fra-james-UnincodeCCount-n-m-Trans-Mande-QWERTY.txt fra-james-Trans-Mande-KLE
