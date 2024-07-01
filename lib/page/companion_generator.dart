import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:confetti/confetti.dart';

import 'interest_page.dart';
import 'thanks_page.dart';

class CompanionGenerator {
  static Future<String> generateCompanionName(
      String selectedRegion, String selectedQuality) async {
    final String data = await loadJsonData();
    final jsonData = json.decode(data);

    final Map<String, dynamic> regionsData = jsonData['companion_names'];

    if (kDebugMode) {
      print('Selected Region: $selectedRegion');
      print('Selected Quality: $selectedQuality');
    }
   

    if (regionsData.containsKey(selectedRegion)) {
      final Map<String, dynamic> companionsData = regionsData[selectedRegion];

      if (companionsData.containsKey(selectedQuality)) {
        final String companionName = companionsData[selectedQuality];

        if (companionName.isNotEmpty) {
          return companionName;
        }
      }
    }

    return '';
  }

  static Future<String> loadJsonData() async {
    // Charger les données à partir du fichier JSON
    String data = await rootBundle.loadString('assets/data/compagnons.json');
    return data;
  }
}

class CongratulationPage extends StatefulWidget {
  const CongratulationPage({super.key});

  @override
  _CongratulationPageState createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage>
    with SingleTickerProviderStateMixin {
  String selectedRegion = 'Alsace';
  String selectedQuality = 'Prise d\'initiative';
  String companionName = '';
  String pageTitle =
      'Félicitations pour avoir terminé le quiz ! Choisissez maintenant votre région préférée et une de vos qualités.';
  bool isFinished = false;

  List<String> regions = [
    "Alsace",
    "Aquitaine",
    "Auvergne",
    "Normandie",
    "Bourgogne",
    "Bretagne",
    "Centre-Val de Loire",
    "Champagne-Ardenne",
    "Corse",
    "Franche-Comté",
    "Île-de-France",
    "Languedoc-Roussillon",
    "Limousin",
    "Lorraine",
    "Midi-Pyrénées",
    "Nord-Pas-de-Calais",
    "Pays de la Loire",
    "Picardie",
    "Poitou-Charentes",
    "Provence-Alpes-Côte d'Azur",
    "Rhône-Alpes"
  ];

  List<String> qualities = [
    "Prise d'initiative",
    "Loyauté",
    "Sympathie",
    "Bienveillance",
    "Empathie",
    "Honnêteté",
    "Altruisme",
    "Esprit d'équipe",
    "Diplomatie",
    "Enthousiasme",
    "Rigueur",
    "Sincérité",
    "Curiosité",
    "Ouverture d'esprit",
    "Adaptabilité",
    "Créativité",
    "Intégrité",
    "Autonomie",
    "Ambition",
    "Patience",
    "Capacité d'écoute"
  ];

  void generateCompanionName() async {
    final String name = await CompanionGenerator.generateCompanionName(
        selectedRegion, selectedQuality);
    setState(() {
      companionName = name;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF327E89),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    isFinished
                        ? 'Voici votre nom de compagnon'
                        : 'Félicitations ! Choisissez votre région et une de vos qualités.',
                    textAlign:
                        TextAlign.center, // Centrer le texte horizontalement
                    style: const TextStyle(
                      color: Colors.white, // Changer la couleur en blanc
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (isFinished)
                  Center(
                    child: Text(
                      companionName,
                      textAlign:
                          TextAlign.center, // Centrer le texte horizontalement
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Changer la couleur en blanc
                      ),
                    ),
                  ),
                if (!isFinished)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButton<String>(
                        value: selectedRegion,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRegion = newValue!;
                            generateCompanionName();
                          });
                        },
                        items: regions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0,
                                      0), // Changer la couleur en blanc
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButton<String>(
                        value: selectedQuality,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedQuality = newValue!;
                            generateCompanionName();
                          });
                        },
                        items: qualities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0,
                                      0), // Changer la couleur en blanc
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (!isFinished) {
                      generateCompanionName();
                      setState(() {
                        isFinished = true;
                      });
                    } else {
                      showConfirmationDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFEE7203),
                  ),
                  child: Text(
                    isFinished
                        ? 'Intéressé(e) par une newsletter ou une formation?'
                        : 'Valider',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text(
          'Voulez-vous vous inscrire à notre newsletter ou à une formation?',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThankYouPage()),
              );
            },
            child: const Text('Non'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InterestPage()),
              );
            },
            child: const Text('Oui'),
          ),
        ],
      );
    },
  );
}
