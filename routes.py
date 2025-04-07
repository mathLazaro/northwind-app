from app import app

@app.route('/')
def hello():
    return ['teste', 'teste2']


@app.route('/teste')
def teste():
    return ['teste']


@app.route('/aa')
def aa():
    return ['teaaaste']