import '../sourates/Allsourate.dart';

class Ajiza {
  Sourate sourate;
  int numeroaya;
  String beginaya;
  List<Verset> beginverset;
  Ajiza({this.sourate,this.numeroaya, this.beginaya,this.beginverset});
  Sourate getSourate()=>this.sourate;
  int getNumeroaya()=> this.numeroaya; 
  String getBeginaya()=>this.beginaya;
  List<Verset> getBeginverset()=>this.beginverset;
}
          
List<Verset> recupererJuz(Sourate sourate , int numero){
return List.from(sourate.getVersets().getRange(numero,sourate.getVersets().length).toList());

}


Ajiza fatiha= new Ajiza(sourate:fatiya,numeroaya:1,beginaya:"بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",  beginverset: recupererJuz(fatiya, 0));
Ajiza baquara26= new Ajiza(sourate:baqara,numeroaya:26,beginaya:'إِنَّ اللَّهَ لاَ يَسْتَحْيِي أَن',  beginverset: recupererJuz(baqara, 25));
Ajiza baquara44= new Ajiza(sourate:baqara,numeroaya:44,beginaya:'أَتَأْمُرُونَ النَّاسَ بِالْبِرِّ',  beginverset: recupererJuz(baqara, 43));
Ajiza baquara60=  new Ajiza(sourate:baqara,numeroaya:60,beginaya:'وَإِذِ اسْتَسْقَى مُوسَى لِقَوْمِهِ',beginverset: recupererJuz(baqara, 59));
Ajiza baquara75=  new Ajiza(sourate:baqara,numeroaya:75,beginaya:'أَفَتَطْمَعُونَ أَن يُؤْمِنُواْ لَكُمْ',beginverset: recupererJuz(baqara, 74));
Ajiza baquara92=  new Ajiza(sourate:baqara,numeroaya:92,beginaya:'وَلَقَدْ جَاءكُم مُّوسَى',beginverset: recupererJuz(baqara, 91));
Ajiza baquara106= new Ajiza(sourate:baqara,numeroaya:106,beginaya:'مَا نَنسَخْ مِنْ آيَةٍ أَوْ نُنسِهَا',beginverset: recupererJuz(baqara, 105));
Ajiza baquara124= new Ajiza(sourate:baqara,numeroaya:124,beginaya:'وَإِذِ ابْتَلَى إِبْرَاهِيمَ رَبُّهُ',beginverset: recupererJuz(baqara, 123));
Ajiza baquara142= new Ajiza(sourate:baqara,numeroaya:142,beginaya:'سَيَقُولُ السُّفَهَاء مِنَ النَّاسِ',beginverset: recupererJuz(baqara, 141));
Ajiza baquara158= new Ajiza(sourate:baqara,numeroaya:158,beginaya:'إِنَّ الصَّفَا وَالْمَرْوَةَ مِن',beginverset: recupererJuz(baqara, 157));
Ajiza baquara177= new Ajiza(sourate:baqara,numeroaya:177,beginaya:'لَّيْسَ الْبِرَّ أَن تُوَلُّواْ',beginverset: recupererJuz(baqara, 176));
Ajiza baquara189= new Ajiza(sourate:baqara,numeroaya:189,beginaya:'يَسْأَلُونَكَ عَنِ الأهِلَّةِ قُلْ',beginverset: recupererJuz(baqara, 188));
Ajiza baquara203= new Ajiza(sourate:baqara,numeroaya:203,beginaya:'وَاذْكُرُواْ اللّهَ فِي أَيَّامٍ',beginverset: recupererJuz(baqara, 202));
Ajiza baquara219= new Ajiza(sourate:baqara,numeroaya:219,beginaya:'يَسْأَلُونَكَ عَنِ الْخَمْرِ',beginverset: recupererJuz(baqara, 218));
Ajiza baquara233= new Ajiza(sourate:baqara,numeroaya:233,beginaya:'وَالْوَالِدَاتُ يُرْضِعْنَ',beginverset: recupererJuz(baqara, 232));
Ajiza baquara243= new Ajiza(sourate:baqara,numeroaya:243,beginaya:'أَلَمْ تَرَ إِلَى الَّذِينَ خَرَجُواْ',beginverset: recupererJuz(baqara, 242));
Ajiza baquara253= new Ajiza(sourate:baqara,numeroaya:253,beginaya:'تِلْكَ الرُّسُلُ فَضَّلْنَا',beginverset: recupererJuz(baqara, 252));
Ajiza baquara263= new Ajiza(sourate:baqara,numeroaya:263,beginaya:'قَوْلٌ مَّعْرُوفٌ وَمَغْفِرَةٌ خَيْرٌ',beginverset: recupererJuz(baqara, 262));
Ajiza baquara272= new Ajiza(sourate:baqara,numeroaya:272,beginaya:'لَّيْسَ عَلَيْكَ هُدَاهُمْ وَلَـكِنَّ',beginverset: recupererJuz(baqara, 271));
Ajiza baquara283= new Ajiza(sourate:baqara,numeroaya:283,beginaya:'وَإِن كُنتُمْ عَلَى سَفَرٍ وَلَمْ',beginverset: recupererJuz(baqara, 282));
Ajiza imran15= new Ajiza(sourate:imran,numeroaya:15,beginaya:'قُلْ أَؤُنَبِّئُكُم بِخَيْرٍ مِّن',beginverset: recupererJuz(imran, 14));
Ajiza imran33= new Ajiza(sourate:imran,numeroaya:33,beginaya:'إِنَّ اللّهَ اصْطَفَى آدَمَ وَنُوحًا',beginverset: recupererJuz(imran, 32));
Ajiza imran52= new Ajiza(sourate:imran,numeroaya:52,beginaya:'فَلَمَّا أَحَسَّ عِيسَى مِنْهُمُ',beginverset: recupererJuz(imran, 51));
Ajiza imran75= new Ajiza(sourate:imran,numeroaya:75,beginaya:'وَمِنْ أَهْلِ الْكِتَابِ مَنْ إِن',beginverset: recupererJuz(imran, 74));
Ajiza imran93= new Ajiza(sourate:imran,numeroaya:93,beginaya:'كُلُّ الطَّعَامِ كَانَ حِـلاًّ لِّبَنِي',beginverset: recupererJuz(imran, 92));
Ajiza imran113= new Ajiza(sourate:imran,numeroaya:113,beginaya:'لَيْسُواْ سَوَاء مِّنْ أَهْلِ',beginverset: recupererJuz(imran, 112));
Ajiza imran133= new Ajiza(sourate:imran,numeroaya:133,beginaya:'وَسَارِعُواْ إِلَى مَغْفِرَةٍ مِّن',beginverset: recupererJuz(imran, 132));
Ajiza imran153= new Ajiza(sourate:imran,numeroaya:153,beginaya:'إِذْ تُصْعِدُونَ وَلاَ تَلْوُونَ',beginverset: recupererJuz(imran, 152));
Ajiza imran171= new Ajiza(sourate:imran,numeroaya:171,beginaya:'يَسْتَبْشِرُونَ بِنِعْمَةٍ مِّنَ',beginverset: recupererJuz(imran, 170));
Ajiza imran186= new Ajiza(sourate:imran,numeroaya:186,beginaya:'لَتُبْلَوُنَّ فِي أَمْوَالِكُمْ',beginverset: recupererJuz(imran, 185));
Ajiza nisa1= new Ajiza(sourate:nisa,numeroaya:1,beginaya:'يَا أَيُّهَا النَّاسُ اتَّقُواْ',beginverset: recupererJuz(nisa, 0));
Ajiza nisa12= new Ajiza(sourate:nisa,numeroaya:12,beginaya:'وَلَكُمْ نِصْفُ مَا تَرَكَ',beginverset: recupererJuz(nisa, 11));
Ajiza nisa24= new Ajiza(sourate:nisa,numeroaya:24,beginaya:'وَالْمُحْصَنَاتُ مِنَ النِّسَاء',beginverset: recupererJuz(nisa, 23));
Ajiza nisa36= new Ajiza(sourate:nisa,numeroaya:36,beginaya:'وَاعْبُدُواْ اللّهَ وَلاَ تُشْرِكُواْ',beginverset: recupererJuz(nisa, 35));
Ajiza nisa58= new Ajiza(sourate:nisa,numeroaya:58,beginaya:'إِنَّ اللّهَ يَأْمُرُكُمْ أَن',beginverset: recupererJuz(nisa, 57));
Ajiza nisa74= new Ajiza(sourate:nisa,numeroaya:74,beginaya:'فَلْيُقَاتِلْ فِي سَبِيلِ اللّهِ',beginverset: recupererJuz(nisa, 73));
Ajiza nisa88= new Ajiza(sourate:nisa,numeroaya:88,beginaya:'فَمَا لَكُمْ فِي الْمُنَافِقِينَ',beginverset: recupererJuz(nisa, 87));
Ajiza nisa100= new Ajiza(sourate:nisa,numeroaya:100,beginaya:'وَمَن يُهَاجِرْ فِي سَبِيلِ اللّهِ',beginverset: recupererJuz(nisa, 99));
Ajiza nisa114= new Ajiza(sourate:nisa,numeroaya:114,beginaya:'لاَّ خَيْرَ فِي كَثِيرٍ مِّن',beginverset: recupererJuz(nisa, 113));
Ajiza nisa135= new Ajiza(sourate:nisa,numeroaya:135,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُواْ كُونُواْ',beginverset: recupererJuz(nisa, 134));
Ajiza nisa148= new Ajiza(sourate:nisa,numeroaya:148,beginaya:'لاَّ يُحِبُّ اللّهُ الْجَهْرَ',beginverset: recupererJuz(nisa, 147));
Ajiza nisa163= new Ajiza(sourate:nisa,numeroaya:163,beginaya:'إِنَّا أَوْحَيْنَا إِلَيْكَ كَمَا',beginverset: recupererJuz(nisa, 162));
Ajiza maida12= new Ajiza(sourate:maIda,numeroaya:12,beginaya:'وَلَقَدْ أَخَذَ اللّهُ مِيثَاقَ بَنِي',beginverset: recupererJuz(maIda, 11));
Ajiza maida1= new Ajiza(sourate:maIda,numeroaya:1,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُواْ',beginverset: recupererJuz(maIda, 0));
Ajiza maida27= new Ajiza(sourate:maIda,numeroaya:27,beginaya:'وَاتْلُ عَلَيْهِمْ نَبَأَ ابْنَيْ',beginverset: recupererJuz(maIda, 26));
Ajiza maida41= new Ajiza(sourate:maIda,numeroaya:41,beginaya:'يَا أَيُّهَا الرَّسُولُ لاَ يَحْزُنكَ',beginverset: recupererJuz(maIda, 40));
Ajiza maida51= new Ajiza(sourate:maIda,numeroaya:51,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُواْ لاَ',beginverset: recupererJuz(maIda, 50));
Ajiza maida67= new Ajiza(sourate:maIda,numeroaya:67,beginaya:'يَا أَيُّهَا الرَّسُولُ بَلِّغْ مَا',beginverset: recupererJuz(maIda, 66));
Ajiza maida82= new Ajiza(sourate:maIda,numeroaya:82,beginaya:'لَتَجِدَنَّ أَشَدَّ النَّاسِ',beginverset: recupererJuz(maIda, 81));
Ajiza maida97= new Ajiza(sourate:maIda,numeroaya:97,beginaya:'جَعَلَ اللّهُ الْكَعْبَةَ الْبَيْتَ',beginverset: recupererJuz(maIda, 96));
Ajiza maida109= new Ajiza(sourate:maIda,numeroaya:109,beginaya:'يَوْمَ يَجْمَعُ اللّهُ الرُّسُلَ',beginverset: recupererJuz(maIda, 108));
Ajiza anam13= new Ajiza(sourate:anam,numeroaya:13,beginaya:'وَلَهُ مَا سَكَنَ فِي اللَّيْلِ',beginverset: recupererJuz(anam, 12));
Ajiza anam36= new Ajiza(sourate:anam,numeroaya:36,beginaya:'إِنَّمَا يَسْتَجِيبُ الَّذِينَ',beginverset: recupererJuz(anam, 35));
Ajiza anam59= new Ajiza(sourate:anam,numeroaya:59,beginaya:'وَعِندَهُ مَفَاتِحُ الْغَيْبِ لاَ',beginverset: recupererJuz(anam, 58));
Ajiza anam74= new Ajiza(sourate:anam,numeroaya:74,beginaya:'وَإِذْ قَالَ إِبْرَاهِيمُ لأَبِيهِ',beginverset: recupererJuz(anam, 73));
Ajiza anam95= new Ajiza(sourate:anam,numeroaya:95,beginaya:'إِنَّ اللّهَ فَالِقُ الْحَبِّ',beginverset: recupererJuz(anam, 94));
Ajiza anam111= new Ajiza(sourate:anam,numeroaya:111,beginaya:'وَلَوْ أَنَّنَا نَزَّلْنَا إِلَيْهِمُ',beginverset: recupererJuz(anam, 110));
Ajiza anam127= new Ajiza(sourate:anam,numeroaya:127,beginaya:'لَهُمْ دَارُ السَّلاَمِ عِندَ',beginverset: recupererJuz(anam, 126));
Ajiza anam141= new Ajiza(sourate:anam,numeroaya:141,beginaya:'وَهُوَ الَّذِي أَنشَأَ جَنَّاتٍ',beginverset: recupererJuz(anam, 140));
Ajiza anam151= new Ajiza(sourate:anam,numeroaya:151,beginaya:'قُلْ تَعَالَوْاْ أَتْلُ مَا حَرَّمَ',beginverset: recupererJuz(anam, 150));
Ajiza araf1=   new Ajiza(sourate:araf,numeroaya:1,beginaya:'المص',beginverset: recupererJuz(araf, 0));
Ajiza araf31= new Ajiza(sourate:araf,numeroaya:31,beginaya:'يَا بَنِي آدَمَ خُذُواْ زِينَتَكُمْ',beginverset: recupererJuz(araf, 30));
Ajiza araf47= new Ajiza(sourate:araf,numeroaya:47,beginaya:'وَإِذَا صُرِفَتْ أَبْصَارُهُمْ',beginverset: recupererJuz(araf, 46));
Ajiza araf65= new Ajiza(sourate:araf,numeroaya:65,beginaya:'وَإِلَى عَادٍ أَخَاهُمْ هُوداً',beginverset: recupererJuz(araf, 64));
Ajiza araf88= new Ajiza(sourate:araf,numeroaya:88,beginaya:'قَالَ الْمَلأُ الَّذِينَ',beginverset: recupererJuz(araf, 87));
Ajiza araf117= new Ajiza(sourate:araf,numeroaya:117,beginaya:'وَأَوْحَيْنَا إِلَى مُوسَى أَنْ',beginverset: recupererJuz(araf,116));
Ajiza araf142= new Ajiza(sourate:araf,numeroaya:142,beginaya:'وَوَاعَدْنَا مُوسَى ثَلاَثِينَ',beginverset: recupererJuz(araf, 141));
Ajiza araf156= new Ajiza(sourate:araf,numeroaya:156,beginaya:'وَاكْتُبْ لَنَا فِي هَـذِهِ الدُّنْيَا',beginverset: recupererJuz(araf, 155));
Ajiza araf171= new Ajiza(sourate:araf,numeroaya:171,beginaya:'وَإِذ نَتَقْنَا الْجَبَلَ فَوْقَهُمْ',beginverset: recupererJuz(araf, 170));
Ajiza araf189= new Ajiza(sourate:araf,numeroaya:189,beginaya:'هُوَ الَّذِي خَلَقَكُم مِّن نَّفْسٍ',beginverset: recupererJuz(araf, 188));
Ajiza anfal1= new Ajiza(sourate:anfal,numeroaya:1,beginaya:'', beginverset: recupererJuz(anfal, 0));
Ajiza anfal22= new Ajiza(sourate:anfal,numeroaya:22,beginaya:'إِنَّ شَرَّ الدَّوَابَّ عِندَ اللّهِ',beginverset: recupererJuz(anfal, 21));
Ajiza anfal41= new Ajiza(sourate:anfal,numeroaya:41,beginaya:'وَاعْلَمُواْ أَنَّمَا غَنِمْتُم مِّن',beginverset: recupererJuz(anfal, 40));
Ajiza anfal61= new Ajiza(sourate:anfal,numeroaya:61,beginaya:'وَإِن جَنَحُواْ لِلسَّلْمِ فَاجْنَحْ',beginverset: recupererJuz(anfal, 60));
Ajiza tawbah1= new Ajiza(sourate:tawbah,numeroaya:1,beginaya:'بَرَاءَةٌ مِّنَ اللَّهِ',beginverset: recupererJuz(tawbah, 0));
Ajiza tawbah19=new Ajiza(sourate:tawbah,numeroaya:19,beginaya:'أَجَعَلْتُمْ سِقَايَةَ الْحَاجِّ',beginverset: recupererJuz(tawbah, 18));
Ajiza tawbah34=new Ajiza(sourate:tawbah,numeroaya:34,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُواْ إِنَّ',beginverset: recupererJuz(tawbah, 33));
Ajiza tawbah46=new Ajiza(sourate:tawbah,numeroaya:46,beginaya:'وَلَوْ أَرَادُواْ الْخُرُوجَ',beginverset: recupererJuz(tawbah, 45));
Ajiza tawbah60=new Ajiza(sourate:tawbah,numeroaya:60,beginaya:'إِنَّمَا الصَّدَقَاتُ لِلْفُقَرَاء',beginverset: recupererJuz(tawbah, 59));
Ajiza tawbah75=new Ajiza(sourate:tawbah,numeroaya:75,beginaya:'وَمِنْهُم مَّنْ عَاهَدَ اللّهَ لَئِنْ',beginverset: recupererJuz(tawbah, 74));
Ajiza tawbah93=new Ajiza(sourate:tawbah,numeroaya:93,beginaya:'إِنَّمَا السَّبِيلُ عَلَى الَّذِينَ',beginverset: recupererJuz(tawbah, 92));
Ajiza tawbah111=new Ajiza(sourate:tawbah,numeroaya:111,beginaya:'إِنَّ اللّهَ اشْتَرَى مِنَ',beginverset: recupererJuz(tawbah, 110));
Ajiza tawbah122=new Ajiza(sourate:tawbah,numeroaya:122,beginaya:'وَمَا كَانَ الْمُؤْمِنُونَ',beginverset: recupererJuz(tawbah, 121));
Ajiza yunus11=new Ajiza(sourate:yunus,numeroaya:11,beginaya:'وَلَوْ يُعَجِّلُ اللّهُ لِلنَّاسِ',beginverset: recupererJuz(yunus, 10));
Ajiza yunus26=new Ajiza(sourate:yunus,numeroaya:26,beginaya:'لِّلَّذِينَ أَحْسَنُواْ الْحُسْنَى',beginverset: recupererJuz(yunus, 25));
Ajiza yunus53=new Ajiza(sourate:yunus,numeroaya:53,beginaya:'وَيَسْتَنبِئُونَكَ أَحَقٌّ هُوَ قُلْ',beginverset: recupererJuz(yunus, 52));
Ajiza yunus71=new Ajiza(sourate:yunus,numeroaya:71,beginaya:'وَاتْلُ عَلَيْهِمْ نَبَأَ نُوحٍ إِذْ',beginverset: recupererJuz(yunus, 70));
Ajiza yunus90=new Ajiza(sourate:yunus,numeroaya:90,beginaya:'وَجَاوَزْنَا بِبَنِي إِسْرَائِيلَ',beginverset: recupererJuz(yunus, 89));
Ajiza hud6=new Ajiza(sourate:hud,numeroaya:6,beginaya:'وَمَا مِن دَآبَّةٍ فِي الأَرْضِ',beginverset: recupererJuz(hud, 5));
Ajiza hud24=new Ajiza(sourate:hud,numeroaya:24,beginaya:'مَثَلُ الْفَرِيقَيْنِ كَالأَعْمَى',beginverset: recupererJuz(hud, 23))  ;
Ajiza hud41=new Ajiza(sourate:hud,numeroaya:41,beginaya:'وَقَالَ ارْكَبُواْ فِيهَا بِسْمِ',beginverset: recupererJuz(hud, 40));
Ajiza hud61=new Ajiza(sourate:hud,numeroaya:61,beginaya:'وَإِلَى ثَمُودَ أَخَاهُمْ صَالِحًا',beginverset: recupererJuz(hud, 60));
Ajiza hud84=new Ajiza(sourate:hud,numeroaya:84,beginaya:'وَإِلَى مَدْيَنَ أَخَاهُمْ شُعَيْبًا',beginverset: recupererJuz(hud, 83));
Ajiza hud108=new Ajiza(sourate:hud,numeroaya:108,beginaya:'وَأَمَّا الَّذِينَ سُعِدُواْ فَفِي',beginverset: recupererJuz(hud, 107));
Ajiza yussuf7=new Ajiza(sourate:yussuf,numeroaya:7,beginaya:'لَّقَدْ كَانَ فِي يُوسُفَ وَإِخْوَتِهِ',beginverset: recupererJuz(yussuf, 6));
Ajiza yussuf30=new Ajiza(sourate:yussuf,numeroaya:30,beginaya:'وَقَالَ نِسْوَةٌ فِي الْمَدِينَةِ',beginverset: recupererJuz(yussuf, 29));
Ajiza yussuf53=new Ajiza(sourate:yussuf,numeroaya:53,beginaya:'وَمَا أُبَرِّىءُ نَفْسِي إِنَّ',beginverset: recupererJuz(yussuf, 52));
Ajiza yussuf77=new Ajiza(sourate:yussuf,numeroaya:77,beginaya:'قَالُواْ إِن يَسْرِقْ فَقَدْ سَرَقَ',beginverset: recupererJuz(yussuf, 76));
Ajiza yussuf101=new Ajiza(sourate:yussuf,numeroaya:101,beginaya:'رَبِّ قَدْ آتَيْتَنِي مِنَ الْمُلْكِ',beginverset: recupererJuz(yussuf, 100));
Ajiza arrad5=new Ajiza(sourate:arrad,numeroaya:5,beginaya:'وَإِن تَعْجَبْ فَعَجَبٌ قَوْلُهُمْ',beginverset: recupererJuz(arrad, 4));
Ajiza arrad19=new Ajiza(sourate:arrad,numeroaya:19,beginaya:'أَفَمَن يَعْلَمُ أَنَّمَا أُنزِلَ',beginverset: recupererJuz(arrad, 18));
Ajiza arrad35=new Ajiza(sourate:arrad,numeroaya:35,beginaya:'مَّثَلُ الْجَنَّةِ الَّتِي وُعِدَ',beginverset: recupererJuz(arrad, 34));
Ajiza ibrahim10=new Ajiza(sourate:ibrahim,numeroaya:10,beginaya:'قَالَتْ رُسُلُهُمْ أَفِي اللّهِ شَكٌّ',beginverset: recupererJuz(ibrahim, 9));
Ajiza ibrahim28=new Ajiza(sourate:ibrahim,numeroaya:28,beginaya:'أَلَمْ تَرَ إِلَى الَّذِينَ بَدَّلُواْ',beginverset: recupererJuz(ibrahim, 27));
Ajiza alhijr1=new Ajiza(sourate:alhijr,numeroaya:1,beginaya:'الَرَ تِلْكَ آيَاتُ الْكِتَابِ',beginverset: recupererJuz(alhijr, 0));
Ajiza alhijr49=new Ajiza(sourate:alhijr,numeroaya:49,beginaya:'نَبِّىءْ عِبَادِي أَنِّي أَنَا الْغَفُورُ الرَّحِيمُ ',beginverset: recupererJuz(alhijr, 48));
Ajiza annahl1=new Ajiza(sourate:annahl,numeroaya:1,beginaya:'أَتَى أَمْرُ اللّهِ فَلاَ',beginverset: recupererJuz(annahl, 0));
Ajiza annahl30=new Ajiza(sourate:annahl,numeroaya:30,beginaya:'وَقِيلَ لِلَّذِينَ اتَّقَوْاْ مَاذَا',beginverset: recupererJuz(annahl, 29));
Ajiza annahl51=new Ajiza(sourate:annahl,numeroaya:51,beginaya:'وَقَالَ اللّهُ لاَ تَتَّخِذُواْ ',beginverset: recupererJuz(annahl, 50));
Ajiza annahl75=new Ajiza(sourate:annahl,numeroaya:75,beginaya:'ضَرَبَ اللّهُ مَثَلاً عَبْدًا',beginverset: recupererJuz(annahl, 74));
Ajiza annahl90=new Ajiza(sourate:annahl,numeroaya:90,beginaya:'إِنَّ اللّهَ يَأْمُرُ بِالْعَدْلِ',beginverset: recupererJuz(annahl, 89));
Ajiza annahl111=new Ajiza(sourate:annahl,numeroaya:111,beginaya:'يَوْمَ تَأْتِي كُلُّ نَفْسٍ تُجَادِلُ',beginverset: recupererJuz(annahl, 110));
Ajiza alisra1=new Ajiza(sourate:alisra,numeroaya:1,beginaya:'سُبْحَانَ الَّذِي أَسْرَى بِعَبْدِهِ',beginverset: recupererJuz(alisra, 0));
Ajiza alisra23=new Ajiza(sourate:alisra,numeroaya:23,beginaya:'وَقَضَى رَبُّكَ أَلاَّ تَعْبُدُواْ',beginverset: recupererJuz(alisra, 22));
Ajiza alisra50=new Ajiza(sourate:alisra,numeroaya:50,beginaya:'قُل كُونُواْ حِجَارَةً أَوْ حَدِيدًا',beginverset: recupererJuz(alisra, 49));
Ajiza alisra70=new Ajiza(sourate:alisra,numeroaya:70,beginaya:'وَلَقَدْ كَرَّمْنَا بَنِي آدَمَ',beginverset: recupererJuz(alisra, 69));
Ajiza alisra99=new Ajiza(sourate:alisra,numeroaya:99,beginaya:'أَوَلَمْ يَرَوْاْ أَنَّ اللّهَ الَّذِي',beginverset: recupererJuz(alisra, 98));
Ajiza alkahf32=new Ajiza(sourate:alkahf,numeroaya:32,beginaya:'وَاضْرِبْ لَهُم مَّثَلًا رَّجُلَيْنِ',beginverset: recupererJuz(alkahf, 31));
Ajiza alkahf51=new Ajiza(sourate:alkahf,numeroaya:51,beginaya:'مَا أَشْهَدتُّهُمْ خَلْقَ',beginverset: recupererJuz(alkahf, 50));
Ajiza alkahf75=new Ajiza(sourate:alkahf,numeroaya:75,beginaya:'قَالَ أَلَمْ أَقُل لَّكَ إِنَّكَ لَن',beginverset: recupererJuz(alkahf, 74));
Ajiza alkahf99=new Ajiza(sourate:alkahf,numeroaya:99,beginaya:'وَتَرَكْنَا بَعْضَهُمْ يَوْمَئِذٍ',beginverset: recupererJuz(alkahf, 98));
Ajiza alkahf17=new Ajiza(sourate:alkahf,numeroaya:17,beginaya:'وَتَرَى الشَّمْسَ إِذَا طَلَعَت',beginverset: recupererJuz(alkahf, 16));
Ajiza maryam22=new Ajiza(sourate:maryam,numeroaya:22,beginaya:'فَحَمَلَتْهُ فَانتَبَذَتْ بِهِ',beginverset: recupererJuz(alkahf, 21));
Ajiza maryam59=new Ajiza(sourate:maryam,numeroaya:59,beginaya:'فَخَلَفَ مِن بَعْدِهِمْ خَلْفٌ',beginverset: recupererJuz(alkahf, 58));
Ajiza taha1=new Ajiza(sourate:taha,numeroaya:1,beginaya:'طه',beginverset: recupererJuz(taha, 0));
Ajiza taha55=new Ajiza(sourate:taha,numeroaya:55,beginaya:'مِنْهَا خَلَقْنَاكُمْ وَفِيهَا',beginverset: recupererJuz(taha, 54));
Ajiza taha83=new Ajiza(sourate:taha,numeroaya:83,beginaya:'وَمَا أَعْجَلَكَ عَن قَوْمِكَ يَا',beginverset: recupererJuz(taha, 82));
Ajiza taha111=new Ajiza(sourate:taha,numeroaya:111,beginaya:'وَعَنَتِ الْوُجُوهُ لِلْحَيِّ',beginverset: recupererJuz(taha, 110));
Ajiza alnabiya1=new Ajiza(sourate:alanbiya,numeroaya:1,beginaya:'اقْتَرَبَ لِلنَّاسِ حِسَابُهُمْ',beginverset: recupererJuz(alanbiya, 0));
Ajiza alnabiya29=new Ajiza(sourate:alanbiya,numeroaya:29,beginaya:'وَمَن يَقُلْ مِنْهُمْ إِنِّي إِلَهٌ ',beginverset: recupererJuz(alanbiya, 28));
Ajiza alnabiya51=new Ajiza(sourate:alanbiya,numeroaya:51,beginaya:'وَلَقَدْ آتَيْنَا إِبْرَاهِيمَ',beginverset: recupererJuz(alanbiya, 50));
Ajiza alnabiya83=new Ajiza(sourate:alanbiya,numeroaya:83,beginaya:'وَأَيُّوبَ إِذْ نَادَى رَبَّهُ أَنِّي',beginverset: recupererJuz(alanbiya, 82));
Ajiza alHajj1=new Ajiza(sourate:alhadjj,numeroaya:1,beginaya:'يَا أَيُّهَا النَّاسُ اتَّقُوا',beginverset: recupererJuz(alhadjj, 0));
Ajiza alHajj19=new Ajiza(sourate:alhadjj,numeroaya:19,beginaya:'هَذَانِ خَصْمَانِ اخْتَصَمُوا فِي',beginverset: recupererJuz(alhadjj, 18));
Ajiza alHajj38=new Ajiza(sourate:alhadjj,numeroaya:38,beginaya:'إِنَّ اللَّهَ يُدَافِعُ عَنِ الَّذِينَ',beginverset: recupererJuz(alhadjj, 37));
Ajiza alHajj60=new Ajiza(sourate:alhadjj,numeroaya:60,beginaya:'ذَلِكَ وَمَنْ عَاقَبَ بِمِثْلِ مَا',beginverset: recupererJuz(alhadjj, 59));
Ajiza muminum1=new Ajiza(sourate:muminun,numeroaya:1,beginaya:'قَدْ أَفْلَحَ الْمُؤْمِنُونَ',beginverset: recupererJuz(muminun, 0));
Ajiza muminum36=new Ajiza(sourate:muminun,numeroaya:36,beginaya:'هَيْهَاتَ هَيْهَاتَ لِمَا تُوعَدُونَ ',beginverset: recupererJuz(muminun, 35));
Ajiza muminum75=new Ajiza(sourate:muminun,numeroaya:75,beginaya:'وَلَوْ رَحِمْنَاهُمْ وَكَشَفْنَا مَا',beginverset: recupererJuz(muminun, 74));
Ajiza annur1=new Ajiza(sourate:annur,numeroaya:1,beginaya:'سُورَةٌ أَنزَلْنَاهَا وَفَرَضْنَاهَا',beginverset: recupererJuz(annur, 0));
Ajiza annur21=new Ajiza(sourate:annur,numeroaya:21,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا',beginverset: recupererJuz(annur, 20));
Ajiza annur35=new Ajiza(sourate:annur,numeroaya:35,beginaya:'اللَّهُ نُورُ السَّمَاوَاتِ',beginverset: recupererJuz(annur, 34));
Ajiza annur53=new Ajiza(sourate:annur,numeroaya:53,beginaya:'وَأَقْسَمُوا بِاللَّهِ جَهْدَ',beginverset: recupererJuz(annur, 52));
Ajiza furqan1=new Ajiza(sourate:furqan,numeroaya:1,beginaya:'تَبَارَكَ الَّذِي نَزَّلَ',beginverset: recupererJuz(furqan, 0));
Ajiza furqan21=new Ajiza(sourate:furqan,numeroaya:21,beginaya:'وَقَالَ الَّذِينَ لَا يَرْجُونَ',beginverset: recupererJuz(furqan, 20));
Ajiza furqan53=new Ajiza(sourate:furqan,numeroaya:53,beginaya:'وَهُوَ الَّذِي مَرَجَ الْبَحْرَيْنِ',beginverset: recupererJuz(furqan, 52));
Ajiza ashura1=new Ajiza(sourate:ashura,numeroaya:1,beginaya:'طسم ',beginverset: recupererJuz(ashura, 0));
Ajiza ashura52=new Ajiza(sourate:ashura,numeroaya:52,beginaya:'وَأَوْحَيْنَا إِلَى مُوسَى أَنْ',beginverset: recupererJuz(ashura, 51));
Ajiza ashura111=new Ajiza(sourate:ashura,numeroaya:111,beginaya:'قَالُوا أَنُؤْمِنُ لَكَ وَاتَّبَعَكَ ',beginverset: recupererJuz(ashura, 110));
Ajiza ashura181=new Ajiza(sourate:ashura,numeroaya:181,beginaya:'أَوْفُوا الْكَيْلَ وَلَا تَكُونُوا',beginverset: recupererJuz(ashura, 180));
Ajiza annaml1=new Ajiza(sourate:annaml,numeroaya:1,beginaya:'طس تِلْكَ آيَاتُ الْقُرْآنِ',beginverset: recupererJuz(annaml, 0));
Ajiza annaml27=new Ajiza(sourate:annaml,numeroaya:27,beginaya:'قَالَ سَنَنظُرُ أَصَدَقْتَ أَمْ كُنتَ ',beginverset: recupererJuz(annaml, 26));
Ajiza annaml56=new Ajiza(sourate:annaml,numeroaya:56,beginaya:'فَمَا كَانَ جَوَابَ قَوْمِهِ إِلَّا',beginverset: recupererJuz(annaml, 55));
Ajiza annaml82=new Ajiza(sourate:annaml,numeroaya:82,beginaya:'وَإِذَا وَقَعَ الْقَوْلُ عَلَيْهِمْ',beginverset: recupererJuz(annaml, 82));
Ajiza alqasas12=new Ajiza(sourate:alqasas,numeroaya:12,beginaya:'وَحَرَّمْنَا عَلَيْهِ الْمَرَاضِعَ',beginverset: recupererJuz(alqasas, 11));
Ajiza alqasas29=new Ajiza(sourate:alqasas,numeroaya:29,beginaya:'فَلَمَّا قَضَى مُوسَىالْأَجَلَ',beginverset: recupererJuz(alqasas, 28));
Ajiza alqasas51=new Ajiza(sourate:alqasas,numeroaya:51,beginaya:'وَلَقَدْ وَصَّلْنَا لَهُمُ الْقَوْلَ',beginverset: recupererJuz(alqasas, 50));
Ajiza alqasas76=new Ajiza(sourate:alqasas,numeroaya:76,beginaya:'إِنَّ قَارُونَ كَانَ مِن قَوْمِ',beginverset: recupererJuz(alqasas, 75));
Ajiza ankatub1=new Ajiza(sourate:ankabut,numeroaya:1,beginaya:'الم ',beginverset: recupererJuz(ankabut, 0));
Ajiza ankatub26=new Ajiza(sourate:ankabut,numeroaya:26,beginaya:'فَآمَنَ لَهُ لُوطٌ وَقَالَ إِنِّي',beginverset: recupererJuz(ankabut, 25));
Ajiza ankatub46=new Ajiza(sourate:ankabut,numeroaya:46,beginaya:'وَلَا تُجَادِلُوا أَهْلَ الْكِتَابِ',beginverset: recupererJuz(ankabut, 45));
Ajiza arum1=new Ajiza(sourate:arum,numeroaya:1,beginaya:'الم ',beginverset: recupererJuz(arum,0));
Ajiza arum31=new Ajiza(sourate:arum,numeroaya:31,beginaya:'مُنِيبِينَ إِلَيْهِ وَاتَّقُوهُ',beginverset: recupererJuz(arum,30));
Ajiza arum54=new Ajiza(sourate:arum,numeroaya:54,beginaya:'اللَّهُ الَّذِي خَلَقَكُم مِّن ضَعْفٍ ',beginverset: recupererJuz(arum, 53));
Ajiza luqman22=new Ajiza(sourate:luqman,numeroaya:22,beginaya:'وَمَن يُسْلِمْ وَجْهَهُ إِلَى اللَّهِ',beginverset: recupererJuz(luqman, 21));
Ajiza aasajda11=new Ajiza(sourate:asajdah,numeroaya:11,beginaya:'قُلْ يَتَوَفَّاكُم مَّلَكُ الْمَوْتِ',beginverset: recupererJuz(asajdah, 10));
Ajiza alhazab1=new Ajiza(sourate:alhazab,numeroaya:1,beginaya:'يَا أَيُّهَا النَّبِيُّ اتَّقِ',beginverset: recupererJuz(alhazab, 0));
Ajiza alhazab18=new Ajiza(sourate:alhazab,numeroaya:18,beginaya:'قَدْ يَعْلَمُ اللَّهُ الْمُعَوِّقِينَ ',beginverset: recupererJuz(alhazab, 18));
Ajiza alhazab31=new Ajiza(sourate:alhazab,numeroaya:31,beginaya:'وَمَن يَقْنُتْ مِنكُنَّ لِلَّهِ ',beginverset: recupererJuz(alhazab, 30));
Ajiza alhazab51=new Ajiza(sourate:alhazab,numeroaya:51,beginaya:'تُرْجِي مَن تَشَاء مِنْهُنَّ ',beginverset: recupererJuz(alhazab, 50));
Ajiza alhazab60=new Ajiza(sourate:alhazab,numeroaya:60,beginaya:'لَئِن لَّمْ يَنتَهِ الْمُنَافِقُونَ ',beginverset: recupererJuz(alhazab, 59));
Ajiza saba10=new Ajiza(sourate:saba,numeroaya:10,beginaya:'وَلَقَدْ آتَيْنَا دَاوُودَ مِنَّا',beginverset: recupererJuz(saba, 9));
Ajiza saba24=new Ajiza(sourate:saba,numeroaya:24,beginaya:'قُلْ مَن يَرْزُقُكُم مِّنَ',beginverset: recupererJuz(saba, 23));
Ajiza saba46=new Ajiza(sourate:saba,numeroaya:46,beginaya:'قُلْ إِنَّمَا أَعِظُكُم بِوَاحِدَةٍ ',beginverset: recupererJuz(saba, 45));
Ajiza fatir15=new Ajiza(sourate:fatir,numeroaya:15,beginaya:'يَا أَيُّهَا النَّاسُ أَنتُمُ',beginverset: recupererJuz(fatir, 14));
Ajiza fatir41=new Ajiza(sourate:fatir,numeroaya:41,beginaya:'إِنَّ اللَّهَ يُمْسِكُ السَّمَاوَاتِ',beginverset: recupererJuz(fatir, 40));
Ajiza yassin28=new Ajiza(sourate:yassin,numeroaya:28,beginaya:'وَمَا أَنزَلْنَا عَلَى قَوْمِهِ مِن',beginverset: recupererJuz(yassin, 27));
Ajiza yassin60=new Ajiza(sourate:yassin,numeroaya:60,beginaya:'أَلَمْ أَعْهَدْ إِلَيْكُمْ يَا بَنِي ',beginverset: recupererJuz(yassin, 59));
Ajiza assafat22=new Ajiza(sourate:assafat,numeroaya:22,beginaya:'احْشُرُوا الَّذِينَ ظَلَمُوا',beginverset: recupererJuz(assafat, 21));
Ajiza assafat83=new Ajiza(sourate:assafat,numeroaya:83,beginaya:'وَإِنَّ مِن شِيعَتِهِ لَإِبْرَاهِيمَ ',beginverset: recupererJuz(assafat, 82));
Ajiza assafat145=new Ajiza(sourate:assafat,numeroaya:145,beginaya:'فَنَبَذْنَاهُ بِالْعَرَاء وَهُوَ',beginverset: recupererJuz(assafat, 144));
Ajiza sad21=new Ajiza(sourate:sad,numeroaya:21,beginaya:'وَهَلْ أَتَاكَ نَبَأُ الْخَصْمِ إِذْ',beginverset: recupererJuz(sad, 20));
Ajiza sad52=new Ajiza(sourate:sad,numeroaya:52,beginaya:'وَعِندَهُمْ قَاصِرَاتُ الطَّرْفِ',beginverset: recupererJuz(sad, 51));
Ajiza azzumar8=new Ajiza(sourate:azzumar,numeroaya:8,beginaya:'وَإِذَا مَسَّ الْإِنسَانَ ضُرٌّ دَعَا',beginverset: recupererJuz(azzumar, 7));
Ajiza azzumar32=new Ajiza(sourate:azzumar,numeroaya:32,beginaya:'فَمَنْ أَظْلَمُ مِمَّن كَذَبَ عَلَى',beginverset: recupererJuz(azzumar, 31));
Ajiza azzumar53=new Ajiza(sourate:azzumar,numeroaya:53,beginaya:'قُلْ يَا عِبَادِيَ الَّذِينَ',beginverset: recupererJuz(azzumar, 52));
Ajiza ghafir1=new Ajiza(sourate:ghafir,numeroaya:1,beginaya:'حم ',beginverset: recupererJuz(ghafir, 0));
Ajiza ghafir21=new Ajiza(sourate:ghafir,numeroaya:21,beginaya:'أَوَ لَمْ يَسِيرُوا فِي الْأَرْضِ',beginverset: recupererJuz(ghafir, 20));
Ajiza ghafir41=new Ajiza(sourate:ghafir,numeroaya:41,beginaya:'وَيَا قَوْمِ مَا لِي أَدْعُوكُمْ إِلَى',beginverset: recupererJuz(ghafir, 40));
Ajiza ghafir66=new Ajiza(sourate:ghafir,numeroaya:66,beginaya:'قُلْ إِنِّي نُهِيتُ أَنْ أَعْبُدَ',beginverset: recupererJuz(ghafir, 65));
Ajiza fussila9=new Ajiza(sourate:fussila,numeroaya:9,beginaya:'قُلْ أَئِنَّكُمْ لَتَكْفُرُونَ',beginverset: recupererJuz(fussila, 9));
Ajiza fussila25=new Ajiza(sourate:fussila,numeroaya:25,beginaya:'وَقَيَّضْنَا لَهُمْ قُرَنَاء',beginverset: recupererJuz(fussila, 24));
Ajiza fussila47=new Ajiza(sourate:fussila,numeroaya:47,beginaya:'إِلَيْهِ يُرَدُّ عِلْمُ السَّاعَةِ',beginverset: recupererJuz(fussila,46));
Ajiza ashshura13=new Ajiza(sourate:ashshura,numeroaya:13,beginaya:'شَرَعَ لَكُم مِّنَ الدِّينِ مَا ',beginverset: recupererJuz(ashshura, 12));
Ajiza ashshura27=new Ajiza(sourate:ashshura,numeroaya:27,beginaya:'وَلَوْ بَسَطَ اللَّهُ الرِّزْقَ',beginverset: recupererJuz(ashshura, 26));
Ajiza ashshura51=new Ajiza(sourate:ashshura,numeroaya:51,beginaya:'وَمَا كَانَ لِبَشَرٍ أَن يُكَلِّمَهُ',beginverset: recupererJuz(ashshura, 50));
Ajiza azukhruf24=new Ajiza(sourate:azukhruf,numeroaya:24,beginaya:'قَالَ أَوَلَوْ جِئْتُكُم بِأَهْدَى',beginverset: recupererJuz(azukhruf, 23));
Ajiza azukhruf57=new Ajiza(sourate:azukhruf,numeroaya:57,beginaya:'وَلَمَّا ضُرِبَ ابْنُ مَرْيَمَ مَثَلًا',beginverset: recupererJuz(azukhruf, 56));
Ajiza addukhan17=new Ajiza(sourate:addukhan,numeroaya:17,beginaya:'وَلَقَدْ فَتَنَّا قَبْلَهُمْ قَوْمَ',beginverset: recupererJuz(addukhan, 16));
Ajiza aljathiya12=new Ajiza(sourate:aljathiya,numeroaya:12,beginaya:'اللَّهُ الَّذِي سخَّرَ لَكُمُ',beginverset: recupererJuz(aljathiya, 12));
Ajiza alahqaf1=new Ajiza(sourate:alahqaf,numeroaya:1,beginaya:'حم ',beginverset: recupererJuz(alahqaf, 0));
Ajiza alahqaf21=new Ajiza(sourate:alahqaf,numeroaya:21,beginaya:'وَاذْكُرْ أَخَا عَادٍ إِذْ أَنذَرَ',beginverset: recupererJuz(alahqaf, 20));
Ajiza mouhamed10=new Ajiza(sourate:mouhamed,numeroaya:10,beginaya:'أَفَلَمْ يَسِيرُوا فِي الْأَرْضِ',beginverset: recupererJuz(mouhamed, 9));
Ajiza mouhamed33=new Ajiza(sourate:mouhamed,numeroaya:33,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُوا',beginverset: recupererJuz(mouhamed, 32));
Ajiza alfath18=new Ajiza(sourate:alfath,numeroaya:18,beginaya:'َقَدْ رَضِيَ اللَّهُ عَنِ',beginverset: recupererJuz(alfath, 17));
Ajiza alhujurat1=new Ajiza(sourate:alhujurat,numeroaya:1,beginaya:'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا',beginverset: recupererJuz(alhujurat, 0));
Ajiza alhujurat14=new Ajiza(sourate:alhujurat,numeroaya:14,beginaya:'قَالَتِ الْأَعْرَابُ آمَنَّا قُل',beginverset: recupererJuz(alhujurat, 13));
Ajiza qaf27=new Ajiza(sourate:qaf,numeroaya:27,beginaya:'قَالَ قَرِينُهُ رَبَّنَا مَا ',beginverset: recupererJuz(qaf, 26));
Ajiza adhariyat31=new Ajiza(sourate:adhariyat,numeroaya:31,beginaya:'قَالَ فَمَا خَطْبُكُمْ أَيُّهَا',beginverset: recupererJuz(adhariyat, 30));
Ajiza attur24=new Ajiza(sourate:attur,numeroaya:24,beginaya:'وَيَطُوفُ عَلَيْهِمْ غِلْمَانٌ',beginverset: recupererJuz(attur, 23));
Ajiza annajm26=new Ajiza(sourate:annajm,numeroaya:26,beginaya:'وَكَم مِّن مَّلَكٍ فِي السَّمَاوَاتِ',beginverset: recupererJuz(annajm, 25));
Ajiza alqamar9=new Ajiza(sourate:alqamar,numeroaya:9,beginaya:'كَذَّبَتْ قَبْلَهُمْ قَوْمُ نُوحٍ',beginverset: recupererJuz(alqamar, 8));
Ajiza arahman1=new Ajiza(sourate:arrahman,numeroaya:1,beginaya:'الرَّحْمَنُ ',beginverset: recupererJuz(arrahman, 0));
Ajiza alwaqiah1=new Ajiza(sourate:alwaqiah,numeroaya:1,beginaya:'إِذَا وَقَعَتِ الْوَاقِعَةُ ',beginverset: recupererJuz(alwaqiah, 1));
Ajiza alwaqiah75=new Ajiza(sourate:alwaqiah,numeroaya:75,beginaya:'فَلَا أُقْسِمُ بِمَوَاقِعِ النُّجُومِ',beginverset: recupererJuz(alwaqiah, 74));
Ajiza alhadid16=new Ajiza(sourate:alhadid,numeroaya:16,beginaya:'أَلَمْ يَأْنِ لِلَّذِينَ آمَنُوا أَن',beginverset: recupererJuz(alhadid, 15));
Ajiza almujadila1=new Ajiza(sourate:almujadila,numeroaya:1,beginaya:'قَدْ سَمِعَ اللَّهُ قَوْلَ الَّتِي ',beginverset: recupererJuz(almujadila, 0));
Ajiza almujadila14=new Ajiza(sourate:almujadila,numeroaya:14,beginaya:'أَلَمْ تَرَ إِلَى الَّذِينَ تَوَلَّوْا',beginverset: recupererJuz(almujadila, 13));
Ajiza alhashr11=new Ajiza(sourate:alhashr,numeroaya:11,beginaya:'أَلَمْ تَر إِلَى الَّذِينَ نَافَقُوا',beginverset: recupererJuz(alhashr, 10));
Ajiza almumtaHana7=new Ajiza(sourate:almumtaHana,numeroaya:7,beginaya:'عَسَى اللَّهُ أَن يَجْعَلَ بَيْنَكُمْ',beginverset: recupererJuz(almumtaHana, 6));
Ajiza aljuma1=new Ajiza(sourate:aljumah,numeroaya:1,beginaya:'يُسَبِّحُ لِلَّهِ مَا فِي',beginverset: recupererJuz(aljumah, 0));
Ajiza almunafiqun4=new Ajiza(sourate:almunafiqun,numeroaya:4,beginaya:'وَإِذَا رَأَيْتَهُمْ تُعْجِبُكَ',beginverset: recupererJuz(almunafiqun, 3));
Ajiza attalaq1=new Ajiza(sourate:attalaq,numeroaya:1,beginaya:'يَا أَيُّهَا النَّبِيُّ إِذَا',beginverset: recupererJuz(attalaq, 0));
Ajiza attahrim1=new Ajiza(sourate:attahrim,numeroaya:1,beginaya:'يَا أَيُّهَا النَّبِيُّ لِمَ',beginverset: recupererJuz(attahrim, 0));
Ajiza almulk1=new Ajiza(sourate:almulk,numeroaya:1,beginaya:'تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ',beginverset: recupererJuz(almulk, 0));
Ajiza alqalam1=new Ajiza(sourate:alqalam,numeroaya:1,beginaya:'ن وَالْقَلَمِ وَمَا يَسْطُرُونَ ',beginverset: recupererJuz(alqalam, 0));
Ajiza alhaqqah1=new Ajiza(sourate:alhaqqa,numeroaya:1,beginaya:'الْحَاقَّةُ ',beginverset: recupererJuz(alhaqqa, 0));
Ajiza aljinn1=new Ajiza(sourate:aljinn,numeroaya:1,beginaya:'قُلْ أُوحِيَ إِلَيَّ أَنَّهُ ',beginverset: recupererJuz(aljinn, 0));
Ajiza alqiyamah1=new Ajiza(sourate:alqiyamah,numeroaya:1,beginaya:'لَا أُقْسِمُ بِيَوْمِ الْقِيَامَةِ',beginverset: recupererJuz(alqiyamah, 0));
Ajiza almarij19=new Ajiza(sourate:almarij,numeroaya:19,beginaya:'إِنَّ الْإِنسَانَ خُلِقَ هَلُوعًا ',beginverset: recupererJuz(almarij, 18));
// al jin a ajoutter ici aya 1
Ajiza almuzzammil20=new Ajiza(sourate:almuzzammil,numeroaya:20,beginaya:'إِنَّ رَبَّكَ يَعْلَمُ أَنَّكَ تَقُومُ',beginverset: recupererJuz(almuzzammil, 19));
//al quiyama a mettre aussi ayat 1
Ajiza alinsan19=new Ajiza(sourate:alinssan,numeroaya:19,beginaya:'وَيَطُوفُ عَلَيْهِمْ وِلْدَانٌ',beginverset: recupererJuz(alinssan, 18));
Ajiza annaba1=new Ajiza(sourate:annaba,numeroaya:1,beginaya:'عَمَّ يَتَسَاءلُونَ ',beginverset: recupererJuz(annaba, 0));
Ajiza abassa1=new Ajiza(sourate:abassa,numeroaya:1,beginaya:'عَبَسَ وَتَوَلَّى',beginverset: recupererJuz(abassa, 0));
Ajiza alinfitar1=new Ajiza(sourate:infitar,numeroaya:1,beginaya:'إِذَا السَّمَاء انفَطَرَتْ ',beginverset: recupererJuz(infitar, 0));
Ajiza alinshiqaq1=new Ajiza(sourate:inshiqaq,numeroaya:1,beginaya:'إِذَا السَّمَاء انشَقَّتْ ',beginverset: recupererJuz(inshiqaq, 0));
Ajiza alala1=new Ajiza(sourate:alala,numeroaya:1,beginaya:'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى ',beginverset: recupererJuz(alala, 0));
Ajiza albalad1=new Ajiza(sourate:abalad,numeroaya:1,beginaya:'لَا أُقْسِمُ بِهَذَا الْبَلَدِ ',beginverset: recupererJuz(abalad, 0));
Ajiza alsharh1=new Ajiza(sourate:alsharh,numeroaya:1,beginaya:'أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ ',beginverset: recupererJuz(alsharh, 0));
Ajiza aladiyat9=new Ajiza(sourate:aladiyat,numeroaya:9,beginaya:'أَفَلَا يَعْلَمُ إِذَا بُعْثِرَ مَا ',beginverset: recupererJuz(aladiyat, 8));




  


