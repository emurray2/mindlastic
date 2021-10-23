from bson.objectid import ObjectId
import flask

from database.MongodbClient import MongodbClient

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

@app.route('/api/user/get-journal',methods=['GET'])
def get_journals()
    uid = request.args.get('uid')
    data = request.args.get('date')

@app.route('/api/user/get-data', methods=['GET'])
def get_user_Data():
    uid = requests.args.get('uid')
    

app.run()
