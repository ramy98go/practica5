import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoreInformationScreen extends StatefulWidget {
  const MoreInformationScreen({Key? key}) : super(key: key);

  @override
  _MoreInformationScreenState createState() => _MoreInformationScreenState();
}

class _MoreInformationScreenState extends State<MoreInformationScreen> {
  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(

      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '${character['image']}',
                height: MediaQuery.of(context).size.height/2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
                   borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 400, left: 5),
            child: Text('Información sobre el personaje:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          ),
          Container(
            padding: EdgeInsets.only(top: 430, left: 5),
            child: Center(
              child: Column(
                children: <Widget>[
                    Text('Nombre: ', style: TextStyle(fontSize: 18),),
                    Text('${character['name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('Especie: ', style: TextStyle(fontSize: 18),),
                  Text('${character['species']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('Genero: ', style: TextStyle(fontSize: 18),),
                  Text('${character['gender']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
