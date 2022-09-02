import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran_khmer_online/app/quran_page/data/surah.dart';
import 'package:quran_khmer_online/app/quran_page/models/surah.dart';
import 'package:quran_khmer_online/app/quran_page/widgets/listItemWidget.dart';
import 'package:quran_khmer_online/app/schedule_page/custom_dialog_box.dart';
import 'package:quran_khmer_online/app/schedule_page/list_items_builder.dart';
import 'package:quran_khmer_online/app/schedule_page/schedule_list_tile.dart';
import 'package:quran_khmer_online/models/schedule.dart';
import 'package:quran_khmer_online/services/database.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key key}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List listItemList = surahs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  toolbarHeight: 190.0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quran Khmer',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        height: 120.0,
                        margin: EdgeInsets.only(top: 18.0),
                        padding: EdgeInsets.all(25.0),
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          "Suralar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  backgroundColor: Colors.grey.shade100,
                  elevation: 0.0,
                  toolbarHeight: 70.0,
                  pinned: true,
                  title: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        border: InputBorder.none,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        hintText: "Suralarni qidirish",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      //onChanged: (){}, //_search,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(100.0, 40.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TabBar(
                          dragStartBehavior: DragStartBehavior.down,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                          labelColor: Color.fromRGBO(197, 162, 110, 1),
                          unselectedLabelColor: Colors.grey.shade400,
                          indicatorColor: Color.fromRGBO(197, 162, 110, 1),
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(text: 'Surah'),
                            Tab(text: 'Pora'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                surahOffClass(),
                surahOffClass(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget surahOffClass() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return ListItemWidget(item: listItemList[index]);
      },
      itemCount: listItemList.length,
    );
  }

  _search({String text=""}) {
    listItemList = [];
    final List<Surah> searchedList = [];
    for (int i = 0; i < surahs.length; i++) {
      Surah item = surahs[i];
      if (item.name
          .toLowerCase()
          .contains(text.toLowerCase())) {
        searchedList.add(item);
      }
    }

    setState(() {
      listItemList = searchedList;
    });
  }

}
