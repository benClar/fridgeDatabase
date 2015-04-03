import login

class accountManagement:

	def add_new_account(database, fname, sname, pw, role):
		password = login.hashPassword(pw)
		acountRole = database.c.execute("SELECT roleID FROM role WHERE \'accountRole\' =" + role)dkjdkjd
		print(accountRole)
		# database.c.execute("INSERT INTO account (surname,forname,salt,password) \
		# 	VALUES (\'" + sname + "\',\'" + fname + "\',\'" + password['salt'] + "\',\'", + password['password'] + "\')")