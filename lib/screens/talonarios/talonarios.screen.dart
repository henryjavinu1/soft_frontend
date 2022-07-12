import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/talonarios/themes/app_theme.dart';

class TalonariosScreen extends StatelessWidget {
  const TalonariosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Mantenimiento | Talonarios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: height * 0.02),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Crear Talonario'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: AppTheme.primaryColor),
                )
              ],
            ),
          ),
          const Divider(),
          Container(
            height: height * 0.8,
            width: width * 0.9,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Talonario'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
