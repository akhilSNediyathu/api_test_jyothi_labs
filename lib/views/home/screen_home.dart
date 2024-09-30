import 'package:api_task/bloc/fetch_contents/fetchcontents_bloc.dart';

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
    context.read<FetchcontentsBloc>().add(FetchAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('products'),
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
            return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                      title: Text(state.products[index].products[index].title),
                      leading: CircleAvatar(
                        child: Image.network(
                            state.products[index].products[index].images[0]),
                      ),
                    ),
                itemCount: 10);
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
