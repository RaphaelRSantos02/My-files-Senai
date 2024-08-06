import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App pets",
      home: PetsScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
    );
  }
}

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late Future<List<Pet>> futurePets;

  Future<List<Pet>> consultaPet() async{
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json'));
    if(response.statusCode==200){
      final parsed = jsonDecode(response.body);
      
      List<dynamic> petJson = parsed['pets'];
      return petJson.map((json)=> Pet.fromJson(json)).toList();
    }
    else{
      print(response.statusCode);
      throw Exception("Falha ao consumir api");
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePets = consultaPet();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pets"),
      ),
      body: Center(
         child: FutureBuilder<List<Pet>>(
       future: futurePets,
       builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data!.length, // tamanho do dado
            itemBuilder: (context, index) {
              return PetListItem(pet: snapshot.data![index]);
            },
            );
          }else if (snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
        
        ),
        

      ),
    );
  }
}

class Pet{
  final String nome;
  final String imagemurl;
  final String idade;
  final String comportamento;
  final String porte;
  final String localizacao;
  final String tel;

  Pet({required this.nome,required this.imagemurl, required this.idade,required this.comportamento,required this.porte,
  required this.localizacao, required this.tel});
  
  factory Pet.fromJson(Map<String, dynamic> json){
    return Pet(
    nome: json['name'], 
    imagemurl: json['imageUrl'], 
    idade: json['age'], 
    comportamento: json['behavior'], 
    porte: json['size'], 
    localizacao: json['location'], 
    tel: json['phoneNumber']
    );
  }
}
class PetListItem extends StatelessWidget {
  final Pet pet;
  const PetListItem({Key? key, required this.pet}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pet.imagemurl),
      ),
      title: Text(pet.nome),
      subtitle: Text("${pet.idade}, ${pet.comportamento}, ${pet.porte}, ${pet.localizacao}"),
      onTap: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
           return AlertDialog(
            title: Text(pet.nome),
            content: SingleChildScrollView(
              child:ListBody(
                children: <Widget>[
                  Image.network(pet.imagemurl),
                  Text('idade: ${pet.idade}'),
                  Text('Comportamento: ${pet.comportamento}'),
                  Text('porte: ${pet.porte}'),
                  Text('localização: ${pet.localizacao}'),
                  Text('telefone: ${pet.tel}'),
                ],
                ), 
              ),
              actions: <Widget>[
                TextButton(onPressed: 
                () {
                  Navigator.of(context).pop();
                }, 
                child: Text('Fechar'))
              ],
           ); 
          }
          );
          }
          );
      }
  }