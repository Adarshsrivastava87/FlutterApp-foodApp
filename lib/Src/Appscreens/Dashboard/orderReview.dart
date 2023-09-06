import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewOrder extends StatelessWidget {
  var Dispalydata;
  ReviewOrder({super.key, required this.Dispalydata});
  @override
  Widget build(BuildContext context) {
    print("${Dispalydata}");
    return Scaffold(
      appBar: AppBar(title: Text("Order Details")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Dispalydata.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                width: 450,
                //color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 10,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          Dispalydata.imgUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                //color: const Color.fromARGB(255, 101, 111, 119),
                child: Column(
                  children: [
                    SizedBox(
                      width: 1000,
                      //color: Colors.deepPurple,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Dispalydata.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Dispalydata.Detail.FoodDetails,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
