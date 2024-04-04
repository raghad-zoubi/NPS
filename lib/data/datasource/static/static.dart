import 'package:nps/core/constant/imgaeasset.dart';
import 'package:nps/data/model/onboarding.dart';
import 'package:get/get.dart';

import '../../model/Home_Model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "2".tr, body: "3".tr, image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "4".tr, body: "5".tr, image: AppImageAsset.onBoardingImageTwo),
//  OnBoardingModel(
    //  title: "6".tr, body: "7".tr, image: AppImageAsset.onBoardingImageThree),
];

List<homeModel> icon_home =
  [

    homeModel(
      name: 'ملاحظات الطالب',
      icon:
      'assets/images/notes.png',
      id: 0,
    ),
    homeModel(
      name: 'درجات الطالب',
      icon:
      'assets/images/grades.png',
      id: 1,
    ),
    homeModel(
      name: 'المقررات الدراسية',
      icon:
      'assets/images/courses.png',
      id: 2,

    ),
    homeModel(
      name: 'دوام الطالب',
      icon:'assets/images/absences.png',
      id: 3,

    ),



    homeModel(
      name: 'برنامج الدوام',
      icon:'assets/images/program.png',
      id: 4,


    ),
    homeModel(
      name:'اخر الأخبار',
      icon:
      'assets/images/lastNews.png',
      id:5,


    ),
    homeModel(
      name:'المدفوعات'  ,
      icon:'assets/images/payments.png',
      id: 6,

    ),

    // homeModel(
    //   name:'hairdresser',
    //   icon:
    //   'assets/images/logo.png',
    //   id: 3,
    // )




    //
    // homeModel(
    //   icon: 'assets/images/workPaper.png',
    //   name: 'أوراق العمل',
    //   id: 0,
    //
    //
    // ),
    // homeModel(
    //   name:'التسجيلات' ,
    //   icon:'assets/images/voices.png',
    //   id:1,
    //
    // ),
    // homeModel(
    // name: 'jewelery',
    // icon:'assets/images/testsPaper.png',
    // id: 5, ),
// homeModel(
//     name: 'النصائح',
//     icon:'assets/images/advices.png',
//     id: 9,
//
//   ),



  ];

List<homeModel> icon_courses =
[

homeModel(
name: 'تسجيلات',
name2: 'records',
icon:
'assets/images/voices.png',
id: 0,
),
homeModel(
name: 'نصائح دراسية',
name2: 'advices',
icon:
'assets/images/advices.png',
id: 1,
),
homeModel(
name: 'أوراق عمل',
name2: 'workpaper',
icon:
'assets/images/workPaper.png',
id: 2,

),
homeModel(
name: 'أوراق مذاكرات',
name2: 'testpaper',
icon:'assets/images/testsPaper.png',
id: 3,

),
];



List<homeModel> icon_ads =
[

homeModel(
name: 'للمدرسة',
  nameads: 1,
icon:
'assets/images/voices.png',
id: 0,
),
homeModel(
name: 'للصفوف',
  nameads:2,
icon:
'assets/images/advices.png',
id: 1,
),
];



