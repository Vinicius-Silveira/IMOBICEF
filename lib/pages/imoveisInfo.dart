import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imobiliaria/custom/customAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ImoveisInfo extends StatelessWidget {
  final dynamic itemData;
  const ImoveisInfo({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(itemData["image"]),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "${itemData["tipo"]}",
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 22),
                          ),
                          Text(
                            "${itemData["endereco"]}",
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 22),
                          ),
                          Text(
                            "R\$ ${itemData["valor"]}",
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          InformationTile(
                            content: "${itemData["area"]}",
                            name: "Área construída",
                          ),
                          InformationTile(
                            content: "${itemData["quartos"]}",
                            name: "Quartos",
                          ),
                          InformationTile(
                            content: "${itemData["banheiros"]}",
                            name: "Banheiros",
                          ),
                          InformationTile(
                            content: "${itemData["garagem"]}",
                            name: "Vagas na garagem",
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Divider(
                            height: 3,
                            color: Colors.grey,
                            indent: 50,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 5),
                                child: Column(
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          "Sobre o Imóvel",
                                          style: TextStyle(
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                    Text(
                                      "${itemData["descricao"]}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    const Column(
                                      children: [
                                        Text(
                                          "Quartos",
                                          style: TextStyle(
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                    Text(
                                      "${itemData["descricao_quartos"]}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    const Column(
                                      children: [
                                        Text(
                                          "Banheiros",
                                          style: TextStyle(
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                    Text(
                                      "${itemData["descricao_banheiros"]}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 5),
                              blurRadius: 5),
                        ]),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CustomAppBar(
                            padding: EdgeInsets.all(1),
                            height: 35,
                            width: 70,
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                width: size.width,
                child: Center(
                  child: OptionButton(
                    text: "Contato",
                    id: itemData["id"],
                    width: size.width,
                    icon: FontAwesomeIcons.whatsapp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String content;
  final String name;

  const InformationTile({Key? key, required this.content, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double tileSize =
        size.width * 0.195;
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(
            width: tileSize,
            height: tileSize,
            padding: const EdgeInsets.all(1),
            child: Text(content),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  final int id;

  const OptionButton(
      {Key? key,
      required this.id,
      required this.text,
      required this.icon,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const whatsappGreen = Color(0xff25D366);

    return Container(
      width: width,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () async {
              var link = WhatsAppUnilink(
                phoneNumber: '+55-(16)993762727',
                text:
                    "Olá! Tenho interesse em um imóvel! O código do imóvel é: $id",
              );
              await launch('$link');
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              elevation: 10,
              shape: const StadiumBorder(),
              foregroundColor: Colors.white,
              backgroundColor: whatsappGreen,
              textStyle: const TextStyle(
                fontSize: 26,
              ),
            ),
            icon: const Icon(FontAwesomeIcons.whatsapp),
            label: const Text("Contato"),
          ),
        ],
      ),
    );
  }
}