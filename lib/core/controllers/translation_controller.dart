import 'package:get/get.dart';

class TranslationController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Login Page
          'login_page.title': 'Welcome',
          'login_page.phone_no': 'Phone Number',
          'login_page.phone_no_hint': 'Enter your phone number',
          'login_page.password': 'Password',
          'login_page.password_hint': 'Enter your password',
          'login_page.login_btn': 'Login',
          'login_page.forget_btn': 'Forget Password ?',
          'login_page.register_btn': 'Register Now',
          'login_page.all_verification': 'Invalid Credentials',
          'login_page.empty_verification': 'This Field required',
          'login_page.pass_verification': 'Password is required',
          'login_page.pass_verification1':
              'Password must be at least 6 characters',
          // Forget Page
          'forget_page.title': 'Forget Password',
          'forget_page.phone_no': 'Phone Number',
          'forget_page.empty_verification': 'This Field required',
          'forget_page.phone_no_hint': 'Enter your phone number',
          'forget_page.forget_btn': 'Send OTP',
          // Register Page
          // labels
          'register_page.username_label': 'Full Name',
          'register_page.phone_no_label': 'Phone Number',
          'register_page.email_label': 'Email',
          'register_page.birth_date_label': 'Birth Date',
          'register_page.car_model_label': 'Car Model',
          'register_page.car_model_year_label': 'Car Model Year',
          'register_page.password_label': 'Password',
          'register_page.confrim_password_label': 'Confrim Password',
          'register_page.gender_label': 'Select Gender',
          'register_page.gov_label': 'Select Governorate',
          // hints
          'register_page.username_hint': 'Enter your full name',
          'register_page.phone_no_hint': 'Enter your phone number',
          'register_page.email_hint': 'Enter your email',
          'register_page.birth_date_hint': 'Select your birth date',
          'register_page.car_model_hint': 'Enter your car model',
          'register_page.car_model_year_hint':
              'Enter your car manufacture year',
          'register_page.password_hint': 'Enter your password',
          'register_page.confrim_password_hint': 'Re-enter your password',
          'register_page.gender_hint1': 'Male',
          'register_page.gender_hint2': 'Female',
          'register_page.gov_hint': 'Choose your governorate',
          // terms & conditions
          'register_page.term&cond':
              'I agree to send and store my data with Total Energies Marketing Egypt to receive messages and offers by e-mail, SMS, and commercial phone calls for promotions that fit my profile',
          // Buttons
          'register_page.reg_btn': 'Register Now',
          // Verifications
          'register_page.empty_verification': 'This Field required',
          'register_page.terms_verification':
              'You must agree to the terms to register.',
          'register_page.success_verification': 'Registration successful',
          'register_page.fail_verification': 'Failed',
          'register_page.email_verification': 'Enter a valid email address',
          'register_page.name_verification':
              'Enter a valid name (only letters, min 3 characters)',
          'register_page.pass_verification':
              'Password must be at least 6 characters',
          'register_page.date_verification': 'Invalid date format.',
          'register_page.age_verification':
              'You must be at least 16 years old.',
          'register_page.year_verification': 'Enter a valid 4-digit year',
          'register_page.year_verification1':
              'Year must be between 1990 and 2030',
        },
        'ar_AE': {
          // Login Page
          'login_page.title': 'مرحبا',
          'login_page.phone_no': 'رقم الهاتف',
          'login_page.phone_no_hint': 'ادخل رقم الهاتف',
          'login_page.password': 'كلمة المرور',
          'login_page.password_hint': 'ادخل كلمة المرور',
          'login_page.forget_btn': 'نسيت كلمة المرور ؟',
          'login_page.register_btn': 'تسجيل دخول',
          'login_page.login_btn': 'دخول',
          'login_page.all_verification': 'بيانات اعتماد غير صالحة',
          'login_page.empty_verification': 'هذا الحقل مطلوب',
          'login_page.pass_verification': 'كلمة المرور مطلوبة',
          'login_page.pass_verification1':
              'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
          // Forget Page
          'forget_page.title': 'نسيت كلمة المرور',
          'forget_page.phone_no': 'رقم الهاتف',
          'forget_page.empty_verification': 'هذا الحقل مطلوب',
          'forget_page.phone_no_hint': 'ادخل رقم الهاتف',
          'forget_page.forget_btn': 'ارسال OTP',
          // Register Page
          // labels
          'register_page.username_label': 'الاسم كامل',
          'register_page.phone_no_label': 'رقم الهاتف',
          'register_page.email_label': 'الايميل',
          'register_page.birth_date_label': 'تاريخ الميلاد',
          'register_page.car_model_label': 'نوع السيارة',
          'register_page.car_model_year_label': 'سنة صنع السيارة',
          'register_page.password_label': 'كلمة المرور',
          'register_page.confrim_password_label': 'تاكيد كلمة المرور',
          'register_page.gender_label': 'حدد الجنس',
          'register_page.gov_label': 'اختار محافظة',
          // hints
          'register_page.username_hint': 'ادخل الاسم كامل',
          'register_page.phone_no_hint': 'ادخل رقم الهاتف',
          'register_page.email_hint': 'ادخل البريد الاكتروني',
          'register_page.birth_date_hint': 'اختار تاريخ ميلادك',
          'register_page.car_model_hint': 'ادخل نوع السيارة',
          'register_page.car_model_year_hint': 'ادخل سنة صنع السيارة',
          'register_page.password_hint': 'ادخل كلمة المرور',
          'register_page.confrim_password_hint': 'اعد ادخال كلمة المرور',
          'register_page.gender_hint1': 'ذكر',
          'register_page.gender_hint2': 'انثي',
          'register_page.gov_hint': 'اختار محافظة',
          // terms & conditions
          'register_page.term&cond':
              'انا أوافق على إرسال  بياناتي وتخزينها عند شركة توتال إنرجيز للتسويق إيجيبت لتلقي رسائل وعروض عن طريق البريد الإلكتروني و الرسائل القصيرة والاتصالات التجارية التي تناسب ملف التعريف الخاص بي',
          // Buttons
          'register_page.reg_btn': 'تسجيل الان',
          // verifications
          'register_page.empty_verification': 'هذا الحقل مطلوب',
          'register_page.terms_verification':
              'يجب عليك الموافقة على شروط التسجيل.',
          'register_page.success_verification': 'تم التسجيل بنجاح',
          'register_page.fail_verification': 'فشل',
          'register_page.email_verification': 'أدخل عنوان بريد إلكتروني صالحًا',
          'register_page.name_verification':
              'أدخل اسمًا صالحًا (أحرف فقط، 3 أحرف على الأقل)',
          'register_page.pass_verification':
              'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
          'register_page.date_verification': 'تنسيق التاريخ غير صالح.',
          'register_page.age_verification':
              'يجب أن يكون عمرك 16 عامًا على الأقل.',
          'register_page.year_verification': 'أدخل سنة صالحة مكونة من 4 أرقام',
          'register_page.year_verification1':
              'يجب أن يكون العام بين 1990 و 2030',
        },
      };
}
