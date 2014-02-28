#!/bin/bash
version=1.0
echo "version: "$version

rand()
{
rand=$((RANDOM%9000+999))
#echo $rand

a=$((rand/1000))
#echo $a
b=$((rand - a*1000))
b=$((b/100))
#echo $b 
c=$((rand - a*1000 - b*100))
c=$((c/10))
#echo $c
d=$((rand - a*1000 - b*100 - c*10)) 
#echo $d
}
rand
while :
do
	
	if [[ $a != $b && $a != $c && $a != $d && $b != $c && $b != $d && $c != $d ]]; then		
		break
	else
		rand
	fi
done
		#UNSWER - show first answer.
		#echo $a $b $c $d

echo "Игра 'Быки и Коровы' приветсвтуют Вас! "
echo "
Правила игры
Компьютер задумывает четырехзначное число. Цифры в числе не повторяются, 0 может стоять на первом месте. Игрок делает ходы, чтобы узнать это число. В ответ на каждый ход компьютер показывает число отгаданных цифр, стоящих на своих местах (число быков) и число отгаданных цифр, стоящих не на своих местах (число коров).
Пример
Компьютер задумал 0834. Игрок походил 8134. Компьютер ответил: 2 быка (цифры 3 и 4) и 1 корова (цифра 8).
Новое число уже задумано компьютером. Играем! "
echo
echo
echo "Начали!"

while :
do
	#clear
	#echo $a $b $c $d
	echo " cow = "$cow
	echo "bull = "$bull
	echo "Введите число:"
	read num
	echo $num

	if [[ $num =~ ^[0-9][0-9][0-9][0-9]$ ]]; then
		echo 
	else 
		echo "Не тупи, вводи нормально!"
		continue
	fi
	a1=0
	a1=$((num/1000))
	b1=$((num - a1*1000))
	b1=$((b1/100))
	c1=$((num - a1*1000 - b1*100))
	c1=$((c1/10))
	d1=$((num - a1*1000 - b1*100 - c1*10)) 
	echo $a1 $b1 $c1 $d1
	
	if [[ $a1 != $b1 && $a1 != $c1 && $a1 != $d1 && $b1 != $c1 && $b1 != $d1 && $c1 != $d1 ]]; then		
		echo
	else
		echo "Не тупи, вводи нормально!"
		continue
	fi

	bull=0

	if [[ $a == $a1 ]]; then
		bull=$((bull+1))
	fi

	if [[ $b == $b1 ]]; then
		bull=$((bull+1))
	fi

	if [[ $c == $c1 ]]; then
		bull=$((bull+1))
	fi

	if [[ $d == $d1 ]]; then
		bull=$((bull+1))
	fi
	#---------------------------
	cow=0
	if [[ $a1 == $b || $a1 == $c || $a1 == $d ]]; then
		cow=$((cow+1))
	fi
	if [[ $b1 == $a || $b1 == $c || $b1 == $d ]]; then
		cow=$((cow+1))
	fi
	if [[ $c1 == $a || $c1 == $b || $c1 == $d ]]; then
		cow=$((cow+1))
	fi
	if [[ $d1 == $a || $d1 == $b || $d1 == $c ]]; then
		cow=$((cow+1))
	fi

	if [[ $bull == 4 ]]; then
		echo "Вы выиграли!!! Ура!!!"
		break
	fi
done
