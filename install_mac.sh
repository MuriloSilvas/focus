#!/bin/bash

echo ""
echo "╔══════════════════════════════════════╗"
echo "║        Focus — Instalador Mac        ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Verifica Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 não encontrado."
    echo "   Instale em: https://www.python.org/downloads/"
    exit 1
fi

echo "✅ Python encontrado: $(python3 --version)"
echo ""
echo "📦 Instalando dependências..."
pip3 install customtkinter openpyxl fpdf2 pillow --quiet

if [ $? -ne 0 ]; then
    echo "❌ Erro ao instalar dependências."
    exit 1
fi

echo "✅ Dependências instaladas!"
echo ""

# Diretório do script
DIR="$(cd "$(dirname "$0")" && pwd)"

# Cria o launcher
LAUNCHER="$DIR/Focus.command"
cat > "$LAUNCHER" << EOF
#!/bin/bash
cd "$DIR"
nohup /usr/local/bin/python3 "$DIR/myapp.py" > /dev/null 2>&1 &
EOF

chmod +x "$LAUNCHER"
xattr -cr "$LAUNCHER"

# Aplica ícone se fileicon estiver instalado
if command -v fileicon &> /dev/null && [ -f "$DIR/icon.iconset/icon_512x512.png" ]; then
    fileicon set "$LAUNCHER" "$DIR/icon.iconset/icon_512x512.png"
    echo "✅ Ícone aplicado!"
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Instalação concluída com sucesso!  ║"
echo "║                                      ║"
echo "║   Abra o app com dois cliques em:    ║"
echo "║   Focus.command                      ║"
echo "╚══════════════════════════════════════╝"
echo ""
