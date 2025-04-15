# NORTHWIND APP

Esta aplicação Python implementa os padrões MVC e DAO para interagir com o banco de dados Northwind. Ela permite a inserção de novos pedidos e gera relatórios de pedidos e ranking de funcionários.

## Injection

Para testar SQL Injection, selecione a query maliciosa no arquivo `injection.sql` e cole no campo `País de Entrega` no formulário.

## Estrutura do projeto

O projeto foi implementado na arquitetura MVC com a separação do módulo de acesso ao banco de dados no Dao:

- templates (view)
- static (view)
- model
- dao -> driver | orm
- rest_controller (controller) -> controla os endpoints do backend
- view_controller (controller) -> controla os endpoints do frontend


## Configuração do Ambiente

### Configuração do banco de dados

Para correta integração com a aplicação crie um banco de dados com o nome, usuário e senha `postgres` na porta padrão do postgres 5432. Posteriormente, restaure o backup `northwind.sql` no banco criado.

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
