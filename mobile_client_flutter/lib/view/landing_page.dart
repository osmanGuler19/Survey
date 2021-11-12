import 'package:client_flutter/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsibility Matrix',
      home: Container(
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/university_logo.svg',placeholderBuilder: (BuildContext context) => Container(
                      child: const CircularProgressIndicator()),),
                First(),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}

//!!!Make constant file and put the string there, also define styles once and use it from there

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(color: Color.fromRGBO(189, 212, 231, 1)),
        child: Column(
          children: [
            Text('The Responsibility Matrix',style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text('The responsibility Matrix a general framework to explicitly design responsibility in data science projects. The Matrix stimulates thinking along dimensions that data scientists may be prone to overlook. Using the matrix you can plan, audit, and describe a data science project. The matrix helps you to achieve the “responsible by design” as an integral part of your project. The Matrix introduces eight dimensions composed of four components and four scopes. Within a two-dimensional space several questions arise whose answer will identify the responsibilities and outlook of the project. ', style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Text('The four components of responsibility',style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text('We distilled four important dimensions of responsible approaches to data science which uniformly “tile the space” of responsible data science by design. The four components are transparency, privacy/confidentiality, accountability, and social values', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '1.Transparency: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Transparency, in general, plays an important role not only in the reproducibility of a study, but also in avoiding unwanted/unintended consequences and misinterpretation of a study. Transparency allows other researchers to check the validity of scientific methods, to ensure that desired results can be achieved and to prevent misinterpretation of the results. ')
              ]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '2. Privacy/Confidentiality: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Modern data societies are evolving the sense that certain uses of data might challenge the autonomy of data subjects, and there are several existing concepts for talking about that autonomy. ')
              ]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: 'Privacy', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ''' has been defined from various points of view, such as the law, organisation, and philosophy. However, there is no universally accepted definition of privacy. To give a relatively generic description of privacy:  
                  * as the right of a person to determine which personal information about himself/herself may be communicated to others, 
                  * as the control over access to information about oneself, 
                  * as limited access to a person and to all the features related to the person
                  * the freedom from intrusion into one's personal matters and personal information.
              '''),
              ]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '3. Accountability: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Accountability pertains to how a particular responsibility agenda is implemented and empowered within the structure of an organisation. An organisation will show its commitments to supporting responsible data science in its internal ethical stances and disciplinary processes, its organisation of teams, and budgetary priorities')
              ]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '4. Social Values: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'The social values dimension of our responsibility matrix concerns the fact that societies differ in which norms and values they prioritize, and societies often hold inconsistent or paradoxical norms and values. These norms and values can also change, often in unpredictable ways. Therefore, if an organisation needs to implement a particular responsibility agenda, it must also consider the values of the particular society in which it is embedded, and those that it interacts with. ')
              ]
            )),

            SizedBox(height: 30,),
            Text('The four scopes of responsibility',style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
             SizedBox(height: 10,),
            Text('We also identified four scopes over which the components of a responsibility agenda operate: actors/agents, objects, processes, and impacts. Here we define each briefly. ', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '1. Actors/agents. ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'These are the people and/or legal entities (such as organisations) who are involved in data science projects, such as researchers, data subjects, annotators, Mechanical Turk contractors, etc. (We discussed the possibility of including artificial intelligences here as well but decided against it because they are not considered legal persons. When their status changes, we would need to revisit this definition.)')
              ]
            )),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '2. Objects. ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'These are the objects produced by a data science life cycle, such as algorithms, databases, knowledge graphs, etc. Essentially, an object is anything that would be considered a deliverable for a client or funding agency')
              ]
            )),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.topLeft,
              child: RichText(text: TextSpan(
                style: TextStyle(fontSize: 20), 
                children: <TextSpan>[
                  TextSpan(text: '3. Processes. ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'These are the canonical components of the data science lifecycle, but they also include activities like project planning and solution scoping.')
                ]
              ),textAlign: TextAlign.left),
            ),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: '4. Impacts. ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '. These are the intended and unintended outcomes of a data science project: what change does it make in the world? How does it impact people’s lives? How does it impact innovation?')
              ]
            )),

            SizedBox(height: 30,),
            Text('The Responsibility Matrix',style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text('The result of applying the components of responsibility across the scopes of responsibility is a two-dimensional matrix of spaces that we call a “responsibility matrix.” The table below shows the responsibility matrix and defines  each cell of  the 2-dimensional space', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Image.asset('assets/images/matrix_specs.png',alignment: Alignment.center,),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()));}, child: Text('Start The Survey',style: TextStyle(fontSize: 30),),style: ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 21, 58, 1),padding: EdgeInsets.all(15),),),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}