# 📋 Focus — Task Manager

> Aplicativo de gerenciamento de tarefas com interface moderna, banco de dados local e exportação para Excel e PDF.

Desenvolvido por **Murilo Silva**

---

## ✨ Funcionalidades

- ✅ Adicionar, editar e excluir tarefas
- ✅ Marcar tarefas como concluídas
- ✅ Prioridades: Alta, Média e Baixa
- ✅ Categorias: Geral, Trabalho, Pessoal, Compras, Saúde e Estudos
- ✅ Data de prazo com alertas visuais (borda vermelha = vencida, amarela = vence hoje)
- ✅ Notificação automática ao abrir o app sobre tarefas vencidas
- ✅ Barra de progresso em tempo real (% de tarefas concluídas)
- ✅ Contadores de Pendentes, Concluídas e Vencidas no header
- ✅ Busca em tempo real por nome
- ✅ Filtros por status, prioridade, categoria e prazo
- ✅ Ordenação por nome, data ou prioridade
- ✅ Exportar para Excel (.xlsx) com formatação profissional
- ✅ Exportar para PDF com tabela colorida
- ✅ Backup automático semanal em JSON (pasta `backups/`)
- ✅ Backup manual em qualquer momento
- ✅ Dados salvos localmente no banco SQLite
- ✅ Interface dark com tema azul profundo
- ✅ Ícone personalizado no Mac e Windows

---

## 🖥️ Compatibilidade

| Sistema | Suporte |
|---------|---------|
| macOS   | ✅ |
| Windows | ✅ |
| Linux   | ✅ (manual) |

---

## 🚀 Como instalar

### Pré-requisitos

- [Python 3.10+](https://www.python.org/downloads/)
  - No Windows: marque **"Add Python to PATH"** durante a instalação

### Baixar o projeto

**Opção A — pelo terminal:**
```bash
git clone https://github.com/MuriloSilvas/focus.git
cd focus
```

**Opção B — pelo GitHub:**
1. Clique no botão verde **Code** → **Download ZIP**
2. Extraia a pasta em qualquer lugar do seu computador

---

### macOS

```bash
# 1. Dentro da pasta do projeto, execute o instalador
chmod +x install_mac.sh
./install_mac.sh

# 2. Abra o app com dois cliques em Focus.command
```

> O instalador instala as dependências automaticamente e cria o `Focus.command` com ícone personalizado.

---

### Windows

1. Clique com botão direito em `install_windows.bat`
2. Selecione **Executar como administrador**
3. Aguarde a instalação das dependências
4. Abra o app pelo atalho **Focus** criado na Área de Trabalho

> O instalador instala as dependências, cria o atalho com ícone na Área de Trabalho e configura o app para abrir sem janela de terminal.

---

### Linux (manual)

```bash
pip install customtkinter openpyxl fpdf2 pillow
python myapp.py
```

---

## 📁 Estrutura do projeto

```
focus/
├── myapp.py                  # Código principal do app
├── install_mac.sh            # Instalador para macOS
├── install_windows.bat       # Instalador para Windows
├── requirements.txt          # Dependências Python
├── icon.ico                  # Ícone para Windows
├── icon.icns                 # Ícone para macOS
├── icon.iconset/             # Ícones em vários tamanhos
│   ├── icon_16x16.png
│   ├── icon_32x32.png
│   ├── icon_128x128.png
│   ├── icon_256x256.png
│   └── icon_512x512.png
├── LICENSE                   # Licença MIT
└── README.md                 # Este arquivo
```

> O banco de dados `tasks.db` e a pasta `backups/` são criados automaticamente na primeira execução.

---

## 📦 Dependências

| Biblioteca | Uso |
|------------|-----|
| [customtkinter](https://github.com/TomSchimansky/CustomTkinter) | Interface gráfica moderna |
| [openpyxl](https://openpyxl.readthedocs.io/) | Exportação para Excel |
| [fpdf2](https://pyfpdf.github.io/fpdf2/) | Exportação para PDF |
| [pillow](https://python-pillow.org/) | Processamento de imagens e ícones |

---

## ❓ Problemas comuns

**No Mac — app não abre com dois cliques:**
```bash
xattr -cr Focus.command
chmod +x Focus.command
```

**No Windows — instalador não roda:**
- Clique com botão direito → **Executar como administrador**
- Certifique-se de que o Python está instalado com a opção **"Add Python to PATH"** marcada

**Dependências não instaladas:**
```bash
pip install -r requirements.txt
```

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<p align="center">Feito com dedicação por <strong>Murilo Silva</strong></p>
