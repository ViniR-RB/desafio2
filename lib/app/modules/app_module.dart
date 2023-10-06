import 'package:desafio/app/modules/perfil/pages/about_page.dart';
import 'package:desafio/app/modules/perfil/pages/edit_about.dart';
import 'package:desafio/app/modules/perfil/pages/edit_perfil_page.dart';
import 'package:desafio/app/modules/perfil/pages/perfil_page.dart';
import 'package:desafio/app/modules/perfil/perfil_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(PerfilController.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => PerfilPage(
              controller: Modular.get<PerfilController>(),
            ));
    r.child('/edit',
        child: (context) => EditPerfilPage(
              controller: Modular.get<PerfilController>(),
            ));
    r.child('/about',
        child: (context) => AboutPage(
              controller: Modular.get<PerfilController>(),
            ));
    r.child('/edit-about',
        child: (context) =>
            EditAboutPage(controller: Modular.get<PerfilController>()));
  }
}
