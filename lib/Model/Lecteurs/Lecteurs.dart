class Lecteur {
  String nom;
  String prenom;
  String surname;
  String ayabyaya;
  Lecteur({this.nom, this.prenom,this.surname,this.ayabyaya});

  static List<Lecteur> meslecteurs=[
    saad,abubakr,ajmi,jibel,maher,matroud,minshawi,salah,soudais,saoud,qassim
  ] ;
  
}
Lecteur soudais= new Lecteur(nom:"soudais",surname:"null",prenom:"abderrahman",ayabyaya:'Abdurrahmaan_As-Sudais_64kbps');
Lecteur saad=new Lecteur(nom:"ghamidi",prenom:"saad",surname:"null",ayabyaya: 'Ghamadi_40kbps');
Lecteur minshawi = new Lecteur(nom:"minshawi",prenom:"mohammed",surname:'siddiq', ayabyaya: 'Minshawy_Murattal_128kbps');
Lecteur matroud = new Lecteur(nom:"matroud",prenom:"abdellah",surname:'null', ayabyaya: 'Abdullah_Matroud_128kbps');
Lecteur maher = new Lecteur(nom:"mouayqli",prenom:"maher",surname:'null', ayabyaya: 'Maher_AlMuaiqly_64kbps');
Lecteur salah = new Lecteur(nom:"budair",prenom:"salah",surname:'null', ayabyaya: 'Salah_Al_Budair_128kbps');
Lecteur ajmi = new Lecteur(nom:"ajmi",prenom:"ahmed",surname:'null', ayabyaya:'ahmed_ibn_ali_al_ajamy_128kbps');
Lecteur saoud  = new Lecteur(nom:"shouraim",prenom:"saoud",surname:'null', ayabyaya:'Saood_ash-Shuraym_64kbps');
Lecteur qassim  = new Lecteur(nom:"qassim",prenom:"abdelmuhsin",surname:'null', ayabyaya:'Muhsin_Al_Qasim_192kbps');
Lecteur abubakr  = new Lecteur(nom:"shatiri",prenom:"aboubakr",surname:'null', ayabyaya:'Abu_Bakr_Ash-Shaatree_64kbps');
Lecteur jibel  = new Lecteur(nom:"jaber",prenom:"ali",surname:'null', ayabyaya:'Muhammad_Jibreel_64kbps');
List <Lecteur> lecteurs=[
  saad,minshawi,soudais,matroud,maher,salah,ajmi,saoud,qassim,abubakr,jibel
];
//Lecteur v = new Lecteur(nom:"",audio:"https://www.al-hamdoulillah.com/coran/mp3/files/");
