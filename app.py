from flask import Flask
from flask_cors import CORS
from sqlalchemy import create_engine

engine = create_engine('postgresql://postgres:postgres@localhost/postgres') 
app = Flask(__name__)
CORS(app)

from view_routes import *
from rest_controller import *

if __name__ == '__main__':
    app.run(debug=True)
