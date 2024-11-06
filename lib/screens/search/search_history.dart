import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:flutter/material.dart';

import '../../model/search_model/search_history_model/popular_search_model.dart';
import '../../model/search_model/search_history_model/search_history_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getsearchhistory();
    getpopularsearch();
  }

//SearchHistory
  List<SearchHistoryList> searchhistorypage = [];
  List<SearchHistoryList> searchhistorypageAll = [];
  bool isLoading = false;

  Future getsearchhistory() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getsearchhistory();
      var response = searchhistorypageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          searchhistorypage = response.list;
          searchhistorypageAll = searchhistorypage;
          isLoading = false;
        });
      } else {
        setState(() {
          searchhistorypage = [];
          searchhistorypageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        searchhistorypage = [];
        searchhistorypageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

//popularSearch
  List<PopularSearchs> popularsearchpage = [];
  List<PopularSearchs> popularsearchpageAll = [];
  bool isLoading1 = false;

  Future getpopularsearch() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getpopularsearch();
      var response = popularsearchpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          popularsearchpage = response.list;
          popularsearchpageAll = popularsearchpage;
          isLoading1 = false;
        });
      } else {
        setState(() {
          searchhistorypage = [];
          searchhistorypageAll = [];
          isLoading1 = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        searchhistorypage = [];
        searchhistorypageAll = [];
        isLoading1 = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: AppColors.e_primary,
                decoration: InputDecoration(
                  suffix: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        color: AppColors.e_primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: AppColors.e_grey1,
                  ),
                  hintText: 'Search Beverage or Foods',
                  hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingWidget(
                    title: 'Search History',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  HeadingWidget(
                    title: 'Delete',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.e_primary,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: searchhistorypage.map((item) {
                  return Chip(
                    side: BorderSide.none,
                    backgroundColor: AppColors.e_lightgreen,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.image != null)
                          Image.asset(
                            item.image.toString(),
                            width: 16,
                            height: 16,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          item.title.toString(),
                          style: TextStyle(color: AppColors.e_primary),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingWidget(
                    title: 'Popular Search',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: popularsearchpage.map((item) {
                  return Chip(
                    side: BorderSide.none,
                    backgroundColor: AppColors.e_lightgreen,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item.image.toString(),
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.title.toString(),
                          style: TextStyle(color: AppColors.e_primary),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
