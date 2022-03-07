# proton-godot-demo
Example project showing how to interact with Proton chain from GoDot Engine.

Why Proton? - No gas fees, instant transactions, xtokens, WebAuth... the list goes on

	Block Explorer https://protonscan.io
	WebAuth https://webauth.com
	Proton Chain https://protonchain.com
	GoDot Engine https://godotengine.org

![image](https://user-images.githubusercontent.com/12118160/156945966-51d21eca-186c-4119-9f6d-90fad4668c64.png)


Interact with various contracts on Proton

Transfer Token (eosio.token) - See example in ProtonSendTX.gd

	action.account = "eosio.token"
	action.name = "transfer"
	action.data = data
	action.authorization = authorization

Transfer NFT (atomicassets) - See example in ProtonSendAtomicAsset.gd

	action.account = "atomicassets"
	action.name = "transfer"
	action.data = data
	action.authorization = authorization

Environment
  Godot v3.4.3-stable
  Windows 10
  
To Install & Run 

	  1. Open Powershell
	  2. Clone Repo "git clone https://github.com/protonnz/proton-godot-demo.git"
	  3. Change dir "cd proton-godot-demo"
	  4. Launch http-server "npx http-server ."
	  5. Visit local host in Chrome https://localhost:8080

If you don't have nodejs installed

	1. npm install nodejs
	2. npm i -g npx
	3. npx http-server .


Huge thanks to Syed @jafri from Proton!
https://protonchain.com
