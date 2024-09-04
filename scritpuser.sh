#!/bin/bash

# Função para mostrar o uso do script
mostrar_uso() {
    echo "Uso: $0 nome_usuario senha_usuario"
    exit 1
}

# Verifica se o usuário forneceu os argumentos necessários
if [ $# -ne 2 ]; then
    mostrar_uso
fi

# Variáveis
NOME_USUARIO=$1
SENHA_USUARIO=$2
DIRETORIO_HOME="/home/$NOME_USUARIO"

# Cria o usuário com diretório home
useradd -m -d $DIRETORIO_HOME -s /bin/bash $NOME_USUARIO

# Verifica se o comando useradd foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao criar o usuário $NOME_USUARIO."
    exit 1
fi

# Define a senha do usuário
echo "$NOME_USUARIO:$SENHA_USUARIO" | chpasswd

# Verifica se o comando chpasswd foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao definir a senha para o usuário $NOME_USUARIO."
    exit 1
fi

# Define permissões e proprietário do diretório home
chown -R $NOME_USUARIO:$NOME_USUARIO $DIRETORIO_HOME
chmod 755 $DIRETORIO_HOME

echo "Usuário $NOME_USUARIO criado com sucesso."

# Como usar:

Dê permissão de execução ao script
chmod +x criar_usuario.sh

Execute o script passando o nome do usuário e a senha como argumentos
sudo ./criar_usuario.sh nome_usuario senha_usuario

Esse script cria um usuário com as seguintes características:

Cria um diretório home (/home/nome_usuario).
Define o shell padrão como /bin/bash.
Define a senha do usuário.
Configura as permissões e o proprietário do diretório home.
Sempre execute scripts que modificam o sistema com cautela e, de preferência, sob supervisão ou em ambientes controlados para evitar problemas de segurança ou configuração.
