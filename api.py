import database
import login
import accountManagament
import os

def start():
	fridge = database.db("fridge.db")
	log = login.login
	accounts = accountManagament.accountManagament
	accounts.add_new_account(fridge,"benjamin","clarke","password","admin")

if __name__ == '__main__':
	start()


