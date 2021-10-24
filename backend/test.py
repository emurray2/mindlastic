from pymongo import MongoClient

client = MongoClient('0.0.0.0', 27017)
server_info = client.server_info()
print (server_info)
