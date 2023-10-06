import 'dart:developer';
import 'dart:io';

import 'package:desafio/app/core/models/perfil_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/colors.dart';
import '../perfil_controller.dart';
import '../widgets/custom_text_field.dart';

class EditPerfilPage extends StatefulWidget {
  final PerfilController controller;
  const EditPerfilPage({super.key, required this.controller});

  @override
  State<EditPerfilPage> createState() => _EditPerfilPageState();
}

class _EditPerfilPageState extends State<EditPerfilPage> {
  final _scrollController = ScrollController();
  late final PerfilModel _myPerfil;
  late File _imageFile = File('');
  final _picker = ImagePicker();
  List<String> _moderadores = [];
  final List<TextEditingController> _moderadoresEC = [];

  Future<void> getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } on PlatformException catch (e) {
      log('$e');
    }
  }

  _initPage() {
    _myPerfil = widget.controller.value;
    _moderadores = widget.controller.value.moderators;
    nameEC = TextEditingController(text: _myPerfil.perfilName);
    bioEC = TextEditingController(text: _myPerfil.bio);
    locationEC = TextEditingController(text: _myPerfil.location);
    generalAdministratorEC =
        TextEditingController(text: _myPerfil.generalAdministrator);
  }

  void _creatingTextEditingControllerFromModerador() {
    for (var index = 0; index < _moderadores.length; index++) {
      _moderadoresEC.add(TextEditingController(text: _moderadores[index]));
    }
  }

  @override
  void initState() {
    _initPage();
    _creatingTextEditingControllerFromModerador();
    super.initState();
  }

  late final TextEditingController nameEC;

  late final TextEditingController bioEC;

  late final TextEditingController locationEC;

  late final TextEditingController generalAdministratorEC;

  final formKey = GlobalKey<FormState>();

  void savePerfil(GlobalKey<FormState> formKey) {
    switch (formKey.currentState!.validate()) {
      case false:
        _scrollController.animateTo(
          300.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        break;
      case true:
        if (_imageFile.path.isEmpty) {
          widget.controller.changePerfil(null, nameEC.text, bioEC.text,
              locationEC.text, generalAdministratorEC.text, _moderadores);
        } else {
          widget.controller.changePerfil(
              _imageFile.path,
              nameEC.text,
              bioEC.text,
              locationEC.text,
              generalAdministratorEC.text,
              _moderadores);
        }
        log('$_moderadores');
    }
  }

  @override
  Widget build(BuildContext context) {
    log('Build');
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: CustomScrollView(
          controller: _scrollController,
          dragStartBehavior: DragStartBehavior.start,
          slivers: [
            SliverAppBar(
                title: const Text(
                  'Editar Perfil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF001B3D),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () => savePerfil(formKey),
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColor.blue),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
                leading: switch (Modular.to.canPop()) {
                  true => IconButton(
                      onPressed: () => Modular.to.pop(),
                      icon: Icon(Icons.arrow_back_ios, color: AppColor.blue),
                    ),
                  false => const SizedBox.shrink(),
                }),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          'Imagem Perfil',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF262626),
                              letterSpacing: 1.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            switch (_imageFile.path.isEmpty) {
                              true => CircleAvatar(
                                  radius: 50,
                                  backgroundImage: const AssetImage(
                                      'assets/images/perfil_elypse.png'),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        tileMode: TileMode.clamp,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.black.withOpacity(0.0),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.0, 0.8],
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: () => getImage(),
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ),
                                ),
                              false => CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(_imageFile),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        tileMode: TileMode.clamp,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.black.withOpacity(0.0),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.0, 0.8],
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: () => getImage(),
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ),
                                ),
                            }
                          ],
                        ),
                        const SizedBox(height: 32),
                        CustomTextField(
                          controller: nameEC,
                          label: 'Nome',
                        ),
                        CustomTextField(
                          controller: bioEC,
                          label: 'Bio',
                        ),
                        CustomTextField(
                          controller: locationEC,
                          label: 'Localização',
                        ),
                        CustomTextField(
                          controller: generalAdministratorEC,
                          label: 'Administrador geral',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Moderadores',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF262626),
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.7,
                            ),
                            SizedBox(
                              height: 29,
                              width: 97,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _moderadores.add('');
                                      _moderadoresEC
                                          .add(TextEditingController());
                                    });
                                  },
                                  child: const Text(
                                    'Adicionar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 12.0),
                  child: SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: _moderadoresEC[index],
                        onChanged: (value) {
                          _moderadores[index] = value;
                        },
                        validator:
                            Validatorless.required('Esse Campo é requerido'),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _moderadores.removeWhere(
                                  (element) => element == _moderadores[index]);
                              _moderadoresEC.remove(_moderadoresEC[index]);
                            });
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        )),
                      )),
                );
              }, childCount: _moderadores.length),
            )
          ],
        ),
      ),
    );
  }
}
