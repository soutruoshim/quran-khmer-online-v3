import 'package:flutter/material.dart';
import 'package:quran_khmer_online/app/quran_page/models/surah.dart';
import 'borderNumber.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({ @required this.item});
  final Surah item;

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: BorderNumber(number: int.parse(widget.item.id)),
      ),
      title: Text(widget.item.name, style: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("${widget.item.place} - ${widget.item.count} ayat"),
      trailing: Text(widget.item.translatedAr, style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(163, 129, 80, 1),
          fontSize: 20.0),
      ),
      onTap: (){
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemshowPage(itemlar: widget.item,)));
      },
    );
  }
}
