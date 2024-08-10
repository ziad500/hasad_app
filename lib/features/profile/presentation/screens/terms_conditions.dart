import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/constants.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Constants.isArabic
        ? DefaultScaffold(
            appbarTitle: title ?? 'الشروط والأحكام',
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSectionTitle('1- الزامية الشروط والأحكام'),
                  _buildSectionContent(
                    'تعتبر هذه الشروط والأحكام اتفاقية ملزمة بين تطبيق مزاد حصاد والمستخدم، وتنظم استخدامك لتطبيق مزاد حصاد، '
                    'وبمجرد الموافقة على هذه الشروط والاحكام وذلك بالنقر على "أقر أنني أوافق على شروط وأحكام المزاد" ستقر أنك علمت بمحتواها ومضمونها علماً نافياً للجهالة.',
                  ),
                  _buildSectionContent(
                    'قد يتم تطبيق بعض الشروط والأحكام التكميلية على مزاد حصاد (سياسة الاستخدام لبعض المزادات المتعلقة بحملات محددة)، '
                    'وسيتم الإفصاح للمستخدم عن هذه الشروط التكميلية "إن وجدت"، وتسري الشروط التكميلية في حالة وجود تعارض بينها وبين هذه الشروط والأحكام.',
                  ),
                  _buildSectionTitle('2- التسجيل'),
                  _buildSectionContent(
                    'في حال الموافقة على هذه الشروط والاحكام فيمكنك الدخول على هذا التطبيق والاستفادة من خدماتنا على الصعيدين التجاري والشخصي، '
                    'ومن أجل استخدام خدمات تطبيق حصاد، يتعين عليك ما يلي:\n\n'
                    '1- التسجيل للحصول على حساب مستخدمً شخصي فعال والمحافظة عليه (الحساب).\n'
                    '2- يجب ألا يقل عمر المستخدم عن 18 عاما حتى يتسنى لك الحصول على حساب.\n'
                    '3- يتعهد المستخدم (بائع أو مشتري او مزايًدا) بعد تفعيل الحساب عدم منحه لأي مستخدم آخر، '
                    'وسيكون للمؤسسة حق مقاضاته في حال اتضح أن معلومات المستخدم المقدمة لها صورية أو غير مطابقة للواقع او أن يكون الاسم غير لائق.\n'
                    '4- يحظر على المستخدم استخدام أي شخصية طبيعية أو معنوية للمزايدة باسمها وأنه في حال اتضح لإدارة تطبيق حصاد للمزادات أن هناك أي تلاعب '
                    'في هوية المستخدم أو الحساب البنكي أو اي معلومات صورية/غير صحيحة تم تزويدها لإدارة تطبيق حصاد للمزادات يحق لها مصادرة عربون السلعة بالأضافة إلى رسوم دخول المزاد.\n'
                    '5- يجب الاقرار بأن جميع الشروط والأحكام منطبقة على المستخدم وأنه من جائزي الأهلية، كما يقر أن أنظمة المملكة العربية السعودية قد سمحت له '
                    'باستخدام هذا التطبيق ولا يخالف أياً منها، ويتطلب ايًضا تسجيل الحساب وتقديم بعض المعلومات الشخصية إلى تطبيق حصاد، مثل اسمك وعنوانك ورقم هاتفك الجوال '
                    'وجنسك وعمرك ورقم هويتك والمستندات اللازمة التي تطلبها مؤسسة منصة الحصاد للمزادات لتمام عملية التسجيل وتفعيل عضوية المستخدم.\n'
                    '6- الموافقة على تدوين معلومات دقيقة وكاملة وحديثة في حساب المستخدم الخاص. قد ينجم عن عدم التزامك بإدخال هذه المعلومات إلى عدم تمكنك من '
                    'الوصول إلى تطبيق حصاد واستخدامه، أو إلى حظر الحساب أو إغلاقه.\n'
                    '7- يتحمل المستخدم المسؤولية عن سائر الأنشطة التي تجري في حسابه، ويوافق على الحفاظ على أمان اسم المستخدم وكلمة المرور الخاصين بحسابه وسريتهما '
                    'في جميع الأوقات، ولا يحق له امتلاك أكثر من حساب واحد فقط ما لم يسمح تطبيق حصاد بخلاف ذلك.\n'
                    '8- يقر المستخدم بأنه يمتلك أهلية قانونية ونظامية وشرعية كاملة (أهلية وجوب واداء) وأن اهليته لا يشوبها أي من نواقص الأهلية المقررة شرعاً ونظاماً، '
                    'كما يقر أن الأنظمة تخوله حق امتلاك وشراء المنتجات الزراعية في المملكة العربية السعودية وأنه لايوجد عليه أي مانع من موانع إتمام عملية الشراء كما يقر أنه لا يوجد ما '
                    'يمنع انتقال ملكية المنتجات الزراعية على سبيل المثال لا الحصر: نقص الأهلية او غيرها.\n'
                    '9- ينبغي على المستخدم في المحادثة الفورية أن يلتزم بآداب الحوار، ولا يتطرق لأي مواضيع خارج نطاق البيع أو الشراء أوالمزايدة أو استخدام كلمات غير لائقة أو التحدث '
                    'بسيادة الدولة أو أي أمور سياسية أو أي تشهير، وقذف للبائع أو الوسطاء.\n'
                    '10- يتطلب من المستخدم في حال كان المستخدم مقيم داخل المملكة العربية السعودية ولديه إقامة سارية المفعول تخوله بممارسة بيع وشراء المنتجات الزراعية '
                    'فإنه سيطلب منه بيانات الكفيل وتفويض البيع والشراء وغيرها من البيانات التي قد يطلبها التطبيق أو أحد التابعين أو الموظفين فيها.\n'
                    '11- تتحمل المسؤولية عن سائر العمليات والاوامر التي تجري في حسابك.\n'
                    '12- يجب تحديث البيانات فوراً عند تغيرها لأي سبب وتشمل جميع البيانات (البيانات الشخصية و المالية و غيرها من البيانات).',
                  ),
                  _buildSectionTitle('مخالفات التسجيل'),
                  _buildSectionContent(
                    'تتعهد كمستخدم بعد تفعيل حسابك عدم منحه لأي مستخدم آخر، وسيكون للشركة حق مقاضاتك في حال اتضح أن معلومات المستخدم المقدمة لها صورية أو غير مطابقة للواقع، كما يحضر عليك كمستخدم استخدام اسم أي شخصية طبيعية أو معنوية للمزايدة باسمها دون تفويض رسمي، وإذا اتضح لإدارة المزاد أن هناك أي تلاعب في هوية المستخدم، أو في حسابه البنكي، أو في بطاقة المزايدة، أو أي معلومات؛ فإنه يحق للشركة على سبيل المثال لا الحصر ما يلي:\n\n'
                    '1. سحب فوري أو مؤقت أو دائم لحقك في استخدام تطبيق مزاد حصاد مع حظر لرقم هويتك / إقامتك.\n'
                    '2. الإفصاح عن هذه المعلومات إلى السلطات المكلَّفة بإنفاذ القانون وفقًا لما تراه ضروريًّا.\n'
                    '3. مصادرة تأمين دخول المزاد.\n'
                    '4. تعويض المؤسسة عن أي مبالغ دفعتها المؤسسة بناءً على تلك المخالفات، بما في ذلك على سبيل المثال لا الحصر: التكاليف الإدارية والقانونية الناتجة عن المخالفات.',
                  ),
                  _buildSectionTitle('3- أحكام البائع'),
                  _buildSectionContent(
                    '١- (فرد/ مؤسسة/ شركة) بدفع رسوم ما بعد البيع بحسب ما هو مدرج في التطبيق.\n'
                    '2- إذا كان مالك المنتج يتمثل في جهة مالية يتم التعامل معه على انه عميل تسري عليه شروط واحكام البيع ولا تتحمل مؤسسة منصة الحصاد او التطبيق اي نزاع بينه وبين اي جهة متعاقدة معه في حال البيع بحسب السعر المتفق عليه مع الجهة المالية.\n'
                    '3- يتعين على مالك المنتج الافصاح عن أية نواقص في السلعة ويتعهد مالك المنتج بأن السلع مطابقة للمواصفات والمعايير المعتمدة.\n'
                    '4- مالك المنتج مخير بإنشاء تقرير فحص للسلعة.\n'
                    '5- إذا كان البائع وسيطًا فلا بد ان يقدم المستند اللازم الذي يخوله بيع السلعة من خلال تطبيق حصاد.\n'
                    '6- لا يحق مالك المنتج طلب إيقاف المزاد قبل الوقت المحدد لانتهائه وفي حال وجود أي رسوم لم يتم سدادها يكون ملزمًا بسدادها قبل إيقاف المزاد على السلعة.\n'
                    '7- توفر إدارة التطبيق خدمات المعاينة و التفتيش والنقل عن طريق خانة فروت بروكر عن طريق وسطاء مسجلين في النظام ويتم احتساب قيمة النقل من موقع البائع الى موقع المشتري برسوم معينة حسب الاتفاق بين البائع او المشتري مع مقدم الخدمة (فروت بروكر) ويتم احتساب تكلفة خدمة المعاينة اوالتفتيش اوالاستلام نيابة عن المشتري حسب الاتفاق بين الطرفين.\n'
                    '8- يكون مالك المنتج مسؤوًلا عن السلعة اثناء نقلها امام الجهات الرسمية والأمنية و مؤسسة منصة الحصاد للمزادات تخلي مسؤوليتها في حال وجود أي ًملاحظات او عوائق من قبل الجهات الرسمية والأمنية تمنع مزاد حصاد من إتمام الصفقة الخاصة بالسلعة ويكون الزامًا على مالك المنتج بسداد رسوم الخدمة برغم ذلك.\n'
                    '9- في حال تعرض السلعة لأي تلفيات او حوادث اثناء نقلها فإن مؤسسة منصة حصاد غير مسؤولة عن المطالبة المالية او التأمينية من الشركة الناقلة او المشتري.\n'
                    '10. ُيحدد ميعاد البيع بتطبيق حصاد باليوم، والساعة ومكان تواجد السلع وذلك حسب جاهزية السلعة لعرضها على المنصة الالكترونية بمزاد علني.\n'
                    '11- ُيقوم البائع بدفع تأمين دخول المزاد  للسلعة المراد بيعها بحسب النسبة المتفق عليها او المدرجة في التطبيق والمقدرة بـ 10% (قابلة للزيادة أو النقصان حسب الاتفاق).\n'
                    '12- تتعهد مؤسسة منصة حصاد للمزادات في حال تم البيع من خلال تطبيق حصاد سواء كان المزاد مباشر أو عكسي بإعادة مبلغ التأمين المودع في حال عدم مخالفة البائع أي من الشروط والاحكام. في حال تمت مخالفة البائع لأي من هذه الشروط فلن يتم استرجاع مبلغ التأمين مهما كانت اسباب فسخ العقد او استرجاع السلعة.\n'
                    '13- يتعهد البائع بدفع رسوم البيع بعد انتهاء عملية البيع بحسب السعر النهائي للمنتج المباع.',
                  ),
                  _buildSectionTitle('أحكام المشتري'),
                  _buildSectionContent(
                    '١- ُيقوم المشتري بدفع رسوم البيع بعد الانتهاء من المزاد بحسب النسبة المتفق عليها مع إدارة التطبيق او المنصة الالكترونية.\n'
                    '2- يلتزم المشتري بدفع المبلغ المستحق على عملية الشراء فور انتهاء المزاد خلال الفترة المحددة في التطبيق، وفي حال تعذر الدفع بعد انتهاء المزاد وخلال الفترة المحددة يحق لإدارة التطبيق حظر الحساب الخاص بالمشتري ومصادرة العربون او التأمين (ان وجد).\n'
                    '3- يلتزم المشتري بدفع المبلغ المستحق عليه من سداد الرسوم البنكية (ان وجدت).\n'
                    '4- يلتزم المشتري بدفع رسوم مزاد حصاد بعد الانتهاء من المزايدة بغض النظر عن كون عملية المزايدة فائزة أو خاسرة.\n'
                    '5- يتم ارسال الاشعارات الى الحساب المسجل في التطبيق و/او المنصة الالكترونية لإتمام عملية البيع ودفع المبلغ المستحق او تحميل التكاليف المطلوبة من المشتري.\n'
                    '6- يلتزم المشتري بتحديث البيانات الخاصة به فوراً عند تغيرها لأي سبب وتشمل جميع البيانات (البيانات الشخصية و المالية و غيرها من البيانات).',
                  ),
                  // Additional sections can be added similarly.
                ],
              ),
            ),
          )
        : DefaultScaffold(
            appbarTitle: title ?? 'Terms and Conditions',
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSectionTitle('1. Mandatory Terms and Conditions'),
                  _buildSectionContent(
                    'These terms and conditions are a binding agreement between the Harvest Auction app and the user, governing your use of the Harvest Auction app. '
                    'By agreeing to these terms and conditions by clicking "I acknowledge that I agree to the auction terms and conditions," you acknowledge that you have fully understood their content and implications.',
                  ),
                  _buildSectionContent(
                    'Some supplementary terms and conditions may apply to Harvest Auction (usage policy for specific auctions related to specific campaigns). '
                    'These supplementary terms will be disclosed to the user "if applicable," and in the event of a conflict between them and these terms and conditions, the supplementary terms will prevail.',
                  ),
                  _buildSectionTitle('2. Registration'),
                  _buildSectionContent(
                    'If you agree to these terms and conditions, you can access this app and benefit from our services on both commercial and personal levels. '
                    'To use the Harvest app services, you must:\n\n'
                    '1. Register for and maintain an active personal user account (the account).\n'
                    '2. Be at least 18 years old to obtain an account.\n'
                    '3. The user (seller, buyer, or bidder) must, after activating the account, not grant it to any other user, and the institution has the right to prosecute you if it turns out that the user-provided information is fake or incorrect or if the name is inappropriate.\n'
                    '4. Users are prohibited from using any natural or legal entity to bid on its behalf, and if the Harvest Auction management finds out there is any tampering with the user identity, bank account, or any fake/incorrect information provided, it has the right to confiscate the auction deposit in addition to the auction entry fees.\n'
                    '5. Users must acknowledge that all terms and conditions apply to them and that they are of full legal age and capacity, and that the laws of Saudi Arabia have allowed them to use this application and do not violate any of them. The registration account also requires submitting some personal information to the Harvest app, such as your name, address, mobile number, gender, age, ID number, and any required documents by the Harvest Auction Platform for registration and user membership activation.\n'
                    '6. Users agree to provide accurate, complete, and up-to-date information in their user account. Failure to comply may result in the inability to access or use the Harvest app, or in account suspension or closure.\n'
                    '7. Users are responsible for all activities that occur under their account and agree to keep their username and password secure and confidential at all times, and may only have one account unless otherwise permitted by the Harvest app.\n'
                    '8. Users acknowledge that they have full legal and regulatory capacity (capacity to contract and perform) and that this capacity is not impaired by any legal deficiencies or other restrictions. Users also acknowledge that the laws allow them to own and purchase agricultural products in Saudi Arabia and that there is no legal obstacle to completing the purchase process.\n'
                    '9. Users must adhere to proper communication etiquette in live chat, refrain from discussing topics unrelated to buying, selling, or bidding, avoid using inappropriate language, and not engage in defamatory remarks against the seller or intermediaries.\n'
                    '10. If a user is a resident of Saudi Arabia with a valid residence permit that allows them to engage in agricultural product buying and selling, they must provide sponsor data and sales authorization as required by the app or its staff.\n'
                    '11. Users are responsible for all transactions and orders that occur under their account.\n'
                    '12. Users must immediately update their data if there are any changes, including all personal, financial, and other information.',
                  ),
                  _buildSectionTitle('Registration Violations'),
                  _buildSectionContent(
                    'Users commit to not granting their account to any other user after activation, and the company has the right to prosecute you if it turns out that the user-provided information is fake or incorrect. Users are also prohibited from using any natural or legal person’s name to bid on their behalf without official authorization. If the auction management discovers any manipulation of the user’s identity, bank account, or any auction card, or any information; the company has the right, but is not limited to, the following:\n\n'
                    '1. Immediate, temporary, or permanent withdrawal of your right to use the Harvest Auction app with a ban on your ID / residence number.\n'
                    '2. Disclosure of this information to law enforcement authorities as deemed necessary.\n'
                    '3. Confiscation of the auction deposit.\n'
                    '4. Reimbursement of any amounts paid by the company due to these violations, including but not limited to: administrative and legal costs resulting from the violations.',
                  ),
                  _buildSectionTitle('3. Seller Provisions'),
                  _buildSectionContent(
                    '1. (Individual/Institution/Company) must pay the post-sale fee as listed in the app.\n'
                    '2. If the product owner is a financial entity, it will be treated as a customer subject to the sale terms and conditions. The Harvest Platform or the app is not responsible for any disputes between it and any contracting party in the event of a sale according to the price agreed upon with the financial entity.\n'
                    '3. The product owner must disclose any defects in the product and guarantee that the product meets the approved specifications and standards.\n'
                    '4. The product owner has the option to create an inspection report for the product.\n'
                    '5. If the seller is an intermediary, they must provide the necessary document that authorizes them to sell the product through the Harvest app.\n'
                    '6. The product owner has no right to request the auction\'s suspension before the scheduled end time. If there are any unpaid fees, they must be paid before suspending the auction on the product.\n'
                    '7. The app management provides inspection and transportation services through the Fruit Broker section by registered intermediaries in the system. The transportation cost from the seller’s location to the buyer’s location is calculated according to the agreement between the seller or buyer and the service provider (Fruit Broker). The cost of inspection, examination, or receipt on behalf of the buyer is calculated according to the agreement between the parties.\n'
                    '8. The product owner is responsible for the product during transportation before official and security authorities. The Harvest Auction Platform disclaims any responsibility in case of any comments or obstacles from the official and security authorities that prevent Harvest Auction from completing the transaction, and the product owner must pay the service fee regardless.\n'
                    '9. If the product is damaged or has accidents during transportation, the Harvest Platform is not responsible for financial or insurance claims from the transporting company or the buyer.\n'
                    '10. The sale date is set by the Harvest app by day, hour, and location of the products based on the product’s readiness to be displayed on the electronic platform in a public auction.\n'
                    '11. The seller must pay the auction entry deposit for the product to be sold according to the agreed percentage or as listed in the app, estimated at 10% (subject to increase or decrease as agreed).\n'
                    '12. The Harvest Auction Platform commits to refunding the deposit in case of non-violation of any of these terms and conditions after the sale through the Harvest app, whether the auction is direct or reverse. If the seller violates any of these terms, the deposit will not be refunded regardless of the reasons for contract termination or product return.\n'
                    '13. The seller commits to paying the sales fees after the sale based on the final price of the sold product.',
                  ),
                  _buildSectionTitle('Buyer Provisions'),
                  _buildSectionContent(
                    '1. The buyer must pay the sales fee after the auction ends according to the agreed percentage with the app management or the electronic platform.\n'
                    '2. The buyer must pay the amount due for the purchase immediately after the auction ends within the specified period in the app. If payment is not made after the auction ends and within the specified period, the app management has the right to block the buyer’s account and confiscate the deposit or insurance (if any).\n'
                    '3. The buyer must pay any bank fees incurred (if any).\n'
                    '4. The buyer must pay the Harvest Auction fee after the auction ends, regardless of whether the bidding process is successful or unsuccessful.\n'
                    '5. Notifications will be sent to the registered account in the app and/or the electronic platform to complete the sale and pay the due amount or download the required costs from the buyer.\n'
                    '6. The buyer must immediately update their data if there are any changes, including all personal, financial, and other information.',
                  ),
                  // Additional sections can be added similarly.
                ],
              ),
            ),
          );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16.0,
        height: 1.5,
      ),
    );
  }
}
