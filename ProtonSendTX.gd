extends Node

func _on_Button_Scene_pressed():
	get_tree().change_scene("res://ProtonSendAtomicAsset.tscn")

func _on_Button_Login_pressed():
	# Get the `window.ProtonWebSDK` JavaScript object.
	var endpoints = JavaScript.create_object("Array", 1)
	endpoints[0] = "https://proton.greymass.com"
	
	var transportOptions = JavaScript.create_object("Object")
	transportOptions.requestAccount = "glbdex"
		
	var linkOptions = JavaScript.create_object("Object")
	linkOptions.endpoints = endpoints
	
	var options = JavaScript.create_object("Object")
	options.linkOptions = linkOptions
	options.transportOptions = transportOptions
	
	JavaScript.create_object("ProtonWebSDK", options).then(_permission_callback)
	
	
# Here create a reference to the functions (below).
# This reference will be kept until the node is freed.
var _permission_callback = JavaScript.create_callback(self, "_on_permissions")
var _accountdata_callback = JavaScript.create_callback(self, "_on_accountdata")
var _txsuccess_callback = JavaScript.create_callback(self, "_on_txsuccess")
var sessiondata

func _on_permissions(args):
	var obj = args[0]
	var link = obj.link
	var session = obj.session
	print(session.auth.actor)
	getAccountData(link, session)
	sessiondata = session
#	transfer(session)
	
func getAccountData(link, session):
	var params = JavaScript.create_object("Object")
	params.code = "eosio.proton"
	params.scope = "eosio.proton"
	params.table = "usersinfo"
	params.key_type = "i64"
	params.lower_bound = session.auth.actor
	params.upper_bound = session.auth.actor
	params.index_position = 1
	params.limit = 1
	
	link.client.get_table_rows(params).then(_accountdata_callback)
	
func _on_accountdata(args):
	var rows = args[0].rows
	var row = rows[0]
	print("Acc: ", row.acc)
	print("Name: ", row.name)
	print("Avatar: ", row.avatar)
	$Account.text = row.acc
	$Name.text = row.name
	$Avatar.text = row.avatar
	
func transfer():
	var session = sessiondata
	var data = JavaScript.create_object("Object")
	data.from = session.auth.actor
	data.to = $To.text
	var amount = $Amount.text
	#Need to work on formatting, percision should be 0.0000
	var quantity = amount
	data.quantity = str(quantity) + " XPR"
	data.memo = $Memo.text
	
	var authorization = JavaScript.create_object("Array", 1)
	authorization[0] = session.auth
	
	var action = JavaScript.create_object("Object")
	action.account = "eosio.token"
	action.name = "transfer"
	action.data = data
	action.authorization = authorization
	
	var actions = JavaScript.create_object("Array", 1)
	actions[0] = action
	
	var transactOptions = JavaScript.create_object("Object")
	transactOptions.actions = actions
	
	var txOptions = JavaScript.create_object("Object")
	txOptions.broadcast = true
	
	session.transact(transactOptions, txOptions).then(_txsuccess_callback)
	
func _on_txsuccess(args):
	var tx_id = args[0].processed.id
	print(tx_id)
	setTXResponse(tx_id)
	$ProtonAnimated/AnimationPlayer.play("Animation")
	
func setTXResponse(tx_id):
	$TX_ID.text = str(tx_id)
