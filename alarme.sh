#!/bin/bash

opcoes_de_uso(){
echo "Uso: $(basename "$0") [OPÇÔES]

OPÇÕES
  -p, --progressive     Inicia o cronometro em ordem progressiva
                        Obs.:Para limitar o tempo na contagem progressiva,
                        é necessário informar o tempo final no formato
                        hh:mm:ss.

  -r, --regressive      Inicia o cronometro em ordem regressiva.
                        Obs.: Necessário informar tempo inicial 
                        no formato hh:mm:ss.

  -h, --help            Mostra esta tela de ajuda e sai

  -v, --version         Mostra a versão do programa e sai

EXEMPLOS DE USO: 
   $./pomodoro -p.................contagem progessiva infinita
   $./pomodoro -p 01:00:00........contagem progressiva de 1 hora
   $./pomodoro -r 01:00:00........contagem regressiva de 1 hora
" && exit 1
}

nome_software="Alarm NOW";

# Armazena a versão do software
versao_software="1.0";

# Armazena o nome do desenvolvedor do software
desenvolvedor_software="Eder S. G. <ederjordam@yahoo.com.br>";

clear;  # Limpa a tela

echo "+----------------------------------------------------------------+";
echo "|   $nome_software $versao_software - Por: $desenvolvedor_software    |";
echo "+----------------------------------------------------------------+";

echo "";  # Gera uma linha em branco

echo "PARTE 1: Dados referentes a data do alarme";
echo "------------------------------------------";
echo "Você deseja utilizar a data atual, ou seja, `date +%d/%m/%G`? ";
echo "Digite 1 para SIM ou 2 para NÃO e logo após, tecle ENTER";
read utilizar_data_atual;  # Armazena  o valor digitado pelo usuário na variável 'utilizar_data_atual'

if [ "$utilizar_data_atual" = "1" ]; then  # Se o conteúdo de 'utilizar_data_atual' for igual a 1 então...
   dia=`date +%d`;  # Obtem o dia (01 até 31)
   mes=`date +%m`;  # Obtem o mês (01 até 12)
   ano=`date +%G`;  # Obtem o ano (2005)
else if [ "$utilizar_data_atual" = "2" ]; then  # Senão se o conteúdo de 'utilizar_data_atual' for igual a 2 então...
   echo "";  # Gera uma linha em branco

   echo "Por favor, digite um número (de 1 a 31) referente ao dia:";
   read dia;  # Armazena o dia digitado pelo usuário na variável 'dia'

   if [ "$dia" -lt 1 ] || [ "$dia" -gt 31 ]; then  # Se 'dia' for menor que 1 ou maior que 31 então...
      echo "Atenção! $dia é uma opção inválida.";
      exit;  # Termina/encerra a execução do software
   else
      case "$dia" in
         [1-9])  # Se o valor armazenado na variável 'dia' estiver entre 1 e 9
         dia=0${dia};  # A variável 'dia' receberá o valor 0 acrescido do proprio número que o usuário digitou
      ;;
      esac  # fim do comando 'case'
   fi  # fim do comando 'if'

   echo "";  # Gera uma linha em branco

   echo "Por favor, digite um número (de 1 a 12) referente ao mes:";
   echo "1 é referente ao mês de JANEIRO";
   echo "2 é referente ao mês de FEVEREIRO";
   echo "3 é referente ao mês de MARÇO";
   echo "..."
   echo "10 é referente ao mês de OUTUBRO";
   echo "11 é referente ao mês de NOVEMBRO";
   echo "12 é referente ao mês de DEZEMBRO";
   read mes;  # Armazena o mês digitado pelo usuário na variável 'mes'

   if [ "$mes" -lt 1 ] || [ "$mes" -gt 12 ]; then  # Se 'mes' for menor que 1 ou maior que 12 então...
      echo "Atenção! $mes é uma opção inválida.";
      exit;  # Termina/encerra a execução do software
   else
      case "$mes" in
         [1-9])  # Se o valor armazenado na variável 'mes' estiver entre 1 e 9
         mes=0${mes};  # A variável 'mes' receberá o valor 0 acrescido do proprio número que o usuário digitou
      ;;
      esac  # fim do comando 'case'
   fi  # fim do comando 'if'

   echo "";  # Gera uma linha em branco

   echo "Por favor, digite um número (2005) referente ao ano:";
   read ano;  # Armazena o ano digitado pelo usuário na variável 'ano'

   if [ "$ano" -lt 2005 ] || [ "$ano" -gt 2029 ]; then  # Se 'ano' for menor que 2005 ou maior que 2029 então...
      echo "Atenção! $ano é uma opção inválida.";
      exit;  # Termina/encerra a execução do software
   fi
else  # Senão...
   echo "Atenção! $utilizar_data_atual é uma opção inválida.";
   exit;  # Termina/encerra a execução do software
