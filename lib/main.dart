import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Herramientas')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl760O9Q-b37z5DV1MRFK9-m99a-itU5pG1A&usqp=CAU',
                width: 500,
                height: 500,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenderAndAgePrediction(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text('Predecir Género y Edad'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showAboutDialog(context);
                },
                child: Text('Acerca de'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showUniversitiesDialog(context);
                },
                child: Text('Universidades por país'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showWeatherDialog(context);
                },
                child: Text('Clima'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordPressNews(),
                    ),
                  );
                },
                child: Text('Últimas noticias de WordPress'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Acerca de'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D4E03AQG826ucxEN2Ew/profile-displayphoto-shrink_800_800/0/1697040892488?e=1715817600&v=beta&t=NOLNGDqjH1o6jyfHwq45LUNSz7-GwwaZmdd3MZcLPeA'),
            ),
            Text('obedsilvestre339@gmail.com'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showUniversitiesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => UniversitiesDialog(),
    );
  }

  void _showWeatherDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => WeatherDialog(),
    );
  }
}

class WordPressNews extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noticias de WordPress')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'data:image/png;base64,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',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Crean una campaña para lograr que Bitcoin tenga un emoji'),
                      subtitle: Text(
                          'Bitcoin se encuentra en el mejor momento de toda su historia, cotizando por encima de los 71.000 dólares.'),
                      onTap: () {
                        _launchURL(
                            'https://www.periodismo.com/2024/03/13/bitcoin-emoji/');
                      },
                    ),
                    Divider(), // Separador entre las noticias
                    ListTile(
                      title: Text('Milei, Menem, Moisés y Julio César'),
                      subtitle: Text(
                          'En abril de 1998 durante un vuelo hacia Nueva Zelanda para una visita oficial, cuando el avión Tango 01 intentó el aterrizaje en la ciudad de Wellington, ráfagas de 140 kilómetros por hora amenazaron con hacerlo caer.'),
                      onTap: () {
                        _launchURL(
                            'https://www.periodismo.com/2024/03/02/milei-menem-moises-y-julio-cesar/');
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                          'La Inteligencia Artificial que usan los escritiores para analizar sus obras'),
                      subtitle: Text(
                          'La generación de texto mediante Inteligencia Artificial ha avanzado mucho en los últimos años. Pero todavía está lejos de alcanzar el talento de los escritores humanos.'),
                      onTap: () {
                        _launchURL(
                            'https://www.periodismo.com/2024/03/12/la-inteligencia-artificial-que-usan-los-escritiores-para-analizar-sus-obras/');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UniversitiesDialog extends StatefulWidget {
  @override
  _UniversitiesDialogState createState() => _UniversitiesDialogState();
}

class _UniversitiesDialogState extends State<UniversitiesDialog> {
  final TextEditingController _countryController = TextEditingController();
  List<dynamic> _universities = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Universidades por país'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TextField(
                    controller: _countryController,
                    decoration:
                        InputDecoration(labelText: 'Ingrese un país en inglés'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _fetchUniversities();
                    },
                    child: Text('Buscar'),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _universities.length,
                      itemBuilder: (context, index) {
                        final university = _universities[index];
                        return ListTile(
                          title: Text(university['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Dominio: ${university['domains'].join(', ')}'),
                              Text(
                                  'Página web: ${university['web_pages'].join(', ')}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _fetchUniversities() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=${_countryController.text}'));
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        _universities = data;
        _loading = false;
      });
    } catch (error) {
      print('Error al obtener las universidades: $error');
      setState(() {
        _loading = false;
      });
    }
  }
}

class WeatherDialog extends StatefulWidget {
  @override
  _WeatherDialogState createState() => _WeatherDialogState();
}

class _WeatherDialogState extends State<WeatherDialog> {
  Map<String, dynamic> _weatherData = {};
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : _weatherData.isEmpty
                ? Text('No se pudo obtener el clima',
                    style: TextStyle(color: Colors.blue))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Temperatura: ${_kelvinToCelsius(_weatherData['main']['temp'])}°C',
                          style: TextStyle(color: Colors.blue)),
                      Text('Humedad: ${_weatherData['main']['humidity']}%',
                          style: TextStyle(color: Colors.blue)),
                      Text(
                          'Clima: ${_weatherData['weather'][0]['description']}',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
      ),
    );
  }

  void _fetchWeather() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=18.47186&lon=-69.89232&appid=f5b8d3be09f306a765f18959d5d53167'));
      final data = jsonDecode(response.body);
      setState(() {
        _weatherData = data;
        _loading = false;
      });
    } catch (error) {
      print('Error al obtener el clima: $error');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  double _kelvinToCelsius(double tempInKelvin) {
    return tempInKelvin - 273.15;
  }
}

class GenderAndAgePrediction extends StatefulWidget {
  const GenderAndAgePrediction({Key? key}) : super(key: key);

  @override
  _GenderAndAgePredictionState createState() => _GenderAndAgePredictionState();
}

class _GenderAndAgePredictionState extends State<GenderAndAgePrediction> {
  String name = '';
  String gender = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Predecir Género y Edad')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Ingrese un nombre'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _predictGenderAndAge(context);
              },
              child: Text('Predecir'),
            ),
            SizedBox(height: 20),
            Text('Género: $gender'),
            SizedBox(height: 10),
            _buildGenderColorDisplay(),
            SizedBox(height: 20),
            Text('Edad: $age'),
            SizedBox(height: 10),
            _buildAgeDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderColorDisplay() {
    if (gender.toLowerCase() == 'masculino') {
      return Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      );
    } else if (gender.toLowerCase() == 'femenino') {
      return Container(
        width: 100,
        height: 100,
        color: Colors.pink,
      );
    } else {
      return Container();
    }
  }

  Widget _buildAgeDisplay() {
    if (age == 0) {
      return Container();
    } else if (age <= 35) {
      return _buildAgeStatus('Joven',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnymLr9uh4-UsGtoX2GCGpc3GL-PwofEf8ow&usqp=CAU');
    } else if (age <= 60) {
      return _buildAgeStatus('Adulto',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVyzmY-_41PxwrBGtgNOtDPMwInm3472NxHw&usqp=CAU');
    } else {
      return _buildAgeStatus('Anciano',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDT2nr9quQkDDq2T6t8eXrthGKQSyqTd4sWw&usqp=CAU');
    }
  }

  Widget _buildAgeStatus(String status, String imageUrl) {
    return Column(
      children: [
        Text(status),
        Image.network(
          imageUrl,
          width: 100,
          height: 100,
        ),
      ],
    );
  }

  void _predictGenderAndAge(BuildContext context) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
      final data = jsonDecode(response.body);
      setState(() {
        gender = data['gender'] == 'male' ? 'Masculino' : 'Femenino';
      });
    } catch (error) {
      print('Error al obtener el género: $error');
    }

    try {
      final response =
          await http.get(Uri.parse('https://api.agify.io/?name=$name'));
      final data = jsonDecode(response.body);
      setState(() {
        age = data['age'];
      });
    } catch (error) {
      print('Error al obtener la edad: $error');
    }
  }
}
