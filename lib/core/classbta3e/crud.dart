// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dartz/dartz.dart';
// import 'package:nps/core/class/statusrequest.dart';
// import 'package:nps/core/function/checkinternet.dart';
//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(
//       {required String linkurl,
//       required Map data,
//       required Map<String, String>? headers}) async {
//     try {
//       if (await checkInternet()) {
//         String name = data['email'];
//         String pass = data['password'];
//         //String link = "https://ma5znsyria.com/test/login.php?user=$name&pw=$pass";
//         String link = "https://ma5znsyria.com/test/login.php?user=aschool&pw=Ty%i8n";
//         print("link is:=>>"+link.trim());
//         var response = await http.post(Uri.parse(link), headers: headers);
//         print("respons---"+response.toString());
//         print( response.statusCode);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (_) {
//       return const Left(StatusRequest.serverException); //no conect whith server
//     }
//   }
//
//   Future<Either<StatusRequest, Map>> getData(
//       {required String linkurl, required Map<String, String>? headers}) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.get(Uri.parse(linkurl), headers: headers);
//         // print("=====befor200==============");
//         // print(response);
//         // print("==========================");
//
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       // print(e);
//       return const Left(StatusRequest.serverException); //no conect whith server
//     }
//   }
// }
