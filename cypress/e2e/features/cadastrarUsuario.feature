# language: pt

Funcionalidade: Registrar usuário
Como uma pessoa qualquer
Desejo me cadastrar no sistema
Para conseguir avaliar filmes

Contexto: Cadastro de usuário
  Dado que acessei a funcionalidade de cadastro

Esquema do Cenário: Deve ser possível cadastrar usuário informando qualquer tipo de nome
  Quando informar o nome "<nome>"
  E informar um e-mail
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei a mensagem de sucesso "Cadastro realizado!"
  E o usuário será cadastrado como tipo comum
  Exemplos:
  | nome  |
  | Alana |
  | @l@n@ |
  |   A   |
  |  ...  |
  | 12345 |
  | #$*!% |
  | 😃🤪 |

Esquema do Cenário: Não é possível cadastrar usuário informando nome com mais de 100 dígitos
  Quando informar o nome "<nome>"
  E informar um e-mail
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei a mensagem de erro "Não foi possível cadastrar o usuário."
  E o cadastro não será efetuado
  Exemplos:
  | nome  |
  | NomeComMaisDe100DigitosNomeComMaisDe100DigitosNomeComMaisDe100DigitosNomeComMaisDe100DigitosNomeComMais |

Cenário: Não deve ser possível cadastrar usuário sem informar um nome
  Quando informar um e-mail
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei o alerta "Informe o nome"
  E o cadastro não será concluído

Cenário: Não deve ser possível cadastrar usuário sem informar um e-mail
  Quando informar um nome 
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei o alerta "Informe o e-mail"
  E o cadastro não será concluído

Cenário: Não deve ser possível cadastrar usuário sem informar uma senha
  Quando informar um nome 
  E informar um e-mail
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei o alerta "Informe a senhaAs senhas devem ser iguais."
  E o cadastro não será concluído
  
Cenário: Não deve ser possível cadastrar usuário sem informar a confirmação de senha
  Quando informar um nome 
  E informar um e-mail
  E informar uma senha
  E confirmar a operação
  Então visualizarei o alerta "Informe a senha"
  E o cadastro não será concluído
    
Cenário: Não deve ser possível cadastrar usuário sem informar os campos obrigatórios
  Quando confirmar a operação
  Então visualizarei os alertas de campos obrigatórios
  E o cadastro não será concluído
    
Cenário: Não deve ser possível cadastrar usuário se os campos "Senha" e "Confirmar senha" forem diferentes
  Quando informar um nome
  E informar um e-mail
  E informar uma senha
  E informar a confirmação de senha incorretamente
  E confirmar a operação
  Então visualizarei o alerta "As senhas devem ser iguais."
  E o cadastro não será concluído

Esquema do Cenário: Não deve ser possível cadastrar usuário se a senha não tiver entre 6 e 12 caracteres
  Quando informar um nome
  E informar um e-mail
  E informar uma senha "<senha>" e confirma-la
  E confirmar a operação
  Então visualizarei o alerta de quantidade de caracteres "<alerta>"
  E o cadastro não será concluído
  Exemplos:
  |     senha     |                 alerta                 |
  |     ABCDE     | A senha deve ter pelo menos 6 dígitos. |
  | ABCDEFGHIJKLM | A senha deve ter no máximo 12 dígitos. | 

Esquema do Cenário: Não deve ser possível cadastrar usuário informando um e-mail fora do padrão 
  Quando informar um nome
  E informar um e-mail fora do padrão "<email>"
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei a mensagem de erro "Não foi possível cadastrar o usuário."
  E a operação não será concluída
  Exemplos:
  |   email   |
  |   alana@  |
  | alana.com |
  |     @     |
  |   @.com   |

Cenário: Deve ocorrer erro quando o e-mail já estiver em uso
  Dado que existe um usuário cadastrado
  Quando informar um nome
  E informar o mesmo email usado pelo outro usuário
  E informar uma senha
  E informar a confirmação de senha
  E confirmar a operação
  Então visualizarei a mensagem de erro "E-mail já cadastrado. Utilize outro e-mail"
  E o registro não será concluído

Cenário: Todo usuário é logado automaticamente após cadastro
  Quando informar nome, email, senha e confirmar operação corretamente
  Então visualizarei a mensagem de sucesso "Cadastro realizado!"
  E o usuário será autenticado no sistema automaticamente

Cenário: Todo usuário é criado com o tipo 0 (comum)
  Quando informar nome, email, senha e confirmar operação corretamente
  Então visualizarei a mensagem de sucesso "Cadastro realizado!"
  E o usuário será cadastrado como tipo comum

Cenário: Usuário tipo 1 é Administrador
  Dado que existe um usuário administrador cadastrado no sistema
  Quando fizer login
  E acessar a opção Gerenciar Conta
  Então verificarei o tipo "1" de usuário "Administrador"
  
Cenário: Usuário tipo 2 é Crítico
  Dado que existe um usuário crítico cadastrado no sistema
  Quando fizer login
  E acessar a opção Gerenciar Conta
  Então verificarei o tipo "2" de usuário "Crítico"