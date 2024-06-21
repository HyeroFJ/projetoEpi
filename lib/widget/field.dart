import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:epi/Style/colors.dart';

Widget customTextField(
  {String? label,
  String? hint,
  TextEditingController? controller,
  int? maxLines = 1,
  bool? obscure = false,
  TextInputType? tipo = TextInputType.text,
  void Function(String)? funcao,
  List<TextInputFormatter>? formatacao
  })
   {
    return Column(
      children: [
        // Container(
        //       margin: const EdgeInsets.all(5.0),
        //       child: const TextField(
        //         decoration: InputDecoration(
        //             labelText: 'Nome',
        //             prefixIcon: Icon(Icons.password),
        //             enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                   color: Color.fromARGB(255, 106, 106, 106),
        //                   width: 2.0),
        //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                 borderSide:
        //                     BorderSide(color: Colors.blue, width: 2.0))),
        //       ),
        //     ),
        Container(
          margin: const EdgeInsets.symmetric(vertical:10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: TextFormField(
            keyboardType: tipo,
            obscureText: obscure!,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
                    labelText: label,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 106, 106, 106),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: funcao, 
                    inputFormatters: formatacao,
                    validator:  (value) {
                      if (value == null || value.isEmpty){
                        return '* Preencha o campo';
                      }
                      return null;
                    },
          ),
        )
      ],
    );
  }