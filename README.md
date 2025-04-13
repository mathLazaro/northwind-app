# NORTHWIND APP
Esta aplicação Python implementa os padrões MVC e DAO para interagir com o banco de dados Northwind. Ela permite a inserção de novos pedidos e gera relatórios de pedidos e ranking de funcionários.

## Estrutura do projeto

- templates (view)
- static (view)
- model
- dao
- controller


## Configuração do Ambiente

### Usando `venv` (Virtual Environment)

Na pasta do projeto execute os comandos:

#### Linux / WSL / macOS:

```bash
# 1. Criar um ambiente virtual
python3 -m venv venv

# 2. Ativar o ambiente virtual
source venv/bin/activate

# 3. Instalar as dependências
pip install -r requirements.txt
```

#### Windows (CMD ou PowerShell):

```cmd
:: 1. Criar um ambiente virtual
python -m venv venv

:: 2. Ativar o ambiente virtual
venv\Scripts\activate

:: 3. Instalar as dependências
pip install -r requirements.txt
```

---
