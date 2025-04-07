from flask import render_template

from app import app

# rotas publicas, acessadas apenas pela aplicação

@app.route('/')
def hello():
    return render_template("index.html")
