#commands for creating Typing compliant data

cp tcf-james-less-numbers.txt tcf-james.txt
silcc -u -t tcf-james-Mephaa-to-QWERTY-table.cct tcf-james.txt > tcf-james-Mephaa-as-QWERTY.txt

UnicodeCCount.pl -n -m tcf-james-Mephaa-as-QWERTY.txt > tcf-james-UnincodeCCount-n-m-Mephaa-QWERTY.txt

chary ngram -f tcf-james-Mephaa-as-QWERTY.txt -n 2 > long-ngramed.txt


sed -e :a -e '$d;N;2,3ba' -e 'P;D' long-ngramed.txt >short-ngramed.txt

awk '{print $1 " " $2}' short-ngramed.txt > bigram.txt

sed -i 's/\\/ \\\\/g' bigram.txt
sed -i 's/␠/ /g' bigram.txt
sed -i 's/␉/\\t/g' bigram.txt
sed -i 's/␊/\\n/g' bigram.txt

rm short-ngramed.txt
rm long-ngramed.txt
mv bigram.txt allDigraphs.txt

chary ngram -f tcf-james-Mephaa-as-QWERTY.txt -n 1 > long-sologramed.txt
sed -e :a -e '$d;N;2,3ba' -e 'P;D' long-sologramed.txt >short-sologramed.txt

awk '{print $1 " " $2}' short-sologramed.txt > sologramed.txt

sed -i 's/\\/ \\\\/g' sologramed.txt
sed -i 's/␠/ /g' sologramed.txt
sed -i 's/␉/\\t/g' sologramed.txt
sed -i 's/␊/\\n/g' sologramed.txt

rm short-sologramed.txt
rm long-sologramed.txt
mv sologramed.txt allChars.txt

mkdir tcf-james-Mephaa-counts-for-Typing
mv allChars.txt tcf-james-Mephaa-counts-for-Typing
mv allDigraphs.txt tcf-james-Mephaa-counts-for-Typing

mkdir tcf-james-Mephaa-KLE
mv tcf-james-Mephaa-as-QWERTY.txt tcf-james-Mephaa-KLE
mv tcf-james-UnincodeCCount-n-m-Mephaa-QWERTY.txt tcf-james-Mephaa-KLE
