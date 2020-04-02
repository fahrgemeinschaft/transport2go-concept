import 'package:flutter/material.dart';

class DescriptionOfferCard extends StatefulWidget {
  DescriptionOfferCard({Key key}) : super(key: key);

  @override
  DescriptionOfferCardState createState() => DescriptionOfferCardState();
}

class DescriptionOfferCardState extends State<DescriptionOfferCard> {
  TextEditingController _descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ListTile(
        title: TextField(
          controller: _descriptionTextController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          enableInteractiveSelection: true,
          decoration: InputDecoration(hintText: "Hier bitte eine Beschreibung einfügen"),
          toolbarOptions: ToolbarOptions(copy: true),
        ),
      ),
    );
  }

  String getDescription() {
    return _descriptionTextController.text;
  }
}
