# proton-godot-demo
Example project showing how to interact with Proton chain from GoDot Engine.

Interact with various contracts on Proton

Transfer Token (eosio.token)

	action.account = "eosio.token"
	action.name = "transfer"
	action.data = data
	action.authorization = authorization

Transfer NFT (atomicassets)

	action.account = "atomicassets"
	action.name = "transfer"
	action.data = data
	action.authorization = authorization

Environment
  Godot v3.4.3-stable
  Windows 10
  
To Install & Run 

  1. Open Powershell
  2. Clone Repo 'git clone https://github.com/protonnz/proton-godot-demo.git'
  3. Change dir 'cd proton-godot-demo'
  4. Launch http-server 'npx http-server .'
  5. Visit local host in Chrome https://localhost:8080


Huge thanks to Syed from Proton!
https://protonchain.com
