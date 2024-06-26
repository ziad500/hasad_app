import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/constants.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Constants.isArabic
        ? DefaultScaffold(
            appbarTitle: 'عن حصاد',
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'تعريف التطبيق',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'نحن تطبيق للتجارة الزراعية على نطاق واسع وبطريقة محمية مما يتيح لمستخدميهم من خلال وسائل النشر داخل تطبيق منصة حصاد التعرف على توفر المنتج أو الحاجة إلى الشراء، حتى يتمكنوا من الاتصال مباشرة بالمهتمين لفتح المعاملات التجارية. تعزيز قنوات التوزيع وإيقاف خسارة المواد الزراعية و فرصة الحصول على المعلومات المتعلقة بالسعر والفرص التجارية ، كما تساهم في تقليل الوساطة والاحتيال وإحداث أضرار في سوق الأغذية الزراعية . حن نبذل قصارى جهدنا لجعل مزاداتنا عادلة وشفافة.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'على الرغم من اننا نشجع المعاينة الشخصية للمنتجات حتى يكون المشترون راضين قدر الإمكان الا اننا ندرك ان هذا ليس ممكن دائماً ،،فاننا نوفر قائمة بخدمات الفحص و المعاينة خدمات المعاينة و التفتيش المسحي و النقل نيابة عنك ، مقدمي الخدمة هؤلاء ليسوا موظفين لدينا بل هم مستقلين خارجيين نيابة عنك .',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'كمستخدم لتطبيق حصاد يجب عليك قراءة الشروط والأحكام بعناية قبل استخدام خدمات المنصة.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'تطبيق مزاد حصاد يعمل كوسيط بين مالك المنتج الزراعي(سوى منتج مباشر او مسوق او المزايد)، بحيث يتيح للراغبين ببيع منتجاتهم الزراعية ؛ عرضها في التطبيق، ويكون للراغب بالشراء خيار المزايدة على المنتج الزراعي، وفقًا لهذه الشروط والاحكام، ويعتبر البيع من خلال مزاد حصاد الإلكتروني بيعاً شرعياً يلزم توافر الإيجاب والقبول فيه، تعتبر المزايدة إيجابًا للرغبة بالشراء، ويجب أن يقبل مالك المنتج الزراعي مبلغ المزايدة الأخير ليعتبر قبولًا لانعقاد البيع وإتمامه.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'يقر المستخدم ان تطبيق مزاد حصاد ليس مالكًا للمنتجات المعروضة على المنصة، وماهو الا وسيط الكتروني بين مالك المنتج الزراعي والمشتري لتسهيل عملية البيع واقتصار دورها على تنظيم المزاد لا غير.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'التعريفات',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildDefinitionItem('المؤسسة',
                        'مؤسسة منصة الحصاد للمزادات المالكة للعلامة التجارية (مزاد حصاد).'),
                    _buildDefinitionItem('المُستخدِم', 'هو الشخص الذي يقوم باستخدام تطبيق المزاد.'),
                    _buildDefinitionItem('تطبيق مزاد حصاد',
                        'هو التطبيق المتاح في متجر التطبيقات للأجهزة الذكية التي تعمل على نظامي التشغيل (Android-IOS). وينظّم خدمة بيع بطريقة المزاد العلني الالكتروني للخضروات والفواكه و التمر والاعلاف.'),
                    _buildDefinitionItem('المزاد',
                        'بيع علني يتم بطرح سلعة للبيع من خلال التطبيق الإلكتروني الخاص بمزاد حصاد للراغبين في شرائها على من يعرض أعلى ثمن لها خلال مدة زمنية محددة.'),
                    _buildDefinitionItem('المُزايد',
                        'يشير إلى الشخص الطبيعي أو الكيان الاعتباري الذي يقوم بالمزايدة على المنتجات على التطبيق.'),
                    _buildDefinitionItem(
                        'الفائز بالمزاد', 'هو صاحب اعلى مزايدة والذي رسي عليه المزاد.'),
                    _buildDefinitionItem('المُشتري',
                        'هو من يتملّك المنتج بعد دفع قيمتة سوى الشخص الطبيعي أو الكيان الاعتباري .'),
                    _buildDefinitionItem('المنتج',
                        'و "المنتجات" هي جميع أنواع الخضروات والفواكه و التمور والاعلاف المتوفرة في المملكة العربية السعودية (منتج محلي او مستورد).'),
                    _buildDefinitionItem('مالك المنتج',
                        'هو صاحب الحق في التصرف بالمنتج باستغلاله أو بيعه أو التصرف فيها(سوى شخص او كيان تجاري)'),
                    _buildDefinitionItem(
                        'المعاينة', 'هي القيام بفحص و معاينة المنتج من المزايد او المشتري'),
                    _buildDefinitionItem('الدروب شوبنج (فروت بروكر)', 'هم مشترون محترفون .'),
                    _buildDefinitionItem(
                        'رسوم عرض المنتج', 'هي الرسوم المدفوعة لعرض المنتج في المزاد.'),
                    _buildDefinitionItem('تأمين الدخول للمزاد',
                        'التأمين المدفوع من المُزايدين للتمكن من المزايدة على المنتج .'),
                    _buildDefinitionItem('خدمات المعاينة و التفتيش والنقل',
                        '(المعاينة) هي خدمة التنبو و اجراء الفحص الحسي للمنتجات \n(التفتيش) هي خدمة التحقيق من جاهزية المنتج في الموقع وتحديد كميات المنتج و التحقق البصري على المنتجات و التحقق من العيوب في المنتج قدر الإمكان و الاستقصاء في الموقع\n(النقل) وهي تشمل توفير وسيلة النقل بأسرع وقت ممكن من المتوفر في السوق المحلي'),
                    _buildDefinitionItem('اشتري الآن (Buy Now)',
                        'خاصية تتيح شراء سريع بتخطي الدخول إلى المزايدة؛ وفي حال اختيار هذا الخيار والموافقة على سعر السلعة، سيتوقف المزاد مباشر ًة بعد تحويل المبلغ من قبل المشتري واستلامه فعلي ًا من قبل المنصة.'),
                    _buildDefinitionItem('المحادثة الفورية',
                        'خاصية تمكن المزايد من التواصل مع البائع بشكل مباشر عن طريق المحادثة الفورية في التطبيق.'),
                  ],
                ),
              ),
            ),
          )
        : DefaultScaffold(
            appbarTitle: 'About Hasad',
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'App Description',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We are an agricultural trading app on a large scale and in a protected manner, allowing users through the publication tools within the Hasad platform app to know the availability of the product or the need to purchase, so they can contact interested parties directly to open commercial transactions. Enhancing distribution channels, stopping the loss of agricultural materials, and providing the opportunity to obtain information related to prices and commercial opportunities, as well as contributing to reducing mediation, fraud, and causing harm in the agricultural food market. We strive to make our auctions fair and transparent.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Although we encourage personal inspection of the products to ensure buyers are as satisfied as possible, we understand that this is not always possible. Therefore, we provide a list of inspection and survey services and transportation services on your behalf. These service providers are not our employees but independent external entities on your behalf.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'As a user of the Hasad app, you should read the terms and conditions carefully before using the platform\'s services.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The Hasad Auction app acts as an intermediary between the owner of the agricultural product (whether a direct producer, marketer, or bidder), allowing those who wish to sell their agricultural products to display them in the app. The buyer has the option to bid on the agricultural product according to these terms and conditions. The sale through the Hasad electronic auction is considered a legitimate sale requiring the offer and acceptance. Bidding is considered an offer to purchase, and the owner of the agricultural product must accept the final bid amount for the sale to be considered complete.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The user acknowledges that the Hasad Auction app does not own the products displayed on the platform. It is merely an electronic intermediary between the owner of the agricultural product and the buyer to facilitate the sales process, and its role is limited to organizing the auction only.',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Definitions',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildDefinitionItem('The Organization',
                        'The Hasad Auction Platform Organization owning the brand (Hasad Auction).'),
                    _buildDefinitionItem('User', 'The person using the auction app.'),
                    _buildDefinitionItem('Hasad Auction App',
                        'The app available in the app store for smart devices operating on both (Android-IOS) systems. It organizes an electronic public auction service for vegetables, fruits, dates, and fodder.'),
                    _buildDefinitionItem('Auction',
                        'A public sale where an item is offered for sale through the Hasad electronic auction app to those interested in purchasing it, and it is sold to the highest bidder within a specified time period.'),
                    _buildDefinitionItem('Bidder',
                        'Refers to the individual or legal entity bidding on products within the app.'),
                    _buildDefinitionItem('Auction Winner',
                        'The individual with the highest bid who won the auction.'),
                    _buildDefinitionItem('Buyer',
                        'The person who owns the product after paying its value, whether an individual or legal entity.'),
                    _buildDefinitionItem('Product',
                        'All types of vegetables, fruits, dates, and fodder available in Saudi Arabia (locally produced or imported).'),
                    _buildDefinitionItem('Product Owner',
                        'The rightful owner of the product, who has the right to exploit, sell, or dispose of it (whether an individual or a commercial entity).'),
                    _buildDefinitionItem('Inspection',
                        'The process of examining and inspecting the product by the bidder or buyer.'),
                    _buildDefinitionItem(
                        'Drop Shipping (Fruit Broker)', 'They are professional buyers.'),
                    _buildDefinitionItem(
                        'Product Listing Fee', 'The fee paid to list the product in the auction.'),
                    _buildDefinitionItem('Auction Entry Deposit',
                        'The deposit paid by bidders to enable them to bid on the product.'),
                    _buildDefinitionItem('Inspection, Survey, and Transportation Services',
                        '(Inspection) is the service of predicting and conducting a sensory examination of products \n(Survey) is the service of verifying the product\'s readiness on-site, determining product quantities, visually inspecting the products, checking for product defects as much as possible, and investigating on-site \n(Transportation) includes providing the fastest possible means of transportation available in the local market.'),
                    _buildDefinitionItem('Buy Now',
                        'A feature that allows quick purchases by bypassing bidding; if this option is selected and the product price is agreed upon, the auction will immediately stop after the amount is transferred by the buyer and received by the platform.'),
                    _buildDefinitionItem('Instant Messaging',
                        'A feature that allows the bidder to communicate directly with the seller through instant messaging within the app.'),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildDefinitionItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(description),
        ],
      ),
    );
  }
}
