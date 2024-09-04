#!/bin/bash

# Função para mostrar o uso do script
mostrar_uso() {
    echo "Uso: $0 nome_grupo nome_diretorio"
    exit 1
}

# Verifica se o usuário forneceu os argumentos necessários
if [ $# -ne 2 ]; then
    mostrar_uso
fi

# Variáveis
NOME_GRUPO=$1
NOME_DIRETORIO=$2

# Cria o grupo
groupadd $NOME_GRUPO

# Verifica se o comando groupadd foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao criar o grupo $NOME_GRUPO."
    exit 1
fi

# Cria o diretório
mkdir -p $NOME_DIRETORIO

# Verifica se o comando mkdir foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao criar o diretório $NOME_DIRETORIO."
    exit 1
fi

# Define o grupo como proprietário do diretório
chown :$NOME_GRUPO $NOME_DIRETORIO

# Verifica se o comando chown foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao definir o grupo $NOME_GRUPO como proprietário do diretório $NOME_DIRETORIO."
    exit 1
fi

# Define as permissões do diretório
chmod 770 $NOME_DIRETORIO

# Verifica se o comando chmod foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao definir as permissões do diretório $NOME_DIRETORIO."
    exit 1
fi

echo "Grupo $NOME_GRUPO e diretório $NOME_DIRETORIO criados com sucesso."

# O que o script faz:
Cria um grupo com o nome fornecido.
Cria um diretório no caminho especificado.
Define o grupo como proprietário do diretório.
Configura permissões para que o grupo tenha leitura, escrita e execução no diretório (770).
