import 'package:flutter/material.dart';
import 'package:practica5/src/models/rickandmorty_model.dart';
import 'package:practica5/src/network/api.dart';

class RickAndMorty extends StatefulWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  _RickAndMortyState createState() => _RickAndMortyState();
}

class _RickAndMortyState extends State<RickAndMorty> {

  ApiRM? apirm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apirm = ApiRM();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      body: FutureBuilder(
        future: apirm!.getAllCaracter(),
        builder: (BuildContext context, AsyncSnapshot<List<RickAndMortyModel>?> snapshot)
        {
          if(snapshot.hasError){
            return Center(child: Text('Hay un error'),);
          }else{
            if(snapshot.connectionState == ConnectionState.done){
              return _listadoCharacters(snapshot.data!);
            }else{
              return CircularProgressIndicator();
            }
          }
        }
      ),
    );
  }

  Widget _listadoCharacters(List<RickAndMortyModel> ch){
    return ListView.separated(
      itemBuilder: (BuildContext context, index){
        RickAndMortyModel cha = ch[index];
        return Center(
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                  child: Stack(
                    children: [
                      Container(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/activity_indicator.gif'),
                          image: NetworkImage('${cha.image}'),
                          fadeInDuration: Duration(milliseconds: 200),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Nombre: ${cha.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("Especie: ${cha.species}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              TextButton.icon(
                icon: Icon(Icons.chevron_right,size: 35,),
                label: Text('Ver Más',style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.pushNamed(
                      context,
                      '/moredetail',
                      arguments:{
                        'id'          : cha.id,
                        'name'        : cha.name,
                        'image'       : cha.image,
                        'species'     : cha.species,
                        'gender'      : cha.gender
                      }
                  );
                },
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_,__) => Divider(height: 10, ),
      itemCount: ch.length,
    );
  }

}
