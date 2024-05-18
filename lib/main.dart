import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativo de Compras',

      //Rotas de navegação
      initialRoute: 't1',
      routes:{
        't1': (context) => LoginView(),
        't2': (context) => Tela2View(),
        't3': (context) => Tela3View(),
        't4': (context) => Tela4View(),
      },
    );
  }
}
//telas----Tela1

class LoginView extends StatefulWidget{
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView>{
  var formKey = GlobalKey<FormState>();

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text ('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children:[
              SizedBox(height: 30),
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                //Validação

                validator: (value){
                  if(value == null){
                    return 'Informe um nome';
                  }else if (value.isEmpty){
                    return 'Informe um nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: txtValor2,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                   border: OutlineInputBorder(),
                ),
                //Validação
                validator: (value){
                  if(value == null){
                    return 'Informe um e-mail';
                  }else if (value.isEmpty){
                    return 'Informe um e-mail';
                  }
                  return null;
                },

                ),
                SizedBox(height: 30),
              TextFormField(
                controller: txtValor3,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: InputBorder.none,
                ),
                //Validação
                validator: (value){
                  if(value == null){
                    return 'Informe uma senha';
                  }else if (value.isEmpty){
                    return 'Informe uma senha';
                  }
                  return null;
                },

              ),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed:(){
                  Navigator.pushNamed(context, "t2");
                },
                child: Text('Entrar'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class Tela2View extends StatefulWidget{
  const Tela2View({super.key});
  @override
  State<Tela2View> createState() => _Tela2ViewState();
}
class _Tela2ViewState extends State<Tela2View>{
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text('Este é um aplicativo de lista de compras qualquer. Ele permite que o usuário crie sua lista de compras,edite-a e reorganize-a da forma que o convém. O usuário deve clicar em salvar sempre.'),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "t1");
                },
                child: Text('Voltar'),
              ),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "t3");
                },
                child: Text('Avançar'),
              ),
            ],
          ),
        ),
    );
  }
}
//Tela3
class Tela3View extends StatefulWidget{
  const Tela3View({super.key});

  @override
  _Tela3ViewState createState() => _Tela3ViewState();
}
class _Tela3ViewState extends State<Tela3View>{
  final formKey = GlobalKey<FormState>();

  //Controladores de campo de texto
  var txtValor8 = TextEditingController();
  var txtValor9 = TextEditingController();
  var txtValor10 = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Lista de Compras'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor8,
                  style: TextStyle(fontSize: 32),
                  decoration:InputDecoration(
                    labelText:'Nome da lista',
                    border: OutlineInputBorder(),
                  ),
                  //Validação
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'Informe o nome da lista.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children:[
                    Expanded(
                      child: Column(
                        children:[
                          Text(
                            'Lista',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: txtValor9,
                            decoration: InputDecoration(
                              labelText: 'Nome do Item',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children:[
                          Text('Quantidade',
                          style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: txtValor10,
                            decoration: InputDecoration(
                              labelText: 'Quantidade',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){},
                    child: Text('Editar Lista'),
                  ),
                SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){},
                    child: Text('Editar item da Lista'),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){},
                    child: Text('Salvar'),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "t2");
                    },
                    child: Text('Voltar'),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "t4");
                    },
                    child: Text('Avançar'),
                  ),
              ],
                ),
            ),
        ),
      );
  }
}
//Tela4
class Tela4View extends StatefulWidget{
  const Tela4View ({super.key});
  @override
  _Tela4ViewState createState() => _Tela4ViewState();
}
class _Tela4ViewState extends State<Tela4View>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //Controladores de campo de texto  
  var txtValor11 = TextEditingController();
  var txtValor12 = TextEditingController();
  var txtValor13 = TextEditingController();
  var txtValor14 = TextEditingController();

  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
            child: Column(
              children:[
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor11,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Pesquisar Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: txtValor12,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Marcar Item como Comprado',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: txtValor13,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Remover Lista',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: txtValor14,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Remover Item da Lista',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height:30),
                OutlinedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "t3");
                  },
                  child: Text('Voltar'),
                ),
                SizedBox(height:30),
                OutlinedButton(
                  onPressed: ()=>exit(0),
                  child: Text('Salvar e Fechar'),
                ),
              ],
            ),
        ),
      ),
    );
  }
}