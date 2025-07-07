import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/home/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_app2/feature/home/presentation/blocs/search_bloc/search_event.dart';
import 'package:my_app2/feature/home/presentation/blocs/search_bloc/search_state.dart';
import 'package:my_app2/feature/home/presentation/screens/search/filter.dart';
import 'package:my_app2/feature/home/presentation/screens/search/search_empty.dart';
import 'package:my_app2/feature/home/presentation/screens/search/search_not_empty.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBloc>().add(SearchText(''));
      searchController.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Column(
          children: [
            SizedBox(height: 20),
            Row(
              spacing: 15,
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                  onTap: () {
                    context.pop();
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                     onChanged: (value) {
    context.read<SearchBloc>().add(SearchText(value));
  },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          filter(context);
                         
                          
                        },
                        icon: Icon(Icons.filter_list, size: 28),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          } else if (state is SearchNotFaund) {
            return Center(child: Text("Qidiruv bo'yicha natijalar yo'q"),);
          } else if (state is SearchLoaded) {
            return SearchNotEmpty(state.products);
          }
          return SearchEmpty();
        },
      ),
    );
  }
}
