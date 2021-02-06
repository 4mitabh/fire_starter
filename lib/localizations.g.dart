// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

// ignore_for_file: camel_case_types

class AppLocalizations {
  AppLocalizations(this.locale) : labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: 'en'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Google Sign In',
        appleSignIn: 'Apple Sign In',
        aborted: 'Sign In Aborted',
        phone: 'Enter Phone Number',
        requestOTP: 'Get OTP',
        enterOTP: 'Enter OTP',
        otpVerificationSentTitle: 'OTP Sent',
        otpVerificationSent: 'OTP sent to your mobile number',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP sent to ${phone}. Number not correct?''',
        signInButton: 'Sign In',
        nameFormField: 'Name',
        emailFormField: 'Email',
        signInErrorTitle: 'Sign In Error',
        signInError: 'Login failed: OTP incorrect',
        resetPasswordLabelButton: 'Forgot password?',
        updateUser: 'Update Profile',
        updateUserSuccessNoticeTitle: 'User Updated',
        updateUserSuccessNotice: 'User information successfully updated.',
        updateUserFailNotice: 'Failed to update user',
        cancel: 'Cancel',
        submit: 'Submit',
        updateProfileTitle: 'Update Profile',
        unknownError: 'Unknown Error',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'Settings',
        language: 'Language',
        theme: 'Theme',
        signOut: 'Sign Out',
        dark: 'Dark',
        light: 'Light',
        system: 'System',
        updateProfile: 'Update Profile',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Home',
        nameLabel: 'Name',
        uidLabel: 'UID',
        emailLabel: 'Email',
        phoneLabel: 'Phone',
        adminUserLabel: 'Admin User',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'Please enter a valid email address.',
        password: 'Password must be at least 6 characters.',
        name: 'Please enter a name.',
        number: 'Please enter a number.',
        notEmpty: 'This is a required field.',
        amount:
            'Please enter a number i.e. 250 - no dollar symbol and no cents',
      ),
    ),
    Locale.fromSubtags(languageCode: 'fr'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Google Connexion',
        appleSignIn: 'Apple Connexion',
        aborted: 'Se connecter Aborted',
        phone: 'Entrez numéro de téléphone',
        requestOTP: 'Get OTP',
        enterOTP: 'Entrez OTP',
        otpVerificationSentTitle: 'Sent Bureau du Procureur',
        otpVerificationSent: 'OTP envoyé à votre numéro de téléphone mobile',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP envoyé à {{téléphone}}. Nombre incorrect?''',
        signInButton: 'Se connecter',
        nameFormField: 'Nom',
        emailFormField: 'Email',
        signInErrorTitle: 'Erreur de connexion',
        signInError: 'Échec de la connexion: OTP incorrect',
        resetPasswordLabelButton: 'Mot de passe oublié?',
        updateUser: 'Mettre à jour le profil',
        updateUserSuccessNoticeTitle: 'Mise à jour l\'utilisateur',
        updateUserSuccessNotice:
            'Informations sur l\'utilisateur mis à jour avec succès.',
        updateUserFailNotice: 'Impossible de mettre à jour l\'utilisateur',
        cancel: 'Annuler',
        submit: 'Soumettre',
        updateProfileTitle: 'Mettre à jour le profil',
        unknownError: 'Erreur inconnue',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'Paramètres',
        language: 'Langue',
        theme: 'Thème',
        signOut: 'Se déconnecter',
        dark: 'Foncé',
        light: 'Lumière',
        system: 'Système',
        updateProfile: 'Mettre à jour le profil',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Accueil',
        nameLabel: 'Nom',
        uidLabel: 'UID',
        emailLabel: 'Email',
        phoneLabel: 'Téléphone',
        adminUserLabel: 'utilisateur admin',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'S\'il vous plaît, mettez une adresse email valide.',
        password: 'Le mot de passe doit être au moins de 6 caractères.',
        name: 'S\'il vous plaît entrer un nom.',
        number: 'S\'il vous plaît entrer un numéro.',
        notEmpty: 'Ceci est un champ obligatoire.',
        amount:
            'S\'il vous plaît entrer un numéro à savoir 250 - aucun symbole du dollar et pas cents',
      ),
    ),
    Locale.fromSubtags(languageCode: 'es'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Iniciar sesión Google',
        appleSignIn: 'En sesión de Apple',
        aborted: 'Iniciar sesión abortada',
        phone: 'Ingresar número telefónico',
        requestOTP: 'Get OTP',
        enterOTP: 'Introduzca OTP',
        otpVerificationSentTitle: 'Enviados OTP',
        otpVerificationSent: 'OTP enviado a su número de teléfono móvil',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP enviado al teléfono {{}}. Número no es correcta?''',
        signInButton: 'Registrarse',
        nameFormField: 'Nombre',
        emailFormField: 'Email',
        signInErrorTitle: 'Error al iniciar sesión',
        signInError: 'La conexión falló: OTP incorrectos',
        resetPasswordLabelButton: '¿Se te olvidó tu contraseña?',
        updateUser: 'Actualización del perfil',
        updateUserSuccessNoticeTitle: 'Actualización de usuario',
        updateUserSuccessNotice:
            'La información de usuario actualizada correctamente.',
        updateUserFailNotice: 'Error al usuario la actualización',
        cancel: 'Cancelar',
        submit: 'Enviar',
        updateProfileTitle: 'Actualización del perfil',
        unknownError: 'Error desconocido',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'ajustes',
        language: 'Idioma',
        theme: 'Tema',
        signOut: 'Desconectar',
        dark: 'Oscuro',
        light: 'Ligero',
        system: 'Sistema',
        updateProfile: 'Actualización del perfil',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Hogar',
        nameLabel: 'Nombre',
        uidLabel: 'UID',
        emailLabel: 'Email',
        phoneLabel: 'Teléfono',
        adminUserLabel: 'admin User',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email:
            'Por favor, introduce una dirección de correo electrónico válida.',
        password: 'La contraseña debe tener al menos 6 caracteres.',
        name: 'Por favor, introduzca un nombre.',
        number: 'Por favor, introduzca un número.',
        notEmpty: 'Este es un campo obligatorio.',
        amount:
            'Por favor, introduzca un número, es decir 250 - ningún símbolo del dólar y sin centavos',
      ),
    ),
    Locale.fromSubtags(languageCode: 'de'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Google Anmelden',
        appleSignIn: 'Apple Anmelden',
        aborted: 'Anmelden Aborted',
        phone: 'Telefonnummer eingeben',
        requestOTP: 'Get OTP',
        enterOTP: 'Geben Sie OTP',
        otpVerificationSentTitle: 'OTP Sent',
        otpVerificationSent: 'OTP an Ihre Handy-Nummer',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP an {{Telefon}}. Nummer nicht korrekt?''',
        signInButton: 'Anmelden',
        nameFormField: 'Name',
        emailFormField: 'Email',
        signInErrorTitle: 'Anmelden Fehler',
        signInError: 'Fehler bei der Anmeldung: OTP falsch',
        resetPasswordLabelButton: 'Passwort vergessen?',
        updateUser: 'Profil aktualisieren',
        updateUserSuccessNoticeTitle: 'Benutzer Aktualisiert',
        updateUserSuccessNotice:
            'Benutzerinformationen erfolgreich aktualisiert.',
        updateUserFailNotice: 'Fehler beim Update Benutzer',
        cancel: 'Stornieren',
        submit: 'einreichen',
        updateProfileTitle: 'Profil aktualisieren',
        unknownError: 'Unbekannter Fehler',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'die Einstellungen',
        language: 'Sprache',
        theme: 'Thema',
        signOut: 'Austragen',
        dark: 'Dunkel',
        light: 'Licht',
        system: 'System',
        updateProfile: 'Profil aktualisieren',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Zuhause',
        nameLabel: 'Name',
        uidLabel: 'UID',
        emailLabel: 'Email',
        phoneLabel: 'Telefon',
        adminUserLabel: 'Admin Benutzer',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'Bitte geben Sie eine gültige E-Mail-Adresse ein.',
        password: 'Passwort muss mindestens 6 Zeichen lang sein.',
        name: 'Bitte geben Sie einen Namen.',
        number: 'Bitte gebe eine Nummer ein.',
        notEmpty: 'Dies ist ein Pflichtfeld.',
        amount:
            'Bitte geben Sie eine Zahl das heißt 250 - kein Dollar-Symbol und keinen Cent',
      ),
    ),
    Locale.fromSubtags(languageCode: 'hi'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'गूगल साइन इन करें',
        appleSignIn: 'एप्पल साइन इन करें',
        aborted: 'साइन इन गर्भपात',
        phone: 'फोन नंबर दर्ज',
        requestOTP: 'प्राप्त OTP',
        enterOTP: 'OTP दर्ज करें',
        otpVerificationSentTitle: 'OTP भेजा',
        otpVerificationSent: 'OTP अपने मोबाइल नंबर पर भेजा',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP भेजा {{फोन}}। संख्या नहीं सही है?''',
        signInButton: 'दाखिल करना',
        nameFormField: 'नाम',
        emailFormField: 'ईमेल',
        signInErrorTitle: 'साइन इन त्रुटि',
        signInError: 'लॉगइन असफल: OTP गलत',
        resetPasswordLabelButton: 'पासवर्ड भूल गए?',
        updateUser: 'प्रोफ़ाइल अपडेट करें',
        updateUserSuccessNoticeTitle: 'उपयोगकर्ता अपडेट किया गया',
        updateUserSuccessNotice: 'उपयोगकर्ता जानकारी सफलतापूर्वक अपडेट।',
        updateUserFailNotice: 'उपयोगकर्ता अद्यतन करने में विफल',
        cancel: 'रद्द करना',
        submit: 'प्रस्तुत',
        updateProfileTitle: 'प्रोफ़ाइल अपडेट करें',
        unknownError: 'अज्ञात त्रुटि',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'समायोजन',
        language: 'भाषा: हिन्दी',
        theme: 'विषय',
        signOut: 'प्रस्थान करें',
        dark: 'अंधेरा',
        light: 'रोशनी',
        system: 'प्रणाली',
        updateProfile: 'प्रोफ़ाइल अपडेट करें',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'घर',
        nameLabel: 'नाम',
        uidLabel: 'यूआईडी',
        emailLabel: 'ईमेल',
        phoneLabel: 'फ़ोन',
        adminUserLabel: 'व्यवस्थापक उपयोगकर्ता',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'कृपया एक वैध ई - मेल एड्रेस डालें।',
        password: 'पासवर्ड कम से कम 6 अंकों का होना चाहिए।',
        name: 'एक नाम दर्ज करें।',
        number: 'एक संख्या दर्ज करें।',
        notEmpty: 'यह एक आवश्यक फील्ड है।',
        amount: 'कोई डॉलर प्रतीक और कोई सेंट - एक नंबर अर्थात 250 दर्ज करें',
      ),
    ),
    Locale.fromSubtags(languageCode: 'pt'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Google Entrar',
        appleSignIn: 'Sinal Apple Em',
        aborted: 'Entrar Aborted',
        phone: 'Introduzir número de telefone',
        requestOTP: 'get OTP',
        enterOTP: 'Digite OTP',
        otpVerificationSentTitle: 'OTP Sent',
        otpVerificationSent: 'OTP enviada para o seu número de telemóvel',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP enviado para {{telefone}}. Número não está correta?''',
        signInButton: 'Assinar em',
        nameFormField: 'Nome',
        emailFormField: 'O email',
        signInErrorTitle: 'Entrar erro',
        signInError: 'Falha de logon: OTP incorreta',
        resetPasswordLabelButton: 'Esqueceu sua senha?',
        updateUser: 'Atualizar perfil',
        updateUserSuccessNoticeTitle: 'do usuário atualizada',
        updateUserSuccessNotice:
            'informações do usuário atualizado com sucesso.',
        updateUserFailNotice: 'Falha ao usuário de atualização',
        cancel: 'Cancelar',
        submit: 'Enviar',
        updateProfileTitle: 'Atualizar perfil',
        unknownError: 'Erro desconhecido',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'Definições',
        language: 'Língua',
        theme: 'Tema',
        signOut: 'Sair',
        dark: 'Sombrio',
        light: 'Luz',
        system: 'Sistema',
        updateProfile: 'Atualizar perfil',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Casa',
        nameLabel: 'Nome',
        uidLabel: 'UID',
        emailLabel: 'O email',
        phoneLabel: 'telefone',
        adminUserLabel: 'admin User',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'Por favor insira um endereço de e-mail válido.',
        password: 'A senha deve ter pelo menos 6 caracteres.',
        name: 'Por favor, indique um nome.',
        number: 'Por favor, coloque um numero.',
        notEmpty: 'Este é um campo obrigatório.',
        amount:
            'Por favor insira um número ou seja 250 - nenhum símbolo dólar e há centavos',
      ),
    ),
    Locale.fromSubtags(languageCode: 'zh'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: '谷歌登录',
        appleSignIn: '苹果登录',
        aborted: '登录中止',
        phone: '输入电话号码',
        requestOTP: '获取OTP',
        enterOTP: '输入OTP',
        otpVerificationSentTitle: 'OTP发送',
        otpVerificationSent: 'OTP发送到您的手机号码',
        otpVerificationChangeNumber: ({phone}) => '''OTP发送到{{电话}}。号码不正确？''',
        signInButton: '登入',
        nameFormField: '名称',
        emailFormField: '电子邮件',
        signInErrorTitle: '登录错误',
        signInError: '登录失败：不正确OTP',
        resetPasswordLabelButton: '忘记密码？',
        updateUser: '更新配置文件',
        updateUserSuccessNoticeTitle: '用户更新',
        updateUserSuccessNotice: '用户信息更新成功。',
        updateUserFailNotice: '无法更新用户',
        cancel: '取消',
        submit: '提交',
        updateProfileTitle: '更新配置文件',
        unknownError: '未知错误',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: '设置',
        language: '语言',
        theme: '主题',
        signOut: '登出',
        dark: '黑暗',
        light: '光',
        system: '系统',
        updateProfile: '更新配置文件',
      ),
      home: AppLocalizations_Labels_Home(
        title: '家',
        nameLabel: '名称',
        uidLabel: 'UID',
        emailLabel: '电子邮件',
        phoneLabel: '电话',
        adminUserLabel: '管理员用户',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: '请输入有效的电子邮件地址。',
        password: '密码必须至少6个字符。',
        name: '请输入姓名。',
        number: '请输入一个数字。',
        notEmpty: '这是一个必填字段。',
        amount: '请输入一个数即250  - 没有美元符号和无分',
      ),
    ),
    Locale.fromSubtags(languageCode: 'ja'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Googleのサインイン',
        appleSignIn: 'アップルサインイン',
        aborted: '中止サインイン',
        phone: '電話番号を入力します。',
        requestOTP: '取得OTP',
        enterOTP: 'OTPを入力します。',
        otpVerificationSentTitle: 'OTP SENT',
        otpVerificationSent: 'OTPは、あなたの携帯電話番号に送信されました',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTPは{{}}電話に送られます。番号が正しくありませんか？''',
        signInButton: 'ログイン',
        nameFormField: '名前',
        emailFormField: 'Eメール',
        signInErrorTitle: 'エラーサインイン',
        signInError: 'ログインに失敗しました：OTP正しくありません',
        resetPasswordLabelButton: 'パスワードをお忘れですか？',
        updateUser: 'プロフィールを更新',
        updateUserSuccessNoticeTitle: 'ユーザーの更新',
        updateUserSuccessNotice: 'ユーザー情報が正常に更新します。',
        updateUserFailNotice: '更新ユーザーに失敗しました。',
        cancel: 'キャンセル',
        submit: '参加する',
        updateProfileTitle: 'プロフィールを更新',
        unknownError: '不明なエラー',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: '設定',
        language: '言語',
        theme: 'テーマ',
        signOut: 'サインアウト',
        dark: '闇',
        light: '光',
        system: 'システム',
        updateProfile: 'プロフィールを更新',
      ),
      home: AppLocalizations_Labels_Home(
        title: '家',
        nameLabel: '名前',
        uidLabel: 'UID',
        emailLabel: 'Eメール',
        phoneLabel: '電話',
        adminUserLabel: '管理者ユーザー',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: '有効なメールアドレスを入力してください。',
        password: 'パスワードは少なくとも6文字でなければなりません。',
        name: '名前を入力してください。',
        number: '番号を入力してください。',
        notEmpty: 'これは必要項目です。',
        amount: 'ノードル記号なしセント - すなわち、250番号を入力してください。',
      ),
    ),
    Locale.fromSubtags(languageCode: 'ru'): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        googleSignIn: 'Google Вход',
        appleSignIn: 'Яблоко Вход',
        aborted: 'Вход в систему абортированных',
        phone: 'Введите номер телефона',
        requestOTP: 'Get OTP',
        enterOTP: 'Введите одноразовый пароль',
        otpVerificationSentTitle: 'OTP Sent',
        otpVerificationSent: 'OTP отправлено на Ваш номер мобильного',
        otpVerificationChangeNumber: ({phone}) =>
            '''OTP адрес {{телефон}}. Номер не правильно?''',
        signInButton: 'Войти в систему',
        nameFormField: 'имя',
        emailFormField: 'Эл. адрес',
        signInErrorTitle: 'Ошибка входа',
        signInError: 'Войти не удалось: OTP некорректный',
        resetPasswordLabelButton: 'Забыли пароль?',
        updateUser: 'Обновить профиль',
        updateUserSuccessNoticeTitle: 'Пользователь Обновлено',
        updateUserSuccessNotice: 'Информация о пользователе успешно обновлена.',
        updateUserFailNotice: 'Не удался пользователь обновления',
        cancel: 'Отмена',
        submit: 'Разместить',
        updateProfileTitle: 'Обновить профиль',
        unknownError: 'Неизвестная ошибка',
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'настройки',
        language: 'язык',
        theme: 'тема',
        signOut: 'Выход',
        dark: 'Тьма',
        light: 'Свет',
        system: 'система',
        updateProfile: 'Обновить профиль',
      ),
      home: AppLocalizations_Labels_Home(
        title: 'Главная',
        nameLabel: 'имя',
        uidLabel: 'UID',
        emailLabel: 'Эл. адрес',
        phoneLabel: 'Телефон',
        adminUserLabel: 'Пользователь Admin',
      ),
      app: AppLocalizations_Labels_App(
        title: 'Scorizen',
      ),
      validator: AppLocalizations_Labels_Validator(
        email: 'Пожалуйста, введите действительный адрес электронной почты.',
        password: 'Пароль должен быть не менее 6 символов.',
        name: 'Пожалуйста, введите имя.',
        number: 'Пожалуйста, введите число.',
        notEmpty: 'Это поле обязательно для заполнения.',
        amount:
            'Пожалуйста, введите номер 250 - т.е. без символа доллара и ни цента',
      ),
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

typedef AppLocalizations_Labels_Auth_otpVerificationChangeNumber = String
    Function({@required String phone});

class AppLocalizations_Labels_Auth {
  const AppLocalizations_Labels_Auth(
      {this.googleSignIn,
      this.appleSignIn,
      this.aborted,
      this.phone,
      this.requestOTP,
      this.enterOTP,
      this.otpVerificationSentTitle,
      this.otpVerificationSent,
      AppLocalizations_Labels_Auth_otpVerificationChangeNumber
          otpVerificationChangeNumber,
      this.signInButton,
      this.nameFormField,
      this.emailFormField,
      this.signInErrorTitle,
      this.signInError,
      this.resetPasswordLabelButton,
      this.updateUser,
      this.updateUserSuccessNoticeTitle,
      this.updateUserSuccessNotice,
      this.updateUserFailNotice,
      this.cancel,
      this.submit,
      this.updateProfileTitle,
      this.unknownError})
      : _otpVerificationChangeNumber = otpVerificationChangeNumber;

  final String googleSignIn;

  final String appleSignIn;

  final String aborted;

  final String phone;

  final String requestOTP;

  final String enterOTP;

  final String otpVerificationSentTitle;

  final String otpVerificationSent;

  final AppLocalizations_Labels_Auth_otpVerificationChangeNumber
      _otpVerificationChangeNumber;

  final String signInButton;

  final String nameFormField;

  final String emailFormField;

  final String signInErrorTitle;

  final String signInError;

  final String resetPasswordLabelButton;

  final String updateUser;

  final String updateUserSuccessNoticeTitle;

  final String updateUserSuccessNotice;

  final String updateUserFailNotice;

  final String cancel;

  final String submit;

  final String updateProfileTitle;

  final String unknownError;

  String getByKey(String key) {
    switch (key) {
      case 'googleSignIn':
        return googleSignIn;
      case 'appleSignIn':
        return appleSignIn;
      case 'aborted':
        return aborted;
      case 'phone':
        return phone;
      case 'requestOTP':
        return requestOTP;
      case 'enterOTP':
        return enterOTP;
      case 'otpVerificationSentTitle':
        return otpVerificationSentTitle;
      case 'otpVerificationSent':
        return otpVerificationSent;
      case 'signInButton':
        return signInButton;
      case 'nameFormField':
        return nameFormField;
      case 'emailFormField':
        return emailFormField;
      case 'signInErrorTitle':
        return signInErrorTitle;
      case 'signInError':
        return signInError;
      case 'resetPasswordLabelButton':
        return resetPasswordLabelButton;
      case 'updateUser':
        return updateUser;
      case 'updateUserSuccessNoticeTitle':
        return updateUserSuccessNoticeTitle;
      case 'updateUserSuccessNotice':
        return updateUserSuccessNotice;
      case 'updateUserFailNotice':
        return updateUserFailNotice;
      case 'cancel':
        return cancel;
      case 'submit':
        return submit;
      case 'updateProfileTitle':
        return updateProfileTitle;
      case 'unknownError':
        return unknownError;
      default:
        return '';
    }
  }

  String otpVerificationChangeNumber({@required String phone}) =>
      _otpVerificationChangeNumber(
        phone: phone,
      );
}

class AppLocalizations_Labels_Settings {
  const AppLocalizations_Labels_Settings(
      {this.title,
      this.language,
      this.theme,
      this.signOut,
      this.dark,
      this.light,
      this.system,
      this.updateProfile});

  final String title;

  final String language;

  final String theme;

  final String signOut;

  final String dark;

  final String light;

  final String system;

  final String updateProfile;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'language':
        return language;
      case 'theme':
        return theme;
      case 'signOut':
        return signOut;
      case 'dark':
        return dark;
      case 'light':
        return light;
      case 'system':
        return system;
      case 'updateProfile':
        return updateProfile;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Home {
  const AppLocalizations_Labels_Home(
      {this.title,
      this.nameLabel,
      this.uidLabel,
      this.emailLabel,
      this.phoneLabel,
      this.adminUserLabel});

  final String title;

  final String nameLabel;

  final String uidLabel;

  final String emailLabel;

  final String phoneLabel;

  final String adminUserLabel;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'nameLabel':
        return nameLabel;
      case 'uidLabel':
        return uidLabel;
      case 'emailLabel':
        return emailLabel;
      case 'phoneLabel':
        return phoneLabel;
      case 'adminUserLabel':
        return adminUserLabel;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_App {
  const AppLocalizations_Labels_App({this.title});

  final String title;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Validator {
  const AppLocalizations_Labels_Validator(
      {this.email,
      this.password,
      this.name,
      this.number,
      this.notEmpty,
      this.amount});

  final String email;

  final String password;

  final String name;

  final String number;

  final String notEmpty;

  final String amount;

  String getByKey(String key) {
    switch (key) {
      case 'email':
        return email;
      case 'password':
        return password;
      case 'name':
        return name;
      case 'number':
        return number;
      case 'notEmpty':
        return notEmpty;
      case 'amount':
        return amount;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels {
  const AppLocalizations_Labels(
      {this.auth, this.settings, this.home, this.app, this.validator});

  final AppLocalizations_Labels_Auth auth;

  final AppLocalizations_Labels_Settings settings;

  final AppLocalizations_Labels_Home home;

  final AppLocalizations_Labels_App app;

  final AppLocalizations_Labels_Validator validator;

  String getByKey(String key) {
    switch (key) {
      default:
        return '';
    }
  }
}
