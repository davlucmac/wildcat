from_address="davlucmac@gmail.com" # change this
to_address="davlucmac@me.com" # and this
username="davlucmac@gmail.com" # and this
password="4NCH0R!!dlm2181" #            this too
echo -n "Checking newegg for MSI Vega 56 Air Boost video cards"
echo "Subject: Video card update

Go buy some video cards, hurry! https://www.newegg.com/Product/Product.aspx?Item=N82E16814137263&cm_re=vega-_-14-137-263-_-Product
" > messageMSIVega56AirBoost.txt
running=true; while $running; do
echo -n "."
sleep 60
if [ -z "`wget -qO- https://www.newegg.com/Product/Product.aspx?Item=N82E16814137263&cm_re=vega-_-14-137-263-_-Product | grep "OUT OF STOCK"`" ]
then
echo "In stock! Sending an email."
curl -n --ssl-reqd --mail-from "<$from_address>" --mail-rcpt "<$to_address>" --url smtps://smtp.gmail.com:465 -T message.txt -u "$username:$password"
running=false
rm messageMSIVega56AirBoost.txt
fi
done
