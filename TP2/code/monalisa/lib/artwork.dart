import 'package:flutter/material.dart';

class ArtWork extends StatefulWidget {
  const ArtWork({Key? key}) : super(key: key);

  @override
  State<ArtWork> createState() => _ArtWorkState();
}

class _ArtWorkState extends State<ArtWork> {
  bool _isFavorite = false;
  bool _showText = false; // Variable d'état pour afficher ou masquer le texte

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/Mona_Lisa.jpg'),
                if (_showText) // Afficher le texte uniquement lorsque _showText est vrai
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Text(
                          "La Joconde, ou Portrait de Mona Lisa, est un tableau de lartiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu à 1517 (l artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                Icon(
                  Icons.favorite,
                  color: _isFavorite ? Colors.red : Colors.white,
                  size: 50.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Mona Lisa",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Léonard de Vinci",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              color: Colors.brown,
              icon: Icon(
                Icons.favorite,
                color: _isFavorite ? Colors.red : null,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _showText =
                      !_showText; // Inverser la valeur de _showText lors du clic sur l'icône "article"
                });
              },
              color: Colors.brown,
              icon: const Icon(Icons.article),
            ),
          ],
        ),
      ),
    );
  }
}
