from bson.json_util import loads, dumps
import flask
from datetime import datetime

from MongodbClient import MongodbClient

app = flask.Flask(__name__)
app.config['DEBUG'] = True
client = MongodbClient('localhost', 27017)
# uid = '6174bee2bb92fe76ef46751f'

james_id = client.new_user('James')
john_id = client.new_user('John')
noah_id = client.new_user('Noah')
evan_id = client.new_user('Evan')
client.new_journal(james_id, 'This is a test journal', 3, 'None')
client.new_journal(john_id, 'I like 2 code', 4, 'code')
uid = james_id

@app.route('/api/user/add-journal', methods=['POST'])
def add_journals():
    entry = flask.request.data
    # insert gtp3 call here
    client.new_journal(uid, entry, 5, 'summary placeholder')

@app.route('/api/user/get-journal', methods=['GET'])
def get_journals():
    uid = flask.request.args.get('uid')
    date_str = flask.request.args.get('date')  # ddmmyyyy format
    try:
        date = datetime.strptime(date_str, '%d%m%Y')
    except Exception as e:
        date = None
    cursors = client.get_journals(uid, date)
    journals = []
    for cursor in cursors:
        journal = loads(dumps(cursor))
        journal.pop('_id', None)
        journals.append(journal)
    return flask.jsonify(journals)


@app.route('/api/user/get-data', methods=['GET'])
def get_user_data():
    uid = flask.request.args.get('uid')
    user_data = client.get_user_data(uid)
    user_data.pop('_id', None)
    return flask.jsonify(user_data)

app.run()
