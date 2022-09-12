import 'package:flutter/material.dart';
import 'package:tampo/Data/data.dart';
import 'package:tampo/Screens/detailsScreen.dart';
import 'package:tampo/models/userModels.dart';
import 'package:tampo/utills/widgest/Text/MediumBoldText.dart';
import 'package:tampo/utills/widgest/Text/NumberText.dart';
import 'package:azlistview/azlistview.dart';

class ContactList extends StatefulWidget {

  TextEditingController controller;

  ContactList({
   required this.controller
});


  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  List <UserModel> contacts=[];
  List <UserModel> contactsFiltered=[];


  @override
  void initState() {
    // TODO: implement initState
    getAllContacts();
    widget.controller.addListener(() {
      filterContacts();
    });
    super.initState();

  }

  Future <List<UserModel>> getAllContacts() async{

    List<UserModel> _contact = await Data().getData();
    print(contactsFiltered);

    setState((){
      contacts=_contact;
    });
   return contacts;


  }

  /// This will return true if the searchterm is in our list
  filterContacts(){
    List <UserModel> _contacts =[];
    _contacts.addAll(contacts);
    if(widget.controller.text.isNotEmpty){
      _contacts.retainWhere((contact){
        String searchTerm=widget.controller.text.toLowerCase();
        String contactName = contact.FirstName.toLowerCase();
        return contactName.contains(searchTerm);  // This will True or false
      });
      setState((){
        contactsFiltered=_contacts;
      });
    }
  }

Future <List<UserModel>> getMyContact() async{
    if(widget.controller.text.isNotEmpty && contactsFiltered.isNotEmpty){

      return  contactsFiltered;
    }
    else{
      return  contacts;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double heightD = MediaQuery.of(context).size.height;
    final double widthD = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: getMyContact(),
        builder: (context,data){
          if(data.hasError){
            return const Center(
              child: Text('Error Occured \n try again'),);}
          else if(data.hasData){
            var Data = data.data as List<UserModel> ;
            /// Sorting The Data
            Data.sort((a,b)=>a.FirstName.compareTo(b.FirstName));

            return ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: AzListView(
                indexBarItemHeight: heightD/55,
                physics: ClampingScrollPhysics(),
                data: Data,
                itemCount: Data.length,
                itemBuilder: (context,index){
                  return InkWell( //Push Route
                    onTap: (){
                      print(MediaQuery.of(context).size.height);
                      print(MediaQuery.of(context).size.width);
                      FocusScope.of(context).unfocus();
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DetailScreen(
                            ProfilePic: Data[index].NetworkImage,
                            FirstName: Data[index].FirstName,
                            LastName: Data[index].LastName,
                            MobileNumber:Data[index].MobileNumber);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(heightD/86.9),
                      child: Row(
                        children:[
                        // Profile Pic
                          Container(
                            height: heightD/13,
                            width: widthD/6.8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${Data[index].NetworkImage}'),
                                    colorFilter: ColorFilter.mode(Colors.lightGreenAccent,BlendMode.color)
                                ),
                                borderRadius: BorderRadius.circular(widthD/27.46)
                            ),
                          ),
                          SizedBox(width: widthD/20.6,),
                          // Name and Mobile Number + Border
                          Expanded(
                            child: Container(
                              height: heightD/13,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey.withOpacity(0.5))
                                  )
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MediumText(
                                    text: '${Data[index].FirstName} ${Data[index].LastName} ',
                                    size: widthD/20.6,color: Colors.black54,),
                                  SizedBox(height: 5,),
                                  NumText(text: '(907)  ${Data[index].MobileNumber}'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );

  }
}


