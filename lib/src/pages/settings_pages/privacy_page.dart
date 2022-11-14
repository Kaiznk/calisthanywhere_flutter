import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Container(
          padding: EdgeInsets.all(6.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontSize: 21.0, fontFamily: 'sans-serif-medium'),
                ),
              ),
              SizedBox(
                height: 11.0,
              ),
              Text('Last updated July 13, 2022\n'),
              SizedBox(
                height: 21.0,
              ),
              Text(
                  'This privacy notice for Kainznk Inc. ("Company," "we," "us," or "our"), describes how and why we might collect, store, use, and/or share ("process") your information when you use our services ("Services"), such as when you:'),
              SizedBox(
                height: 11.0,
              ),
              Text('• Download and use our mobile application (CalisthAnyWhere), or any other application of ours that links to this privacy notice \n' +
                  '• Engage with us in other related ways, including any sales, marketing, or events'),
              SizedBox(
                height: 11.0,
              ),
              Text(
                  'Questions or concerns? Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at kaiznkinc@gmail.com.'),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'Summary of key point',
                style:
                    TextStyle(fontSize: 18.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 21.0,
              ),
              Text(
                  'This summary provides key points from our privacy notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our table of contents below to find the section you are looking for.'),
              SizedBox(
                height: 11.0,
              ),
              SizedBox(
                height: 11.0,
              ),
              Text("What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with Kainznk Inc. and the Services, the choices you make, and the products and features you use. \n\n" +
                  "Do we process any sensitive personal information? We do not process sensitive personal information.\n\n"
                      "Do we receive any information from third parties? We do not receive any information from third parties.\n\n"
                      "How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so.\n\n"
                      "In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. \n\n"
                      "How do we keep your information safe? We have organizational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. \n\n"
                      "What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. \n\n"
                      "How do you exercise your rights? The easiest way to exercise your rights is by filling out our data subject request form available here, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'What information do we collect?',
                style:
                    TextStyle(fontSize: 20.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'Personal information you disclose to us',
                style:
                    TextStyle(fontSize: 18.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "We collect personal information that you provide to us.\n\n" +
                    "We collect personal information that you voluntarily provide to us when you express an interest in obtaining information about us or our products and Services, when you participate in activities on the Services, or otherwise when you contact us.\n\n" +
                    "Personal Information Provided by You. The personal information that we collect depends on the context of your interactions with us and the Services, the choices you make, and the products and features you use. The personal information we collect may include the following:\n\n" +
                    " • names\n" +
                    " • usernames\n" +
                    " • passwords\n\n" +
                    "Sensitive Information. We do not process sensitive information.",
              ),
              SizedBox(
                height: 11.0,
              ),
              Text('Application Data. If you use our application(s), we also may collect the following information if you choose to provide us with access or permission:\n\n' +
                  "        • Push Notifications. We may request to send you push notifications regarding your account or certain features of the application(s). If you wish to opt out from receiving these types of communications, you may turn them off in your device's settings.\n\n" +
                  "This information is primarily needed to maintain the security and operation of our application(s), for troubleshooting, and for our internal analytics and reporting purposes.\n\n" +
                  "All personal information that you provide to us must be true, complete, and accurate, and you must notify us of any changes to such personal information."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'How do we process your information?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  " We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'When and with whom do we share your personal information?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text("We may share information in specific situations described in this section and/or with the following third parties.\n\n" +
                  "We may need to share your personal information in the following situations:\n\n" +
                  "     • Business Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'Is your information transferred internationlly?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text("We may transfer, store, and process your information in countries other than your own.\n\n" +
                  'Our servers are located in. If you are accessing our Services from outside, please be aware that your information may be transferred to, stored, and processed by us in our facilities and by those third parties with whom we may share your personal information in and other countries.\n\n' +
                  "If you are a resident in the European Economic Area (EEA) or United Kingdom (UK), then these countries may not necessarily have data protection laws or other similar laws as comprehensive as those in your country. However, we will take all necessary measures to protect your personal information in accordance with this privacy notice and applicable law."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'How long do we keep your information?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(" We keep your information for as long as necessary to fulfill the purposes outlined in this privacy notice unless otherwise required by law.\n\n" +
                  "We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting, or other legal requirements). No purpose in this notice will require us keeping your personal information for longer than 90 days.\n\n"
                      "When we have no ongoing legitimate business need to process your personal information, we will either delete or anonymize such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'How do we keep your informatioon safe?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('We aim to protect your personal information through a system of organizational and technical security measures.\n\n' +
                  'We have implemented appropriate and reasonable technical and organizational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our Services is at your own risk. You should only access the Services within a secure environment.'),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'What are your privacy rights?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('You may review, change, or terminate your account at any time.\n\n' +
                  'If you are located in the EEA or UK and you believe we are unlawfully processing your personal information, you also have the right to complain to your local data protection supervisory authority. You can find their contact details here: \n https://ec.europa.eu/justice/data-protection/bodies/authorities/index_en.htm.\n\n' +
                  'If you are located in Switzerland, the contact details for the data protection authorities are available here: \n https://www.edoeb.admin.ch/edoeb/en/home.html.\n\n' +
                  'Withdrawing your consent: If we are relying on your consent to process your personal information, which may be express and/or implied consent depending on the applicable law, you have the right to withdraw your consent at any time. You can withdraw your consent at any time by contacting us by using the contact details provided in the section "HOW CAN YOU CONTACT US ABOUT THIS NOTICE?" below.\n\n' +
                  'However, please note that this will not affect the lawfulness of the processing before its withdrawal, nor when applicable law allows, will it affect the processing of your personal information conducted in reliance on lawful processing grounds other than consent.'),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Controls for do-not-track features',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  "Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track ('DNT') feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage no uniform technology standard for recognizing and implementing DNT signals has been finalized. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice."),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'Do California resident have specific privacy rights?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Yes, if you are a resident of California, you are granted specific rights regarding access to your personal information.\n\n' +
                  'California Civil Code Section 1798.83, also known as the "Shine The Light" law, permits our users who are California residents to request and obtain from us, once a year and free of charge, information about categories of personal information (if any) we disclosed to third parties for direct marketing purposes and the names and addresses of all third parties with which we shared personal information in the immediately preceding calendar year. If you are a California resident and would like to make such a request, please submit your request in writing to us using the contact information provided below.\n\n' +
                  'If you are under 18 years of age, reside in California, and have a registered account with Services, you have the right to request removal of unwanted data that you publicly post on the Services. To request removal of such data, please contact us using the contact information provided below and include the email address associated with your account and a statement that you reside in California. We will make sure the data is not publicly displayed on the Services, but please be aware that the data may not be completely or comprehensively removed from all our systems (e.g., backups, etc.).'),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'Do we make updates to this notice',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Yes, we will update this notice as necessary to stay compliant with relevant laws.\n\n\ ' +
                  'We may update this privacy notice from time to time. The updated version will be indicated by an updated "Revised" date and the updated version will be effective as soon as it is accessible. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information.'),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'How can you contact us about this notice?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  'If you have questions or comments about this notice, you may email us at kaiznkinc@gmail.com'),
              SizedBox(
                height: 21.0,
              ),
              Text(
                'How can you review, update, or delete the data we collect from you?',
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  "Based on the applicable laws of your country, you may have the right to request access to the personal information we collect from you, change that information, or delete it."),
              SizedBox(
                height: 17.0,
              )
            ],
          )),
    );
  }
}
