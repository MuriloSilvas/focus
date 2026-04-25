# 📋 Focus — Task Manager

> Aplicativo de gerenciamento de tarefas com interface moderna, banco de dados local e exportação para Excel e PDF.

Desenvolvido por **Murilo Silva**

---

## ✨ Funcionalidades

- ✅ Adicionar, editar e excluir tarefas
- ✅ Marcar tarefas como concluídas
- ✅ Prioridades: Alta, Média e Baixa
- ✅ Categorias: Geral, Trabalho, Pessoal, Compras, Saúde e Estudos
- ✅ Data de prazo com alertas de vencimento
- ✅ Barra de progresso em tempo real
- ✅ Busca e filtros avançados
- ✅ Ordenação por nome, data ou prioridade
- ✅ Exportar para Excel (.xlsx) com formatação profissional
- ✅ Exportar para PDF com tabela colorida
- ✅ Backup automático semanal em JSON
- ✅ Dados salvos localmente no banco SQLite
- ✅ Interface dark com tema azul profundo

---

## 🖥️ Compatibilidade

| Sistema | Suporte |
|---------|---------|
| macOS   | ✅ |
| Windows | ✅ |
| Linux   | ✅ |

---

## 🚀 Como instalar

### Pré-requisitos

- [Python 3.10+](https://www.python.org/downloads/)
  - No Windows: marque **"Add Python to PATH"** durante a instalação

### macOS

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/focus.git
cd focus

# 2. Execute o instalador
chmod +x install_mac.sh
./install_mac.sh

# 3. Abra o app com dois cliques em Focus.command
```

### Windows

```
1. Clone ou baixe o repositório
2. Dê dois cliques em install_windows.bat
3. Abra o app pelo atalho criado na Área de Trabalho
```

### Manual (Mac, Windows e Linux)

```bash
# Instale as dependências
pip install customtkinter openpyxl fpdf2 pillow

# Execute o app
python myapp.py
```

---

## 📦 Dependências

| Biblioteca | Uso |
|------------|-----|
| [customtkinter](https://github.com/TomSchimansky/CustomTkinter) | Interface gráfica moderna |
| [openpyxl](https://openpyxl.readthedocs.io/) | Exportação para Excel |
| [fpdf2](https://pyfpdf.github.io/fpdf2/) | Exportação para PDF |
| [pillow](https://python-pillow.org/) | Processamento de imagens |

---

## 📁 Estrutura do projeto

```
focus/
├── myapp.py              # Código principal
├── install_mac.sh        # Instalador para macOS
├── install_windows.bat   # Instalador para Windows
├── requirements.txt      # Dependências Python
├── icon.iconset/         # Ícones do app
│   ├── icon_16x16.png
│   ├── icon_32x32.png
│   ├── icon_128x128.png
│   ├── icon_256x256.png
│   └── icon_512x512.png
├── icon.icns             # Ícone macOS
└── README.md             # Este arquivo
```

---

## 📸 Screenshots

> Interface dark com tema azul profundo, barra de progresso, filtros por categoria e alertas de prazo.

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<p align="center">Feito com dedicação por <strong>Murilo Silva</strong></p>
