import 'dart:io';

import 'package:flutter/material.dart';

import 'package:borrowed_stuff/models/stuff.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StuffCard extends StatelessWidget {
  final Stuff? stuff;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;

  StuffCard({
    Key? key,
    this.stuff,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSlidableStuffCard();
  }

  _buildStuffCard(Stuff stuff) {
    return Card(
      child: ListTile(
        title: Text(stuff.description!),
        subtitle: Text(stuff.contactName!),
        leading: CircleAvatar(
          child: stuff.photoExist ? null : Text('${stuff.description!.toUpperCase()[0]}'),
          backgroundImage: stuff.photoExist ? FileImage(File(stuff.photoPath!)) : null,
        ),
        trailing: Text(stuff.loadDateString),
      ),
    );
  }

  _buildSlidableStuffCard() {
    return Slidable(
      key: const ValueKey(0),
      child: _buildStuffCard(stuff!),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(
        //   closeOnCancel: true,
        //   onDismissed: () {
        //     print('object');
        //   },
        // ),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: onEdit,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Editar',
          ),
          SlidableAction(
            flex: 2,
            onPressed: onDelete,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Excluir',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (x) {},
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            flex: 2,
            onPressed: (x) {},
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),
    );
  }
}
