import 'package:api_task/bloc/fetch_contents/fetchcontents_bloc.dart';
import 'package:api_task/utils/utils.dart';
import 'package:api_task/views/home/widgets/cards.dart';
import 'package:api_task/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    // Fetch the products when the widget is initialized
    context.read<FetchcontentsBloc>().add(FetchAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FetchcontentsBloc, FetchcontentsState>(
        builder: (context, state) {
          if (state is FetchcontentsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchcontentsSuccesState) {
            
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.products.length, 
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onAddToCart: (product) {
                    // Logic to add the product to the cart(need to add)
                    customSnackbar(context, 'added to cart', green);
                  },
                );
              },
            );
          } else if (state is FetchcontentsErrorState) {
            return const Center(
              child: Text('Error loading products'),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
