import 'package:bloc/bloc.dart';
import 'package:ecommerce/ecommerce/HiveData.dart';
import 'package:meta/meta.dart';

import '../../model/salesModel.dart';

part 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  SalesCubit() : super(SalesInitial());

  void remove(int index) {
    emit(SalesLoading());
    HiveHelper.removeItem(index);
    emit(SalesSuccess());
  }

  void removeAll() {
    emit(SalesLoading());
    HiveHelper.removeAll();
    emit(SalesSuccess());
  }

  // int count = 1;

  // void getCount(String sign) {
  //   emit(SalesLoading());
  //   if (sign == "+") {
  //     count = count + 1;
  //   } else if (sign == "-") {
  //     if (count != 1) count = count - 1;
  //   }
  //   print(HiveHelper.Sales[0]["price"]);
  //   emit(SalesSuccess());
  // }

  // countList(index) {
  //   print(HiveHelper.Sales[index]["price"] + "firsttttttttttttttttttt");

  //   HiveHelper.Sales[index]["price"] = count * HiveHelper.Sales[index]["price"];
  //   print(HiveHelper.Sales[index]["price"] + "seconddddddddddddddddd");
  // }

// final int countt= count;
  // num totall = 0;
//
  // num totalPPrice() {
  //   emit(SalesLoading());
  //   emit(SalesSuccess());
  //   return HiveHelper.total;
  // }
}
