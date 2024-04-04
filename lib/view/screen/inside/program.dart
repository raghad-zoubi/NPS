import 'package:nps/data/model/Program_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../controller/Inside_Controller/Program_Contoller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/alertexitapp.dart';


class Program extends StatelessWidget{
  var controller = Get.put(Program_Controller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "مدرسة الأهلية الوطنية",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

        ),

       body:
        // WillPopScope(
        //     onWillPop: alertExitApp,
        //     child:
            GetBuilder<Program_Controller>(
                builder: (controller) =>

                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget:

                        SingleChildScrollView(

                          child:
                          Column(children: [
                            Center(child:Text('البرنامج الأسبوعي   ',softWrap: true,style: TextStyle(fontSize: 30)), ) ,
                            Padding(padding: EdgeInsets.only(top: 30),
                            child:

                            PaginatedDataTable(
                              header: Text('   ',softWrap: true,style: TextStyle(fontSize: 30)),
                              rowsPerPage: 5,

                              //  availableRowsPerPage: <int>[0,0,0],
                              // onRowsPerPageChanged: (int value) {
                              //   setState(() {
                              //     _rowsPerPage = value;
                              //   });
                              // },
                              horizontalMargin: 50,

                              arrowHeadColor: Colors.purple,
                              columns: kTableColumns,
                              source: DessertDataSource(controller.details,
                                  controller.de1,controller.de2,controller.de3,controller.de4,controller.de5,
                                  controller.de6,controller.de7



                              ),
                            ),

                          ) ,
                            ShapedContainer(),
                          SizedBox(height: 129,)],)

                        )
                    ))
       );
  }
}

const kTableColumns = <DataColumn>[

  DataColumn(
    label: const Text('الحصة/اليوم',),
  ),
  DataColumn(
    label: const Text('الأولى'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('الثانية'),
    numeric: true,
  ),

  DataColumn(
    label: const Text('الثالثة'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('الرابعة'),
    numeric: true,
  ),

  DataColumn(
    label: const Text('الخامسة'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('السادسة'),
    tooltip:
    'The amount of calcium as a percentage of the recommended daily amount.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('السابعة'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('الثامنة'),
    numeric: true,
  ),
];

class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);

  final String name;
  final String calories;
  final String fat;
  final String carbs;
  final String protein;
  final String sodium;
  final String calcium;
  final String iron;

  bool selected = false;
}


class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  List<ProgramModel> _desserts;


  List <String>deher=[];
  List <String>de1;
  List <String>de2;
  List <String>de3;
  List <String>de4;
  List <String>de5;
  List <String>de6;
  List <String>de7;
  // = <Dessert>[
  //   new Dessert($, 159, 6.0, 24, 4.0, 87, 14, 1),
  //   new Dessert('  الاثنين', 237, 9.0, 37, 4.3, 129, 8, 1),
  //   new Dessert('  الثلاثاء', 262, 16.0, 24, 6.0, 337, 6, 7),
  //   new Dessert('  الأربعاء', 305, 3.7, 67, 4.3, 413, 3, 8),
  //   new Dessert('  الخميس', 356, 16.0, 49, 3.9, 327, 7, 16),
  //   new Dessert('  الجمعة ', 375, 0.0, 94, 0.0, 50, 0, 0),
  //   new Dessert('  السبت', 392, 0.2, 98, 0.0, 38, 0, 2),
  //
  // ];

  DessertDataSource(this._desserts,
      this.de1,this.de2,this.de3,this.de4,this.de5,
      this.de6,this.de7

      );

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) {return null;}

    if(_desserts[index].day=='الأحد') {
      deher.clear();
      deher.addAll(de1);
    }
    if(_desserts[index].day=='الاثنين') {
      deher.clear();
      deher.addAll(de2);
    }
    if(_desserts[index].day=='الثلاثاء') {
      deher.clear();
      deher.addAll(de3);
    }
    if(_desserts[index].day=='الأربعاء') {
      deher.clear();
      deher.addAll(de4);
    }
    if(_desserts[index].day=='الخميس') {
      deher.clear();
      deher.addAll(de5);
    }
    if(_desserts[index].day=='السيت')
    {deher.clear();
    deher.addAll(de6);
    }


    final ProgramModel dessert = _desserts[index];
    return
      DataRow(


        cells: <DataCell>[
          //     DataCell(Text('${_desserts[index].day}')),
          //     DataCell(Text('${_desserts[index].name}')),
          //     DataCell(Text('${_desserts[index+5].name}')),
          //     DataCell(Text('${_desserts[index+6].name}')),
          //     DataCell(Text('${_desserts[index+7].name}')),
          //    DataCell(Text('${_desserts[index+8].name}')),
          //   DataCell(Text('${_desserts[index+9].name}')),
          //  DataCell(Text('${_desserts[index+10].name}')),
          // DataCell(Text('${_desserts[index+11].name}')),
          DataCell(Text('${_desserts[index].day}')),
          DataCell(Text('${deher[0]}')),
          DataCell(Text('${deher[1]}')),
          DataCell(Text('${deher[2]}')),
          DataCell(Text('${deher[3]}')),
          DataCell(Text('${deher[4]}')),
          DataCell(Text('${deher[5]}')),
          DataCell(Text('${deher[6]}')),
          DataCell(Text('${deher[7]}')),

        ], );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}


class ShapedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
    //  padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width*0.7,
      height:  MediaQuery.of(context).size.height*0.05,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          'اخر تعديل منذ 2023-08-01 م',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}