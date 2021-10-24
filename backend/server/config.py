from bson.objectid import ObjectId
import flask
import datetime
from database import MongodbClient

app = flask.Flask(__name__)
app.config['DEBUG'] = True
client = MongodbClient('localhost', 27017)
uid = ObjectId('6174874509654612d212e150')

@app.route('/', methods=['GET'])
def home():
    return '<h1>Flask Test</h1>'

@app.route('/api/user/add-journal', methods=['POST'])
def add_journals():
    entry = request.data
    # insert gtp3 call here
    client.new_journal(uid, entry, 5, 'summary placeholder')
    return "Placeholder"

@app.route('/api/user/get-journal', methods=['GET'])
def get_journals():
    uid = request.args.get('uid')
    date_str = request.args.get('date')  # ddmmyyyy format
    try:
        date = date.strptime(date_str, '%d%m%Y')
    except:
        date = None
    print(uid)
    print(date_str)
    return "Placeholder"
    

@app.route('/api/user/get-data', methods=['GET'])
def get_user_data():
    uid = request.args.get('uid')
    return "Placeholder"
    

app.run()
