import 'package:flutter/material.dart';

class ImagemDestaqueWidget extends StatelessWidget {
  const ImagemDestaqueWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.callBack,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black12,
                  Colors.black54,
                  Colors.black87,
                ],
              ),
            ),
            alignment: Alignment.bottomRight,
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text(title, style: TextStyle(color: Colors.white)),
              subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
              trailing: OutlinedButton(
                onPressed: callBack,
                child: Text('Acessar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
