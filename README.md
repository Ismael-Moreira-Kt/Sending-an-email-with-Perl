## Declarar  o caminho para o binário do Perl
```perl
	#!/usr/bin/perl
```



## Declarar imports
```perl
	use strict;
	use warnings;
	use Email::MIME;
	use Email::Sender::Simple qw(sendmail);
```
- Strict -> Impõe que o programa tenha todas as variáveis declaradas antes de serem usadas, que todas as referências simbólicas (% & @) sejam válidas e evita que sejam declaradas variáveis globais diretamente em funções a menos que seja extremamente necessário.
- Warnings -> Trata todas as exceções e erros mostrados durante a execução do código. 
- Email::MIME -> É um módulo para simplificar o tratamento de emails em Perl. Com ela podemos não só enviar emails como tratar emails recebidos, tratando e removendo as partes que nos interessam.
- Email::Sender::Simple qw(sendmail) -> Serve para importar a função sendmail do módulo Email::Sender::Simple. 
	- sendmail -> Simplifica o envio de email para um ou mais destinatários.



### Criar o Email
#### Cabeçalho do Email
```perl
	my $message = Email::MIME->create(
		header_str => [
			From => 'ismael@exemplo.com',
			To => 'maria@exemplo.com',
			Subject => 'Olá! :)',
		],
```
- $message -> É a variável objeto que guarda todas as informações sobre o email.
- Email::MIME->Create -> É um método da classe Email::MIME que serve para criar novos emails. 
- header_str -> É um atributo do objeto $message, guarda as informações necessárias para preencher o cabeçalho do email como:
	- From: o seu email;
	- To: o email da pessoa que vai receber o email;
	- Subject: o assunto do email;


#### Atributos do Email
```perl
		attributes => {
			encoding => 'quoted-printable',
			charset => 'ISO-8859-1',
		},
```
-  Atributes -> Outro atributo do objeto $message, guarda as informações extras que vão definir como o email é mostrado:
	- Encoding: especifica o tipo de código que deve ser usado para codificar a mensagem;
	- Charset: especifica o conjunto de caracteres que deve ser utilizado no email;
- quoted-printable -> De forma extremamente simplificada, o objetivo é garantir que o texto seja enviado sem ser corrompido. Ele converte códigos ASCII superiores a 127 são substituídos por outra sequência de caracteres. "á" que tem um código de 255 viraria "=E1".
- ISO-8859-1 -> Mais uma vez, de forma rasa, é um tipo de codificação de 8 bits que engloba os caracteres da maioria das linguagens de origem europeia. Ele contem todo o conjunto básico de 7 bits, ou seja de código ASCII 0-127, acentuação, pontuação e símbolos monetários.


#### Corpo do Email
```perl
		body_str => "Como estás? Tudo bem?\n",
	);
```
- Body_str -> O atríbuto do objeto $message responsável por guardar o corpo da mensagem. 



### Enviar Email
```perl
	sendmail($message);
```
- Utiliza a função sendmail importada do módulo Email::Sender::Simple para enviar a mensagem guardada na variável $message.