from flask import render_template, redirect

from app import app

# rotas publicas, acessadas apenas pela aplicação

@app.get("/")
def redirect_to_home():
    return redirect('home')

@app.get('/home')
def home():
    return render_template("home.html")


@app.get("/add-order")
def form_order():
    return render_template("form_order.html")


@app.get("/create-report")
def form_report():
    return render_template("form_report.html")