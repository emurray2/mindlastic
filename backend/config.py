from bson.json_util import loads, dumps
import flask
from datetime import datetime

from MongodbClient import MongodbClient

app = flask.Flask(__name__)
app.config['DEBUG'] = True
# uid = '6174bee2bb92fe76ef46751f'


@app.route('/api/user/add-journal', methods=['POST'])
def add_journals():
    entry = flask.request.json['text']
    print(f'[/add-journal]: {entry}')
    # insert gtp3 call here
    id = client.new_journal(uid, entry)
    # todo: return id
    return flask.jsonify({'status': 'success'})


@app.route('/api/user/get-journal', methods=['GET'])
def get_journals():
    uid = flask.request.args.get('uid')
    date_str = flask.request.args.get('date')  # ddmmyyyy format
    try:
        date = datetime.strptime(date_str, '%d%m%Y').isoformat()
    except Exception as e:
        date = None
    cursors = client.get_journals(uid, date)
    journals = []
    for cursor in cursors:
        journal = loads(dumps(cursor))
        journal.pop('_id', None)
        #journal.pop('date', None)
        journals.append(journal)
    print(journals)
    return flask.jsonify(journals)


@app.route('/api/user/get-data', methods=['GET'])
def get_user_data():
    uid = flask.request.args.get('uid')
    user_data = client.get_user_data(uid)
    user_data.pop('_id', None)
    return flask.jsonify(user_data)

# app.run(host="0.0.0.0", port=443, ssl_context=('/etc/letsencrypt/live/hackgt.garrepi.dev/fullchain.pem', '/etc/letsencrypt/live/hackgt.garrepi.dev/privkey.pem'))

if __name__ == '__main__':
    client = MongodbClient('localhost', 27017)
    james_id = client.new_user('James')
    john_id = client.new_user('John')
    noah_id = client.new_user('Noah')
    evan_id = client.new_user('Evan')
    client.new_journal(james_id, 'This is a test journal')
    client.new_journal(john_id, 'I like to code')
    uid = james_id
    app.run()
