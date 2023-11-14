
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_number/Util/extension.dart';
import 'package:guess_number/Util/table_helper.dart';
import 'package:guess_number/riverpod/store_number_provider.dart';
import 'package:guess_number/ui/number_result_screen.dart';
import 'package:guess_number/widget/TableWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuessNumberScreen extends ConsumerWidget {
  const GuessNumberScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    List<List<String>> allTable = [TableHelper.table1(context),TableHelper.table2(context),TableHelper.table3(context),
      TableHelper.table4(context),TableHelper.table5(context)];
    final currentTableNumber = ref.watch(tableNumberProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("Guess Number")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child:  Text(AppLocalizations.of(context)!.ask_user,
                  style: const TextStyle(fontWeight: FontWeight.w800,letterSpacing: 1.0,fontSize: 20)),
            ),
            TableWidget(allTable[currentTableNumber]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                width: 120,
                height: 50,
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(onPressed: (){
                  if(currentTableNumber < 4){
                    ref.read(tableNumberProvider.notifier).state++ ;
                  }else{
                    //clear table index
                    ref.read(tableNumberProvider.notifier).state = 0;
                    context.navigateAndRemove(NumberResultScreen(ref.watch(numberResultProvider)));
                    //clear result
                    ref.read(numberResultProvider.notifier).state = 0;
                  }
                }, child:  Text(AppLocalizations.of(context)!.not_include)),
              ),
              Container(
                width: 120,
                height: 50,
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(onPressed: (){
                  if(currentTableNumber == 0){
                    ref.read(numberResultProvider.notifier).state += 1;
                  }else  if(currentTableNumber == 1){
                    ref.read(numberResultProvider.notifier).state += 2;
                  }else  if(currentTableNumber == 2){
                    ref.read(numberResultProvider.notifier).state += 4;
                  }else  if(currentTableNumber == 3){
                    ref.read(numberResultProvider.notifier).state += 8;
                  }else  if(currentTableNumber == 4){
                    ref.read(numberResultProvider.notifier).state += 16;
                  }
                  if(currentTableNumber < 4){
                    ref.read(tableNumberProvider.notifier).state++ ;
                  }else{
                     ref.read(tableNumberProvider.notifier).state = 0;
                     context.navigateAndRemove(NumberResultScreen(ref.watch(numberResultProvider)));
                     ref.read(numberResultProvider.notifier).state = 0;
                  }
                }, child: Text(AppLocalizations.of(context)!.include)),
              ),
            ],)
          ],
        ),
    );
  }
}
