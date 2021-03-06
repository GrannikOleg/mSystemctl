#!/bin/bash
source "sSystemctl.sh"
 MARK(){ $e "\e[1;35m";}
#
 HEAD()
{
 for (( a=2; a<=27; a++ ))
  do
   TPUT $a 1
        $E "\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  2 3;$E "\e[1;36mOptions \e[0m \e[36m Подразумеваются следующие варианты:\e[0m";
              TPUT  3 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 26 1;$E "\033[35m├─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────┤\e[0m";
         MARK;TPUT  1 1;$E "\033[0m\033[35m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";UNMARK;
}
 FOOT(){ MARK;TPUT 28 1;$E "\033[0m\033[35m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  4 3; $e "При использовании с enable агрегаты также будут запущены              \e[32m --now \e[0m";}
  M1(){ TPUT  5 3; $e "используйте указанный корневой путь при поиске юнит-файлов          \e[32m --root= \e[0m";}
  M2(){ TPUT  6 3; $e "не сохранять вносимые изменения после перезагрузки                \e[32m --runtime \e[0m";}
  M3(){ TPUT  7 3; $e "Принимает одно из значений full enable-only disable-only     \e[32m --preset-mode= \e[0m";}
  M4(){ TPUT  8 3; $e "количество строк вывода лога для команды status                 \e[32m -n --lines= \e[0m";}
  M5(){ TPUT  9 3; $e "управляет форматированием отображаемых записей журнала         \e[32m -o --output= \e[0m";}
  M6(){ TPUT 10 3; $e "C reboot указывает микропрограмме системы перезагрузиться  \e[32m --firmware-setup \e[0m";}
  M7(){ TPUT 11 3; $e "C reboot указывает загрузчику показывать меню загрузчика\e[32m --boot-loader-menu= \e[0m";}
  M8(){ TPUT 12 3; $e "C reboot указывает системному загрузчику загрузиться   \e[32m --boot-loader-entry= \e[0m";}
  M9(){ TPUT 13 3; $e "Этот переключатель используется при перезагрузке         \e[32m --reboot-argument= \e[0m";}
 M10(){ TPUT 14 3; $e "вывод печатается в виде списка, а не дерева                         \e[32m --plain \e[0m";}
 M11(){ TPUT 15 3; $e "Измените формат печатаемых временных меток, следующие значения:\e[32m --timestamp= \e[0m";}
 M12(){ TPUT 16 3; $e "создает целевой файл или каталог перед применением привязки         \e[32m --mkdir \e[0m";}
 M13(){ TPUT 17 3; $e "Разрешено только с перезагрузкой или перезапуском                  \e[32m --marked \e[0m";}
 M14(){ TPUT 18 3; $e "C привязкой создает монтирование привязки только для чтения     \e[32m --read-only \e[0m";}
 M15(){ TPUT 19 3; $e "Выполните операцию удаленно                                      \e[32m -H --host= \e[0m";}
 M16(){ TPUT 20 3; $e "Выполнить операцию в локальном контейнере                     \e[32m -M --machine= \e[0m";}
 M17(){ TPUT 21 3; $e "Не использовать постраничную навигацию                           \e[32m --no-pager \e[0m";}
 M18(){ TPUT 22 3; $e "Включить или отключить печать легенды                         \e[32m --legend=BOOL \e[0m";}
 M19(){ TPUT 23 3; $e "Напечатайте краткий текст справки и выйдите                       \e[33m -h --help \e[0m";}
 M20(){ TPUT 24 3; $e "Напечатайте короткую строку версии и выйдите                      \e[33m --version \e[0m";}
 M21(){ TPUT 25 3; $e "не выводить подробное описание                                  \e[32m --no-legend \e[0m";}
#
 M22(){ TPUT 27 3; $e "Выход                                                                  \e[36m Exit \e[0m";}
LM=22
  MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с enable агрегаты также будут запущены.
 При использовании с отключением или маской блоки также будут остановлены.
 Операция пуска или останова выполняется только после успешного завершения
 соответствующей операции включения или отключения.
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с enable/disable/is-enabled (и связанными с ними командами)
 используйте указанный корневой путь при поиске юнит-файлов. Если эта опция
 присутствует, systemctl будет работать с файловой системой напрямую,
 вместо того, чтобы связываться с демоном systemd для внесения изменений.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с enable, disabled, edit (и соответствующими командами)
 вносите изменения только временно, чтобы они были потеряны при следующей
 перезагрузке. Это приведет к тому, что изменения будут сделаны не в
 подкаталогах /etc/, а в /run/ с идентичными немедленными последствиями,
 однако, поскольку последний теряется при перезагрузке, изменения также теряются.
  Точно так же при использовании с set-property вносите изменения только временно,
 чтобы они были потеряны при следующей перезагрузке.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Принимает одно из значений «full» (по умолчанию), «enable-only», «disable-only».
 При использовании с предустановленными командами или предустановленными всеми
 командами определяет, должны ли блоки отключаться и включаться в соответствии
 с предустановленными правилами, либо только включаться, либо только отключаться.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании со статусом управляет количеством отображаемых строк журнала,
 начиная с самых последних. Принимает положительный целочисленный аргумент или 0,
 чтобы отключить вывод журнала. По умолчанию 10.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании со статусом управляет форматированием отображаемых записей
 журнала. Для доступных вариантов смотрите journalctl. По умолчанию «short».
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с командой reboot указывает микропрограмме системы
 перезагрузиться в интерфейсе настройки микропрограммы.
 Обратите внимание, что эта функция доступна не во всех системах.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с командой reboot указывает системному загрузчику
 показывать меню загрузчика при следующей загрузке.
 Принимает значение времени в качестве параметра, указывающее тайм-аут меню.
 Передайте ноль, чтобы отключить тайм-аут меню.
 Обратите внимание, что не все загрузчики поддерживают эту функцию.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 При использовании с командой reboot указывает системному загрузчику
 загрузиться в определенную запись загрузчика при следующей загрузке.
 Принимает идентификатор записи загрузчика в качестве аргумента или «help»,
 чтобы вывести список доступных записей.
 Обратите внимание, что не все загрузчики поддерживают эту функцию.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Этот переключатель используется при перезагрузке.
 Значение зависит от архитектуры и микропрограммы. Например, «recovery»
 может использоваться для запуска восстановления системы, а
 «fota» может использоваться для запуска «беспроводного» обновления прошивки.
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 При использовании со списками-зависимостями, блоками-списками, машинами-списками
 вывод печатается в виде списка, а не дерева, а кружки маркеров опускаются.
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Измените формат печатаемых временных меток. Можно использовать следующие значения:
 pretty (this is the default) Day YYYY-MM-DD HH:MM:SS TZ
 us, µs                       Day YYYY-MM-DD HH:MM:SS.UUUUUU TZ
 utc                          Day YYYY-MM-DD HH:MM:SS UTC
 us+utc, µs+utc               Day YYYY-MM-DD HH:MM:SS.UUUUUU UTC
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 При использовании с привязкой создает целевой файл или каталог перед применением
 привязки. Обратите внимание, что несмотря на то, что название этой опции
 предполагает, что она подходит только для каталогов, эта опция также создает
 конечный файловый узел для монтирования, если объект для монтирования является
 не каталогом, а обычным файлом, узлом устройства, сокетом или FIFO.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Разрешено только с перезагрузкой или перезапуском.
 Ставит в очередь задания перезапуска для всех модулей с пометкой
 «требуется перезапуск» и перезагружает задания для модулей с пометкой
 «требуется перезагрузка». Когда юнит, отмеченный для перезагрузки,
 не поддерживает перезагрузку, перезагрузка будет поставлена в очередь.
 Эти свойства можно установить с помощью меток set-property.
 Если не используется --no-block,
 systemctl будет ждать завершения заданий в очереди.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 При использовании с привязкой
 создает монтирование привязки только для чтения.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Выполните операцию удаленно. Укажите имя хоста или имя пользователя и имя хоста,
 разделенные «@», для подключения. Имя хоста может дополнительно сопровождаться
 суффиксом порта, который прослушивает ssh, разделенным «:», а затем именем
 контейнера, разделенным «/», которое напрямую подключается к определенному
 контейнеру на указанном хосте. Это будет использовать SSH для связи с экземпляром
 удаленного диспетчера машин. Имена контейнеров можно перечислить
 с помощью команды machinectl -H HOST. Поместите IPv6-адреса в скобки.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Выполнить операцию в локальном контейнере. Укажите имя контейнера, к которому
 необходимо подключиться, при необходимости с префиксом имени пользователя для
 подключения и разделительным символом «@». Если вместо имени контейнера
 используется специальная строка .host выполняется подключение к локальной системе
 (что полезно для подключения к пользовательской шине конкретного пользователя:
 --user --machineu003dlennart@ .host Если синтаксис «@» не используется,
 подключение выполняется от имени пользователя root.
 Если используется синтаксис «@», либо левая, либо правая часть может быть опущена
 (но не обе) в в этом случае подразумевается локальное имя пользователя и «.host».
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Не направляйте вывод на пейджер.
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Включить или отключить печать легенды, т.е. заголовков столбцов и нижнего
 колонтитула с подсказками. Легенда печатается по умолчанию,
 если только она не отключена параметром --quiet или подобным.
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Напечатайте краткий текст справки и выйдите:
\e[32m systemctl -h\e[0m
#
\e[32m systemctl --help\e[0m
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Напечатайте короткую строку версии и выйдите:
\e[32m systemctl --version \e[0m";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "";ES;fi;;
#
 22) S=M22;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
