#!/bin/bash
#APP_DIR="/var/www/html"
#sudo mkdir -p $APP_DIR/instancia1 $APP_DIR/instancia2
#sudo cp app/index1.html $APP_DIR/instancia1/index.html
#sudo cp app/index2.html $APP_DIR/instancia2/index.html

#!/bin/bash

set -e
set -u

echo "🚀 Iniciando o deploy..."

# Define o diretório base como o pai da pasta atual
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="${BASE_DIR}/app"
DEST_DIR="/var/www/html"

echo "📁 Diretório atual: $(pwd)"
echo "📂 Verificando pasta de origem: ${APP_DIR}"
ls -l "${APP_DIR}"

# Verifica se os arquivos existem
if [[ -f "${APP_DIR}/index1.html" && -f "${APP_DIR}/index2.html" ]]; then
    echo "📄 Arquivos encontrados, copiando para ${DEST_DIR}..."
  sudo cp "${APP_DIR}/index1.html" "${DEST_DIR}/"
  sudo cp "${APP_DIR}/index2.html" "${DEST_DIR}/"
    echo "✅ Deploy concluído com sucesso."
else
    echo "❌ Um ou mais arquivos não foram encontrados em '${APP_DIR}'."
    exit 1
fi


