import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:intl/intl.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registration Form';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const FormLayout(),
      ),
    );
  }
}


// Create a Form widget.
class FormLayout extends StatefulWidget {
  const FormLayout({Key? key}) : super(key: key);

  @override
  FormLayoutState createState() {
    return FormLayoutState();
  }
}
enum Raasi { Mesham, Rishabam, Simmam,Kanni }

// Create a corresponding State class.
// This class holds data related to the form.
class FormLayoutState extends State<FormLayout> {
  late DateTime selectedData;


  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  List<String> options = <String>['Mesham', 'Rishabam', 'Mithunam', 'Kadakam','Simmam','kanni','Thulam','Vrichikam','Dhanush','Makaram','Kumbham','Meenam'];
  List<String> n = <String>['Ashvini', 'Bharani', 'Karthigai', 'Rohini','Mirugasheersham','Thiruvathirai','Punarpoosam','poosam','Aayilyam','Makam','Pooram','Uthiram','Hastham','Chithirai','Swathi','Visaakam','Anusham','Kettai','Moolam','Pooradam','Utharadam','Thiruvonam','Avittam','Chathayam','Pooratathi','Uthiratathi','Revathi'];
  String dropdownValue = 'Mesham';
  List<String> mesham = ['Ashvini','Bharani'];
  List<String> kanni = ['Astham','Poosam'];
  List<String> natcha = [];

  Raasi _site = Raasi.Mesham;
   String selectedSalutation = 'Mesham';
  String selected = 'Astham';

  late String name;

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }











@override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.



  return Form(
      key: _formKey,


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,



        children: [
          SizedBox(height: 20.0,),

          Text(
            'REGISTRATION FORM',
            style: TextStyle(

                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: Constants.LORA),
          ),

          SizedBox(height: 32.0,),
          Text(
            'NAME',
            style: TextStyle(

                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
            fontFamily: Constants.LORA),
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              fillColor: Color(0XFFE0F7FA),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
              ),
              suffixIcon: Icon(Icons.person),
              hintText: 'Enter your name',


            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },


          ),
          SizedBox(height: 32.0,),
          Text(
            'PHONE',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: Constants.LORA),
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              fillColor: Color(0XFFE0F7FA),
              filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              suffixIcon: Icon(Icons.phone),
              hintText: 'Enter your phone number',


            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
              if (!phoneRegex.hasMatch(value!)) {
                return 'Please enter valid phone number';
              }
              return null;
            },



          ),
          SizedBox(height: 32.0,),
          Text(
            'APPOINTMENT DATE',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: Constants.LORA),
          ),
          SizedBox(height: 10.0,),

          //
          TextFormField(
            controller: dateinput, //editing controller of this TextField
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                fillColor: Color(0XFFE0F7FA),
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                suffixIcon: Icon(Icons.calendar_today),
                hintText: 'Appointment Date',


              ),

            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Date';
              }
              return null;
            },
            readOnly: true,  //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(),
                  firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2022),
              );

              if(pickedDate != null ){
                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  dateinput.text = formattedDate; //set output date to TextField value.
                });
              }else{
                print("Date is not selected");
              }
            },
          ),
          SizedBox(height: 32.0,),
          Text(
            'RAASI',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: Constants.LORA),
          ),
          SizedBox(height: 10.0,),
          DropdownButtonFormField<String>(
            value: selectedSalutation,

            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              fillColor: Color(0XFFE0F7FA),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
              ),

              hintText: 'Enter your Raasi',


            ),

            onChanged: (salutation) {
              if (selectedSalutation == 'Rishabam') {
                natcha = mesham;
              } else if (selectedSalutation == 'kanni') {
                natcha = kanni;
              } else {
                natcha = [];
              }
              setState(() {
                selectedSalutation = '';
                selected = selectedSalutation;
              });
            },

            validator: (value) => value == null ? 'field required' : null,
            items:
            options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                    value,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: Constants.LORA,

                ),
                textAlign: TextAlign.center,),
              );
            }).toList(),
          ),
          SizedBox(height: 32.0,),
          Text(
            'NATCHATHIRAM',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: Constants.LORA),
          ),
          SizedBox(height: 10.0,),

          DropdownButtonFormField<String>(
            value: selected,

            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              fillColor: Color(0XFFE0F7FA),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
              ),

              hintText: 'Enter your Raasi',


            ),

            onChanged: (salutation) =>
                setState(() => selected = salutation!),
            validator: (value) => value == null ? 'field required' : null,
            items:
            natcha.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: Constants.LORA,

                  ),
                  textAlign: TextAlign.center,),
              );
            }).toList(),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed:() {
                    if (_formKey.currentState!.validate()) {
                    print("Process data");
                      }
                    else {
                    print('Error');
                    }
                  },


              )),
        ],
      ),
    );
  }



}