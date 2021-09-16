import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:hex/hex.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EthereumUtils {
  static late String abiPath;
  static late String contractName;
  static late var contractInfo;
  static late String address;

  EthereumUtils.initiate(contract) {
    contractName = contract;
    abiPath = "build/contracts/$contractName.json";
  }

  static Web3Client client = Web3Client(
      "https://rinkeby.infura.io/v3/" + env['INFURA_API_KEY'].toString(),
      http.Client());

  static Future<DeployedContract> generateContract() {
    Completer<DeployedContract> completer = Completer();

    rootBundle.loadString(abiPath).then((abi) async {
      String address = json.decode(abi)['networks']['4']['address'];
      print("ADDRESS $address");
      print('ABI: $abi');

      DeployedContract contract = DeployedContract(
          ContractAbi.fromJson(abi, contractName),
          EthereumAddress.fromHex(address));
      completer.complete(contract);
    });

    return completer.future;
  }

  static Future<String> sendInformationToContract(
      String privateKey, String action, List parameters) async {
    Completer<String> completer = Completer();
    DeployedContract contract = await generateContract();
    Credentials credentials = getCredentials(privateKey);
    credentials.extractAddress();
//    print(contract.functions);
    ContractFunction function = contract.function(action);

    await client
        .sendTransaction(
            credentials,
            Transaction.callContract(
                contract: contract,
                function: function,
                maxGas: 500000,
                parameters: parameters),
            chainId: 4)
        .then((hash) {
      completer.complete(hash);
    });
    return completer.future;
  }

  static Future<List> getInformationFromContract(
      privateKey, action, arguments) async {
    DeployedContract contract = await generateContract();
    ContractFunction function = contract.function(action);
    Credentials credentials = getCredentials(privateKey);
    List information = await client.call(
        sender: await credentials.extractAddress(),
        contract: contract,
        function: function,
        params: arguments);
    return information;
  }

  static Future<EthereumAddress> getPublicKey(pvteKey) async {
    EthereumAddress pubKey =
        await EthereumUtils.getCredentials(pvteKey).extractAddress();

    return pubKey;
  }

  // You can create Credentials from private keys
  static Credentials getCredentials(privKey) {
    Credentials credentials = EthPrivateKey.fromHex(privKey);
    return credentials;
  }
  //// In either way, the library can derive the public key and the address
//// from a private key:
//  var address = await credentials.extractAddress();
//  print(address.hex);
//

  static Future<HashMap> createWallet() async {
    var rng = Random.secure();
    EthPrivateKey creds = EthPrivateKey.createRandom(rng);
    Wallet wallet = Wallet.createNew(creds, "senhasupersecreta", rng);
    var address = await creds.extractAddress();
    var add = EthereumAddress.fromHex(address.toString());
    String ppk = HEX.encode(wallet.privateKey.privateKey);
    HashMap obj = HashMap();
    obj['privKey'] = ppk;
    obj['pubKey'] = add;
    return obj;
  }
}
