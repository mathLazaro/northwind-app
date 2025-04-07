from flask import Flask

app = Flask(__name__)

from public_routes import *
from private_routes import *

if __name__ == '__main__':
    app.run(debug=True)
