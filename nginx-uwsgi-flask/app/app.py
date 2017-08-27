import os
from flask import Flask, abort, request, jsonify
app = Flask(__name__)


@app.route("/")
def main():
    return "Hello world!"


@app.route("/read")
def read():
    with open(
            os.path.join(os.path.dirname(__file__), '../test.json')) as reader:
        json_text = reader.read()
        return json_text

    abort(500)


@app.route("/write/<filename>", methods=['POST'])
def write(filename):
    with open(
            os.path.join(
                os.path.dirname(__file__),
                '../data/{filename}.json'.format(filename=filename)),
            'w') as writer:
        writer.write(request.data.decode('utf-8'))

    # return jsonify(success=True)
    return ''
