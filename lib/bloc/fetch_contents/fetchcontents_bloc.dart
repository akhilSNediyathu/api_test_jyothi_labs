import 'dart:convert';

import 'package:api_task/models/productmodel.dart';
import 'package:api_task/repo/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetchcontents_event.dart';
part 'fetchcontents_state.dart';

class FetchcontentsBloc extends Bloc<FetchcontentsEvent, FetchcontentsState> {
  FetchcontentsBloc() : super(FetchcontentsInitial()) {
    on<FetchAllProducts>((event, emit) async {
      emit(FetchcontentsLoadingState());
      
      final response = await AuthenticationRepo.fetchProducts();

      if (response != null && response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        
        // Assuming the response is a map with a key 'products' that contains the list of products
        List<dynamic> productsJson = responseBody['products'];
        List<ProductResponse> products = productsJson
            .map((json) => ProductResponse.fromJson(json))
            .toList();

        emit(FetchcontentsSuccesState(products: products));
      } else {
        emit(FetchcontentsErrorState());
      }
    });
  }
}
