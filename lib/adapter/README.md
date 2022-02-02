# DRAFT

# File encrypter script

```ruby
encrypter = Encrypter.new("secret")
reader = reader = File.open("./lib/adapter/message.txt")
writer = File.open("./lib/adapter/message.encrypted.txt", "w")
encrypter.encrypt(reader, writer)
```

# StringIoAdapter script

```ruby
encrypter = Encrypter.new("secret")
reader = StringIOAdapter.new("test")
writer = File.open("./lib/adapter/message.encrypted.txt", "w")
encrypter.encrypt(reader, writer)
```