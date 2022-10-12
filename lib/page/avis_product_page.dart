import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../model/review_model.dart';

class AvisProductPage extends StatelessWidget {
  final Product product;
  AvisProductPage(this.product, {Key? key}) : super(key: key);

  final List<Review> reviews = [
    Review(1, "Super écran", "riderofzion", "https://picsum.photos/80/80", 4,
        "j'en suis presque ravi"),
    Review(2, "moyen", "micheline", "https://picsum.photos/80/80", 2,
        "j'en suis ravie"),
    Review(3, "très décu", "cédric", "https://picsum.photos/80/80", 1,
        "j'en suis ravie"),
    Review(4, "Super professeur", "eline", "https://picsum.photos/80/80", 5,
        "merci beaucoup pour ces 3 jours")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Avis")),
        body: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (_, index) {
              return Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  ListTile(
                    leading: Image.network(reviews[index].profilePic,
                        width: 80, height: 80),
                    title: Text(reviews[index].username,
                      style: Theme.of(context).textTheme.headline6),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (indexStar) {
                        return Icon(
                          color: Colors.orangeAccent,
                          indexStar < reviews[index].note ? Icons.star : Icons.star_border_purple500_rounded,
                        );
                      }),),
                  ),
                  Text(reviews[index].title,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,),
                  Text(reviews[index].detail,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.start,)
                ]),
              );
            }));
  }
}
