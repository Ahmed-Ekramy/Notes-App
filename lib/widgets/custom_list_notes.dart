import 'package:flutter/material.dart';

import '../views/edite_note.dart';

class CustomListNotes extends StatelessWidget {
  const CustomListNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditeNote()));
            },
            child: Container(
              padding:  EdgeInsets.symmetric( horizontal: 15,vertical: 10),
              margin:  EdgeInsets.symmetric( horizontal: 20,vertical: 10),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'No Notes Yet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Add a new note to get started with your notes.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis ,
                          style: TextStyle(
            
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.delete, size: 30,color:  Colors.red,),
                      Spacer(),
                      Text(
                        'may 21,2002',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
