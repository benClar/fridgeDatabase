import sqlite3

class db:

	def __init__(self, database):
		self._fridgeConnection = sqlite3.connect(database)
		self.c = self._fridgeConnection.cursor()