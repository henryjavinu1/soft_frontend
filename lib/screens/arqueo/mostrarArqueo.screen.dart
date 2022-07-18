//ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/services/Arqueo.service.dart';
import 'package:soft_frontend/screens/arqueo/components/cabeceraDeTablaArqueo.component.dart';
import 'package:soft_frontend/screens/arqueo/crearArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/eliminarArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/cerrarSesionActualizandoArqueo.screen.dart';

class MostrarArqueoss extends StatefulWidget {
  const MostrarArqueoss({Key? key}) : super(key: key);
  @override
  State<MostrarArqueoss> createState() => _MostrarArqueossState();
}

class _MostrarArqueossState extends State<MostrarArqueoss> {
  var idUsuarioController = new TextEditingController();
  List<MostrarArque> arqueos = [];

  @override
  void initState() {
    super.initState();
    _cargarArqueos();
  }

  _cargarArqueos() async {
    arqueos = await traerArqueos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: Column(
          children: [
            Row(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: Text(
                    'Modulo de Arqueos',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: TextField(
                  controller: idUsuarioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'id de Usuario',
                  ),
                ),
              )),
              ElevatedButton(
                onPressed: () async {
                  if (idUsuarioController.text.trim().isNotEmpty) {
                    print(idUsuarioController.text.trim());
                    MostrarArque? mostArqu = await buscarArqueoPorIdUsuario(
                        idUsuarioController.text.trim());
                    print(mostArqu);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text('El campo de búsqueda está vacío.'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cerrar'))
                              ],
                            ));
                  }
                },
                child: Text(
                  'Buscar',
                  style: GoogleFonts.lato(),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: size.width * 0.015, vertical: 9)),
                ),
              ),
              TextButton(
                onPressed: null,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CrearArque(),
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Crear Nuevo Arqueo'),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: null,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new ActualizarArqueCerrandoSesion(),
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Cerrar Sesion'),
                    ),
                  ),
                ),
              ),
            ]),
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.height * 0.03),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        CabeceraDeTablaArqueo(size: size),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Expanded(child: _listViewUsuarios()),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, i) => Divider(),
      itemCount: arqueos.length,
      itemBuilder: (_, i) => _pagoItemList(arqueos[i]),
    );
  }

  Container _pagoItemList(MostrarArque arqueosss) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.idArqueo.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.fechaInicio.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.fechaFinal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoApertura.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoCierre.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.otrosPagos.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.ventaCredito.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.ventaTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.isDelete.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.createdAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.updatedAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.idUsuario.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.idSesion.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            TextButton(
              onPressed: null,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new EliminarArque(arqueo: arqueosss),
                  ),
                ),
                child: Text('Eliminar'),
              ),
            ),
          ],
        ));
  }
}
