
import 'package:flutter/material.dart';
import 'package:guess_number/Util/extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_number/ui/root.dart';

class NumberResultScreen extends StatelessWidget {
  final int result;
   const NumberResultScreen(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Number Result")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                child: result == 31
                ? Text(AppLocalizations.of(context)!.result_error,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                : Text("${AppLocalizations.of(context)!.result} $result",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.all(25),
            child: ElevatedButton(onPressed: (){
              context.navigateAndRemove(const Root());
            }, child: Text(AppLocalizations.of(context)!.restart)),
          )
        ],
      ),
    );
  }
}


