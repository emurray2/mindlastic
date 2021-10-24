from bson.objectid import ObjectId
from pymongo import MongoClient
import datetime
# import GPT3.MindlasticV1 as gpt3
import MindlasticV1 as gpt3

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

    def new_journal(self, uid, text):
        journal = {
            "uid": str(uid),
            "date": datetime.datetime.today().replace(microsecond=0),
            "text": text
            # "sentiment": sentiment,
            # "summary": summary
        }

        sentiment = gpt3.getGPTScore(text)[0]
        journal["sentiment"] = sentiment

        journals = self.db.journals
        journal_id = journals.insert_one(journal).inserted_id
        users = self.db.users
        users.update_one(
            filter={'_id': ObjectId(uid)},
            update= {'$push': {'journal_ids': journal_id} }
        )

    def get_journals(self, uid, date):
        query = {}
        if uid:
            query['uid'] = str(uid)
        if date:
            next_day = date + datetime.timedelta(days=1)
            query['date'] = {'$gte': date, "$lte": next_day}
        return self.db.journals.find(query)
        
    def get_user_data(self, uid):
        return self.db.users.find_one({'_id': ObjectId(uid)})