fi  # fim do 'else if'
fi  # fim do comando 'if' principal

echo "";  # Gera uma linha em branco

echo "PARTE 2: Dados referentes ao horário do alarme";
echo "----------------------------------------------";
echo "Por favor, digite um número (de 0 a 23) referente as horas:";  # Exibe a frase na tela
read hora;  # Armazena a hora digitado pelo usuário na variável 'hora'

if [ "$hora" -lt 0 ] || [ "$hora" -gt 23 ]; then  # Se 'hora' for menor que 0 ou maior que 23 então...
   echo "Atenção! $hora é uma opção inválida.";
   exit;  # Termina/encerra a execução do software
else  # Senão...
   case "$hora" in
      [0-9])  # Se o valor armazenado na variável 'hora' estiver entre 0 e 9
      hora=0${hora};  # A variável 'hora' receberá o valor 0 acrescido do proprio número que o usuário digitou
   ;;
   esac
fi  # fim do comando 'if'

echo "";  # Gera uma linha em branco

echo "Por favor, digite um número (de 0 a 59) referente aos minutos:";
read minuto;  # Armazena o minuto digitado pelo usuário na variável 'minuto'

if [ "$minuto" -lt 0 ] || [ "$hora" -gt 59 ]; then  # Se 'minuto' for menor que 0 ou maior que 59 então...
   echo "Atenção! $minuto é uma opção inválida.";
   exit;  # Termina/encerra a execução do software
else  # Senão...
   case "$minuto" in
      [0-9])  # Se o valor armazenado na variável 'minuto' estiver entre 0 e 9
      minuto=0${minuto};  # A variável 'minuto' receberá o valor 0 acrescido do proprio número que o usuário digitou
   ;;
   esac
fi  # fim do comando 'if'

echo "";  # Gera uma linha em branco

echo "Por favor, digite uma mensagem que será exibida na hora do alarme:";
read mensagem_alarme; # Armazena a mensagem digitada pelo usuário na variável 'mensagem_alarme'

if [ -z "$mensagem_alarme" ]; then  # Se o usuário não digitou nenhuma mensagem então...
   mensagem_alarme="BEEP! BEEP! BEEP!";  # A mensagem padrão será: 'BEEP! BEEP! BEEP!'
fi  # fim do comando 'if'

echo "";  # Gera uma linha em branco

echo "Por favor, digite o número de vezes que você quer ouvir o alarme:";
read quantidade_de_beeps; # Armazena o número de vezes que o usuário deseja ouvir o alarme

# Para saber se o conteudo de uma variavel é numero ou nao
if ! expr $quantidade_de_beeps + 1 > /dev/null 2> /dev/null; then
   echo "Atenção! $quantidade_de_beeps é uma opção inválida.";
   exit;  # Termina/encerra a execução do software
fi

echo "";  # Gera uma linha em branco
clear;    # Limpa a tela

# A variável 'dia_alarme' armazenará o dia, mes, ano, hora e minuto
dia_alarme="$dia/$mes/$ano-$hora:$minuto";

echo "$nome_software $versao_software funcionando!"
echo "--------------------------";
echo "Data e hora da configuração ......: `date +%d/%m/%G-%H:%M`";
echo "Data e hora que o alarme soará ...: $dia_alarme";
echo "Número de beeps que você ouvirá ..: $quantidade_de_beeps beeps";
echo "";  # Gera uma linha em branco
echo "Para cancelar e sair do programa, por favor, pressione CTRL + C";
echo "";  # Gera uma linha em branco

numero=1;  # Para acessar o loop while e deixar o software rodando

while [ "$numero" = 1 ]  # Enquanto 'numero' for igual a 1
   do  # faça
      if [ "$dia_alarme" = `date +%d/%m/%G-%H:%M` ]; then  # Se 'dia_alarme' for igual a data e hora atual então...
         echo "$nome_software $versao_software : $mensagem_alarme";
         echo "";  # Gera uma linha em branco

         while [ 1 -le "$quantidade_de_beeps" ]  # Enquanto 1 for menor ou igual a 'quantidade de beeps'
            do  # faça
               echo -n "$quantidade_de_beeps ... ";  # Vai exibindo o numero de beeps
                paplay ./3.ogg;
	      	paplay ./0.ogg;
               sleep 3;  # Aguarda 3 segundos...
               quantidade_de_beeps=`expr $quantidade_de_beeps - 1`;  # Decrementa em 1 a variável 'quantidade_de_beeps'
            done  # concluído

         echo "";  # Gera uma linha em branco
         echo "";  # Gera uma linha em branco
         echo "Obrigado por utilizar o $nome_software $versao_software.";
         echo "$desenvolvedor_software";
         echo "";  # Gera uma linha em branco
         exit;  # Termina/encerra a execução do software
      fi  # fim do comando 'if'

      sleep 20;  # De 20 em 20 segundos, o loop será executado

   done  # concluído
