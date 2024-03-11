// import 'dart:convert';
// import 'package:bagianjosh/pages/tapBar_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gabunginfrontend/Alen/nutrisi_search/controller.dart';
import 'package:gabunginfrontend/pages/tapBar_search.dart';
// import 'package:gabunginfrontend/pages/tapBar_search.dart';
// import 'package:http/http.dart' as http;

class SearchNutrisi extends StatefulWidget {
  const SearchNutrisi({super.key});

  @override
  State<SearchNutrisi> createState() => _SearchNutrisiState();
}

class _SearchNutrisiState extends State<SearchNutrisi> {
  DropDownApi? dropDownApi;
  final controller = Controller();

  var selectedItem = null;
  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            "Mau penuhi nutrisi apa hari ini?",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        

        
        //Search Bar

        dropDownApi == null
          ? const CircularProgressIndicator()
          : DropdownButton<Nutrition>(
              isExpanded: true,
              hint: Text("Pilih nutrisimu!"),
              items: dropDownApi!.nutritionList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name, style: Theme.of(context).textTheme.bodyText1,),
                      ))
                  .toList(),
              onChanged: (Nutrition? value) {
                setState(() {
                selectedItem = value?.name.toString();
                TapBar.previousSearchs.add(selectedItem.toString());
              });
              },
            ),

    

        // DropdownSearch<String>(
        //   popupProps: PopupProps.menu(
        //     showSelectedItems: true,
        //     showSearchBox: true,
        //   ),
        //   items: dropDownApi!.nutritionList.map((e) => DropdownMenuItem(
        //     value: e,
        //     child: Text(e.name),)).toList(),
        //   dropdownButtonProps: DropdownButtonProps(color: Color(0xff3C6142)),
        //   dropdownDecoratorProps: DropDownDecoratorProps(
        //     dropdownSearchDecoration: InputDecoration(
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: Color(0xff3C6142)),
        //         borderRadius: BorderRadius.circular(10)
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: Color(0xff3C6142)),
        //         borderRadius: BorderRadius.circular(10)
        //       ),
        //       prefixIcon: Icon(Icons.search),
        //       hintText: "Pilih nutrisimu!"
        //     ),
        //   ),
        //   onChanged: (value){
        //     // val = value as int;
        //     setState(() {
        //       selectedItem = value.toString();
        //       TapBar.previousSearchs.add(selectedItem);
        //     });
        //   },
        //   selectedItem: selectedItem,
          
        // ),
        SizedBox(
          height: 20,
        ),

        //Previous Searches
        Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: TapBar.previousSearchs.length,
          itemBuilder: (context, index)=>previousSearchItem(index)),
        ),

        SizedBox(
          height: 20,
        ),

        //Search Suggestions
        Container(
          width: double.infinity,
          // padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sugesti Pencarian", style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 20,),
              Wrap(
                spacing: 10,
                children: dropDownApi != null ? dropDownApi!.nutritionList.map<Widget>((e){
                  return searchSuggestionItem(e.name);
                }).toList() : []

              ),
              ],
          ),
        ),
                // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: dropDownApi?.nutritionList.length,
                  //   itemBuilder: (context, index){
                  //     Nutrition nutrition = dropDownApi!.nutritionList[index];
                  //     return searchSuggestionItem('${nutrition.name}');
                  //   }
                  // ),
        SizedBox(
          height: 20,
        ),

      ],
    ));
  }
  @override
  void initState() {
    super.initState();
    getDropDownData();
  }

  Future<void> getDropDownData() async {
    var hasil = await controller.fetchApiDropDown();
    setState(() {
      dropDownApi = hasil;
    });
  }

}

String selectNutri = "";

final nutriSelected = TextEditingController();

//list of strings nutrisi (dropdown)

List<String> nutritions = [
  "Protein",
  "Serat",
  "Karbohidrat",
  "Lemak",
  "Vitamin C",
  "Zink",
  "Mineral"
];

previousSearchItem(int index){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    child: InkWell(
      onTap: () {},
      // child: Dismissible(
      //   key: GlobalKey(),
      //   onDismissed: (DismissDirection dir){
      //     setState()
      //     TapBar.previousSearchs.removeAt(index);
      //   },
        child: Row(
          children: [
            const Icon(Icons.history, color: Colors.grey,),
            const SizedBox(width: 10,),
            Text(TapBar.previousSearchs[index]),
            Spacer(),
            Icon(
              Icons.call_made_outlined,
              color: Colors.grey,
            )
          ],
        ),
      // ),
    ),
  );
}

searchSuggestionItem(String suggestText){
  return Container(
    // width: double.infinity,
    margin: EdgeInsets.only(bottom: 15),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      border: Border.all(
        width: 1,
        color: Colors.black26
      ),
      borderRadius: BorderRadius.circular(30)),
    child: Text(
      suggestText,
      style: TextStyle(color: Color(0xff3C6142)),
    ),

  );
}

