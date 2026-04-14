import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, dynamic>> coins = const[
    {"name": "Bitcoin", "symbol": "BTC", "price": "64,230", "change": "+2.5%"},
    {"name": "Ethereum", "symbol": "ETH", "price": "3,450", "change": "-1.2%"},
    {"name": "Solana", "symbol": "SOL", "price": "145", "change": "+5.8%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},
    {"name": "Dogecon", "symbol": "DOGE", "price": "0.16", "change": "+10.2%"},

  ];
  double myBalance = 48560.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text("Welcome Back",style: TextStyle(color: Colors.white54,fontSize: 16),),
              const Text("Developer",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              _buildBalanceCard(),
              const SizedBox(height: 30,),
              TextButton(onPressed: (){
                setState(() {
                  myBalance += 500;
                });


              },
                  child:Text("Add Profit") ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                setState(() {
                  myBalance -= 100;
                });

              },
                  child:Text("Pay Commision") ),
              SizedBox(height: 10,),
              const Text("Market Trends",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              const SizedBox(height: 15,),
              Expanded(child: _buildCoinList(),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4facfe),Color(0xFF00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Balance",style: TextStyle(color: Colors.white70),),
          SizedBox(height: 10,),
          Text("\$$myBalance",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("****4231",style: TextStyle(letterSpacing: 2),),
              Icon(Icons.credit_card,color: Colors.white70,)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCoinList() {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index){
        final bool isPositive  = coins[index]['change'].contains('+');
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white10,
              child: Text(coins[index]['symbol'][0]),
            ),
            title: Text(coins[index]['name'],
            style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(coins[index]['symbol']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("\$${coins[index]['price']}"),
                Text(coins[index]['change'],
                style: TextStyle(color: isPositive? Colors.green: Colors.red),)
              ],
            ),
          ),
        );
      }
    );
  }
}
