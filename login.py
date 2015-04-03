from Crypto.Hash import SHA256
import os

class login:

	def hashPassword(password, salt = generateSalt()):
		hash = SHA256.new()
		hash.update(password.encode('utf-8') + salt)
		return {'password': hash.digest(),'salt':salt};

	def generateSalt():
		return os.urandom(32)