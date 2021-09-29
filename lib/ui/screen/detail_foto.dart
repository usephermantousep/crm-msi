part of 'screen.dart';

class DetailFoto extends StatelessWidget{
  final String foto;
  DetailFoto({required this.foto});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(foto,fit: BoxFit.fill,),
        ),
      ),
    );
  }

}