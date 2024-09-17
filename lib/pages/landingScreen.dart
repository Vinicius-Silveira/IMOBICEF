// ignore_for_file: file_names
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> _foundImoveis = [];
  List<Map<String, dynamic>> results = [];

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
        drawer: const CustomSidebar(),
        body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, __) => [
            SliverAppBar(
              expandedHeight: 175,
              iconTheme:
                  const IconThemeData(size: 45),
              foregroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
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
                background: Image.asset(
                  "assets/images/imobicef_logo_transparente.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              snap: true,
              floating: true,
            ),
          ],
          body: Column(
            children: [
              const Divider(color: Colors.black38, height: 1),
              TextField(
                onTapOutside: (event) {
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
                                    FocusNode());
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ImoveisInfo(
                                        itemData: _foundImoveis[index]),
                                  ),
                                );
                              },
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
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: imoveisData.length,
                        itemBuilder: (context, index) {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImoveisInfo(itemData: itemData),
          ),
        );
      },
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