from bson.objectid import ObjectId
from pymongo import MongoClient
from datetime import datetime

class MongodbClient:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.db = MongoClient(host, port)["mindlastic"]

    def new_user(self, name=None):
        users = self.db.users
        user = {
            "name": name,
            "journal_ids": []
        }

        result = users.insert_one(user)
        return result.inserted_id

    def new_journal(self, uid, text, sentiment, summary):
        journal = {
            "uid": uid,
            "time": datetime.today().replace(microsecond=0),
            "text": text,
            "sentiment": sentiment,
            "summary": summary
        }

        journals = self.db.journals
        journal_id = journals.insert_one(journal).inserted_id
        users = self.db.users
        users.update_one(
            filter={'_id': ObjectId(uid)},
            update= {'$push': {'journal_ids': journal_id} }
        )

    def get_journals(self, uid, date):
        return self.db.journals.find( {
            'uid': uid,

        }
        )

    def get_udata(self, uid):
        return self.db.users.find_one({'_uid': ObjectId(uid)})

# client = MongodbClient("localhost", 27017)
# uid = client.new_user('James')
# client.new_journal(uid, "hello", 5, "hi")

