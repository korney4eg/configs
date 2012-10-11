#! /usr/bin/perl
# Код города
$SITY=RSXX1366;
if (@rss=`curl -s http://weather.yahooapis.com/forecastrss?p...Y&u=f`)
{
# Берем для действий нужную строку
@line=split (/,/,$rss[32]);
# Перевод из градусов по фаренгейту в градусы по цельсию
@far=split (/ /,$line[1]);
$temp=int(($far[1]-32)*5/9);
# Информация о погоде
$_=$line[0];
if (/Cloudy/){
$weather='Облачно'}
if (/Rain/){
$weather='Дождливо'}
if (/Mist/){
$weather='Туманно'}
if (/Sunny/){
$weather='Солнечно'}
if (/Clear/){
$weather='Ясно'}
# Вывод результатов
print "$weather, $temp°C ";
}
else
{
print 'Проверьте подключение ';
}
exit 0;
