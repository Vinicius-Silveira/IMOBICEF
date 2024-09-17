// ignore_for_file: file_names
import 'package:flutter/material.dart';
//import 'package:imobiliaria/custom/customAppBar.dart';
import '../utils/imoveis_data.dart';
import 'imoveisInfo.dart';
import '../custom/customSidebar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Map<String, dynamic>> _imoveis = imoveisData;

  //lista que vai usar dados para o listview da pesquisa
  List<Map<String, dynamic>> _foundImoveis = [];
  List<Map<String, dynamic>> results = [];

  //funcao sera chamada quando digitar no campo de texto
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      _foundImoveis.clear();
      results.clear();
    } else {
      results = _imoveis
          .where(
            (element) => element["tipo"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      _foundImoveis = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // DRAWER = BOTAO DE MENU LATERAL (SIDEBAR)
        drawer: const CustomSidebar(),
        body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, __) => [
            SliverAppBar(
              // tamanho da appBar quando expandida
              expandedHeight: 175,
              iconTheme:
                  const IconThemeData(size: 45), // tamanho do botao sidebar
              foregroundColor: Colors.black, // cor do botao
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // titulo da appBar
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'IMOBILIÁRIA',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                // IMAGEM DE FUNDO DA APPBAR
                background: Image.asset(
                  "assets/images/imobicef_logo_transparente.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              backgroundColor: Colors.white,
              // corrige cor da appbar quando extendida fora do topo da pagina
              surfaceTintColor: Colors.white,
              // esconde e mostra appbar
              snap: true,
              floating: true,
            ),
          ],
          // CORPO DA LANDING SCREEN
          body: Column(
            children: [
              const Divider(color: Colors.black38, height: 1),
              TextField(
                onTapOutside: (event) {
                  // fecha teclado quando clicar fora do TextField
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                autofocus: false,
                onChanged: (value) => _runFilter(value),
                style: const TextStyle(
                  fontSize: 24,
                ),
                decoration: const InputDecoration(
                  hintText: ' Pesquisar',
                  prefixText: ' ',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                // se o campo de texto não estiver vazio => entao pesquise
                child: _foundImoveis.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _foundImoveis.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            key: ValueKey(_foundImoveis[index]["id"]),
                            color: Colors.white70,
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).requestFocus(
                                    FocusNode()); //evita que o teclado abra novamente quando voltar a pagina
                                // cria rota para imovel pesquisado
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ImoveisInfo(
                                        itemData: _foundImoveis[index]),
                                  ),
                                );
                              },
                              //CAMPO DE INFORMACOES DE PESQUISA DOS IMOVEIS
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text(
                                      'ID: ' +
                                          _foundImoveis[index]["id"].toString(),
                                      style: const TextStyle(
                                          fontSize: 24, height: 1.55),
                                    ),
                                    title: Text(_foundImoveis[index]['tipo']),
                                    subtitle: Text(
                                      _foundImoveis[index]['endereco'] +
                                          " R\$" +
                                          _foundImoveis[index]["valor"]
                                              .toString(),
                                      style: const TextStyle(fontSize: 17),
                                      softWrap: true,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: Image.asset(
                                        'assets/images/imovel${_foundImoveis[index]["id"]}.jpg'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    // SENAO, mostre todos os imoveis
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        // imoveisData = array de objetos do arquivo imoveis_data
                        itemCount: imoveisData.length,
                        itemBuilder: (context, index) {
                          // RETORNA IMOVEIS DE imoveisData NO INDICE DO OBJETO
                          return ImoveisItem(itemData: imoveisData[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImoveisItem extends StatelessWidget {
  const ImoveisItem({Key? key, required this.itemData}) : super(key: key);

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    // RETORNA ARRAY DE DADOS DOS IMOVEIS DO ARQUIVO IMOVEIS_DATA PARA A LANDING PAGE
    // GESTUREDETECTOR DETECTA ONDE O USUARIO CLICAR E TRAÇA A ROTA P/ A PAGINA DE INFO DOS IMOVEIS
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); //evita que o teclado abra novamente quando voltar a pagina
        //cria rota para imovel selecionado
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImoveisInfo(itemData: itemData),
          ),
        );
      },
      // CONTAINER DOS IMOVEIS A VENDA - FOTO-DESCRICAO
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(itemData["image"]),
                  ),
                ],
              ),
            ),

            // COLUNA DESCRICAO DOS IMOVEIS A VENDA
            Column(
              children: [
                Text(
                  "${itemData["tipo"]}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${itemData["endereco"]}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "R\$ ${itemData["valor"]}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              indent: 8,
              endIndent: 8,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
