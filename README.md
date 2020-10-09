# Enigma

### Description:
Pure Ruby project for encrypting and decrypting messages based on a substitution cipher. Fully tested using Minitest and run through Commmand Line Interface commands. 

### Setup: 
- clone repo locally
  - `git clone git@github.com:sienna-kopf/enigma.git`
- `cd enigma`
- `bundle install` 

### Command Line Interface (CLI) usage: 
``` $ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```

### Running tests:
`rake test` to run full test suite or `ruby test/<test_file_name.rb>` for individual tests

### Tools: 
- Ruby
- MiniTest
- SimpleCov

### Authors: 
[Sienna Kopf](https://github.com/sienna-kopf)
