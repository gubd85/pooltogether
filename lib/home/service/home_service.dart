import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/model/prize_distribution_buffer.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:wallet_connect/wallet_connect.dart';

class HomeService {
  var urlMainNet =
      "https://mainnet.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161";
  var urWslMainNet =
      "ws://mainnet.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161";
  late Web3Client _client;
  late String _abiCode;
  late EthereumAddress _contractAddress;
  late DeployedContract _deployedContract;
  late ContractFunction _newestDraw;

  var contractBufferMainNet = "0xf025a8d9E6080F885e841C8cC0E324368D7C6577";

  static var httpClient = http.Client();

  Future<void> initialSetUp() async {
    _client = Web3Client(urlMainNet, http.Client(), socketConnector: () {
      return IOWebSocketChannel.connect(urWslMainNet).cast<String>();
    });

    getEthereumContractAddress();
    await getLocalAbi();
  }

  getEthereumContractAddress() async {
    _contractAddress = EthereumAddress.fromHex(contractBufferMainNet);
  }

  Future<void> getLocalAbi() async {
    final String response = await rootBundle
        .loadString('assets/abi_prize_distribution_buffer.json');

    _abiCode = response;
    getDeployedContract();
  }

  Future<void> getAbiOnline() async {
    final queryParameters = {
      'module': 'contract',
      'action': 'getabi',
      'address': contractBufferMainNet
    };

    var url = Uri.https("api.etherscan.io", "/api", queryParameters);
    var response = await httpClient.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      _abiCode = json["result"];

      getDeployedContract();
    }
  }

  Future<void> getDeployedContract() async {
    var contractAbi = ContractAbi.fromJson(_abiCode, "PrizeDistributionBuffer");
    _deployedContract = DeployedContract(contractAbi, _contractAddress);
    _newestDraw = _deployedContract.function("getNewestPrizeDistribution");
  }

  Future<PrizeDistributionBuffer> getNewestDraw() async {
    var prizeDistribution = PrizeDistributionBuffer();

    var response = await _client
        .call(contract: _deployedContract, function: _newestDraw, params: []);

    prizeDistribution.bitRangeSize = response[0][0];
    prizeDistribution.matchCardinality = response[0][1];
    prizeDistribution.startTimestampOffset = response[0][2];
    prizeDistribution.endTimestampOffset = response[0][3];
    prizeDistribution.maxPicksPerUser = response[0][4];
    prizeDistribution.expiryDuration = response[0][5];
    prizeDistribution.numberOfPicks = response[0][6];
    prizeDistribution.prize = response[0][8];
    prizeDistribution.drawNumber = response[1];

    return prizeDistribution;
  }

  connectWallet() {
    final wcClient = WCClient(
      onConnect: () {
        // Respond to connect callback
        print("wcClient");
      },
      onDisconnect: (code, reason) {
        // Respond to disconnect callback

        print("onDisconnect: $code + $reason");
      },
      onFailure: (error) {
        print("onFailure: $error");
        // Respond to connection failure callback
      },
      onSessionRequest: (id, peerMeta) {
        print("onSessionRequest: $peerMeta");
        // Respond to connection request callback
      },
      onEthSign: (id, message) {
        print("onSessionRequest: $message");
        // Respond to personal_sign or eth_sign or eth_signTypedData request callback
      },
      onEthSendTransaction: (id, tx) {
        print("onSessionRequest: $tx");
        // Respond to eth_sendTransaction request callback
      },
      onEthSignTransaction: (id, tx) {
        print("onSessionRequest: $tx");
        // Respond to eth_signTransaction request callback
      },
    );

    final session = WCSession.from("wcUri");

    final peerMeta = WCPeerMeta(
      name: 'WalletConnect',
      url: 'https://walletconnect.org',
      description: 'WalletConnect Developer App',
      icons: [
        'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
      ],
    );

    wcClient.connectNewSession(session: session, peerMeta: peerMeta);

    wcClient.approveSession(
      accounts: [], // account addresses
      chainId: 1, // chain id
    );
  }
}
