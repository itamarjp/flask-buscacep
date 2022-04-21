import os
import uuid

from flask import Flask, jsonify
from pycep import PyCep

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


@app.route('/cep/<numerocep>')
def busca_cep(numerocep):
        cep = PyCep(numerocep)
        return jsonify(cep.dadosCep)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)

