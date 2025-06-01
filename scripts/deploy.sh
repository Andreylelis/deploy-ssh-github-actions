#!/bin/bash
#APP_DIR="/var/www/html"
#sudo mkdir -p $APP_DIR/instancia1 $APP_DIR/instancia2
#sudo cp app/index1.html $APP_DIR/instancia1/index.html
#sudo cp app/index2.html $APP_DIR/instancia2/index.html

#!/bin/bash

set -e  # Faz o script falhar ao primeiro erro
set -u  # Erro se usar variáveis não definidas

echo "🚀 Iniciando o deploy..."

# Exibe o diretório atual
echo "📁 Diretório atual: $(pwd)"
echo "📂 Listando conteúdo da pasta 'app':"
ls -l app/

# Caminho absoluto para garantir que funcione dentro do container
APP_DIR="./app"
DEST_DIR="/var/www/html"  # Altere se necessário

# Verifica se os arquivos existem antes de copiar
if [[ -f "${APP_DIR}/index1.html" && -f "${APP_DIR}/index2.html" ]]; then
    echo "📄 Arquivos encontrados, copiando para ${DEST_DIR}..."
    cp "${APP_DIR}/index1.html" "${DEST_DIR}/"
    cp "${APP_DIR}/index2.html" "${DEST_DIR}/"
    echo "✅ Deploy concluído com sucesso."
else
    echo "❌ Um ou mais arquivos não foram encontrados em '${APP_DIR}'."
    ls -l "${APP_DIR}"
    exit 1
fi


