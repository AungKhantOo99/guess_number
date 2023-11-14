import 'package:flutter/material.dart';
import 'package:guess_number/Util/extension.dart';
import 'package:guess_number/Util/sharePref.dart';
import 'package:guess_number/ui/guess_number_screen.dart';
import 'package:guess_number/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:  const Text("Guess Number"),actions: [
         IconButton(onPressed: (){
            SharedPref.getLang().then((value) {
              if(value == "en"){
                MyApp.setLocal(context, "my");
                SharedPref.setLang("my");
              }else{
                MyApp.setLocal(context, "en");
                SharedPref.setLang("en");
              }
            });
         }, icon: const Icon(Icons.language))]),
       body:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             const SizedBox(height: 100,),
             Center(child: Text(AppLocalizations.of(context)!.welcome,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
             const SizedBox(height: 20,),
             Text(AppLocalizations.of(context)!.content,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 22)),
             const SizedBox(height: 20,),
             Text(AppLocalizations.of(context)!.step1,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 18)),
             const SizedBox(height: 10,),
             Text(AppLocalizations.of(context)!.step2,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 18)),
             const SizedBox(height: 50,),
             Container(
               height: 50,
               margin: const EdgeInsets.all(25),
               child: ElevatedButton(onPressed: (){
                   context.navigateAndRemove(const GuessNumberScreen());
               }, child: Text(AppLocalizations.of(context)!.start)),
             )
           ],
         ),
    );
  }
}



