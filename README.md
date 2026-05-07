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
- ✅ Interface clara com tema moderno
- ✅ Ícone personalizado no Mac e Windows

---

## 🖥️ Compatibilidade

| Sistema | Suporte |
| --- | --- |
| macOS | ✅ |
| Windows | ✅ |
| Linux | ✅ (manual) |

---

## 🚀 Como instalar

### Pré-requisitos

> Nenhum! Os instaladores para Windows e macOS já instalam tudo automaticamente (incluindo Python e dependências).
> Linux: requer Python 3.10+ instalado manualmente.

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
