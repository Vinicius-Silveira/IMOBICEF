import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSidebar extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 30);

  Future<void> _launchUrl() async {
    final Uri _urlFACEF = Uri.parse('https://www.unifacef.com.br/');
    if (!await launchUrl(_urlFACEF, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_urlFACEF');
    }
  }

  Future<void> _launchUrlTrabalhe() async {
    final Uri _urlTrabalhe = Uri.parse(
        "https://www.unifacef.com.br/estagios/estagios-supervisionados/");
    if (!await launchUrl(_urlTrabalhe, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_urlTrabalhe');
    }
  }

  Future<void> _launchUrlQuemSomos() async {
    final Uri _urlQuemSomos =
        Uri.parse("https://www.unifacef.com.br/institucional/historico/");
    if (!await launchUrl(_urlQuemSomos, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_urlQuemSomos');
    }
  }

  const CustomSidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              IconButton.filledTonal(
                icon: const Icon(Icons.people_alt_rounded),
                onPressed: _launchUrlQuemSomos,
              ),
              TextButton.icon(
                onPressed: _launchUrlQuemSomos,
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                ),
                label: const Text(
                  'Quem somos',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 8,
                endIndent: 8,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              IconButton.filledTonal(
                icon: const Icon(Icons.wb_incandescent_outlined),
                onPressed: _launchUrlTrabalhe,
              ),
              TextButton.icon(
                onPressed: _launchUrlTrabalhe,
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                ),
                label: const Text(
                  'Trabalhe conosco',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 8,
                endIndent: 8,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              IconButton.filledTonal(
                icon: const Icon(Icons.travel_explore),
                onPressed: _launchUrl,
              ),
              TextButton.icon(
                onPressed: _launchUrl,
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                ),
                label: const Text(
                  'Visite nosso site',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 8,
                endIndent: 8,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}