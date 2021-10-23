import flask

app = flask.Flask(__name__)
app.config['DEBUG'] = True

@app.route('/', methods=['GET'])
def home():
    return "<h1>Flask Test</h1>"

@app.route('/api/user', methods=['GET'])
def user():
    return "<h1>This is a user field</h1>"

app.run()