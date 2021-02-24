import 'Allsourate.dart';

class MesSourates {
  String numero;
  Sourate sourate;
  String nbaya;
  String lieu;

  MesSourates({this.numero, this.nbaya, this.sourate, this.lieu});
  String getNumero() => this.numero;
  String getLieu() => this.lieu;
  String getNbaya() => this.nbaya;
  Sourate getSourate() => this.sourate;

// factory MesSourates.fromJson(Map<String,dynamic> map){
//   return MesSourates(
//   numero:map['numero'],
//   lieu:map['lieu'],
//   nbaya:map['nbaya'],
//   sourate:map['sourate']
//   );

// }
// Map<String,dynamic> toJson(){
//   Map<String,dynamic> js=new Map<String,dynamic>();
//   js['numero']=this.numero;
//   js['lieu']=this.lieu;
//   js['nbaya']=this.nbaya;
//   js['sourate']=this.sourate;
//   return js;

// }

// File createFile(Map<String,dynamic> content){
// File file=new File(dir.path+'/'+filename);
// String filename='mesourates';
// List<Map<String,dynamic>> listjs=new List<Map<String,dynamic>>();
// file.createSync();
// mesSourates.forEach((sourate) {

//    file.openWrite(sourate.toJson());

// });

// }
}

List<MesSourates> mesSourates = [
  MesSourates(
      numero: "/001", nbaya: 'Màkka - 7 Laaya', sourate: fatiya, lieu: 'Màkka'),
  MesSourates(
      numero: "/002",
      nbaya: 'Màddina - 286 Laaya',
      sourate: baqara,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/003",
      nbaya: 'Màddina - 200 Laaya',
      sourate: imran,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/004",
      nbaya: 'Màddina - 176 Laaya',
      sourate: nisa,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/005",
      nbaya: 'Màddina - 120 Laaya',
      sourate: maIda,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/006", nbaya: 'Màkka - 165 Laaya', sourate: anam, lieu: 'Màkka'),
  MesSourates(
      numero: "/007", nbaya: 'Meque - 206 Laaya', sourate: araf, lieu: 'Màkka'),
  MesSourates(
      numero: "/008",
      nbaya: 'Màddina - 75 Laaya',
      sourate: anfal,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/009",
      nbaya: 'Màddina - 129 Laaya',
      sourate: tawbah,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/010",
      nbaya: 'Màkka - 109 Laaya',
      sourate: yunus,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/011", nbaya: 'Màkka 123 Laaya', sourate: hud, lieu: 'Màkka'),
  MesSourates(
      numero: "/012", nbaya: 'Màkka 111 Laaya', sourate: yussuf, lieu: 'Màkka'),
  MesSourates(
      numero: "/013",
      nbaya: 'Màddina - 43 Laaya',
      sourate: arrad,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/014", nbaya: 'Màkka 52 Laaya', sourate: ibrahim, lieu: 'Màkka'),
  MesSourates(
      numero: "/015", nbaya: 'Màkka 99 Laaya', sourate: alhijr, lieu: 'Màkka'),
  MesSourates(
      numero: "/016", nbaya: 'Màkka 128 Laaya', sourate: annahl, lieu: 'Màkka'),
  MesSourates(
      numero: "/017", nbaya: 'Màkka 111 Laaya', sourate: alisra, lieu: 'Màkka'),
  MesSourates(
      numero: "/018", nbaya: 'Màkka 110 Laaya', sourate: alkahf, lieu: 'Màkka'),
  MesSourates(
      numero: "/019", nbaya: 'Màkka 98 Laaya', sourate: maryam, lieu: 'Màkka'),
  MesSourates(
      numero: "/020", nbaya: 'Màkka 135 Laaya', sourate: taha, lieu: 'Màkka'),
  MesSourates(
      numero: "/021",
      nbaya: 'Màkka 112 Laaya',
      sourate: alanbiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/022",
      nbaya: 'Màddina - 78 Laaya',
      sourate: alhadjj,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/023",
      nbaya: 'Màkka 118 Laaya',
      sourate: muminun,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/024",
      nbaya: 'Màddina 64 Laaya',
      sourate: annur,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/025", nbaya: 'Màkka 77 Laaya', sourate: furqan, lieu: 'Màkka'),
  MesSourates(
      numero: "/026", nbaya: 'Màkka 227 Laaya', sourate: ashura, lieu: 'Màkka'),
  MesSourates(
      numero: "/027", nbaya: 'Meque 93 Laaya', sourate: annaml, lieu: 'Màkka'),
  MesSourates(
      numero: "/028", nbaya: 'Màkka 88 Laaya', sourate: alqasas, lieu: 'Màkka'),
  MesSourates(
      numero: "/029", nbaya: 'Màkka 69 Laaya', sourate: ankabut, lieu: 'Màkka'),
  MesSourates(
      numero: "/030:", nbaya: 'Màkka 60 Laaya', sourate: arum, lieu: 'Màkka'),
  MesSourates(
      numero: "/031", nbaya: 'Màkka 34 Laaya', sourate: luqman, lieu: 'Màkka'),
  MesSourates(
      numero: "/032", nbaya: 'Màkka 30 Laaya', sourate: asajdah, lieu: 'Màkka'),
  MesSourates(
      numero: "/033",
      nbaya: 'Màddina 73 Laaya',
      sourate: alhazab,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/034", nbaya: 'Màkka 54 Laaya', sourate: saba, lieu: 'Màkka'),
  MesSourates(
      numero: "/035", nbaya: 'Màkka 45 Laaya', sourate: fatir, lieu: 'Màkka'),
  MesSourates(
      numero: "/036", nbaya: 'Màkka 83 Laaya', sourate: yassin, lieu: 'Màkka'),
  MesSourates(
      numero: '/37', nbaya: 'Màkka 182 Laaya', sourate: assafat, lieu: 'Màkka'),
  MesSourates(
      numero: "/38", nbaya: 'Màkka 88 Laaya', sourate: sad, lieu: 'Màkka'),
  MesSourates(
      numero: "/39", nbaya: 'Màkka 75 Laaya', sourate: azzumar, lieu: 'Màkka'),
  MesSourates(
      numero: "/40", nbaya: 'Màkka 85 Laaya', sourate: ghafir, lieu: 'Màkka'),
  MesSourates(
      numero: "/041", nbaya: 'Màkka 54 Laaya', sourate: fussila, lieu: 'Màkka'),
  MesSourates(
      numero: "/042",
      nbaya: 'Màkka 53 Laaya',
      sourate: ashshura,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/043",
      nbaya: 'Màkka 89 Laaya',
      sourate: azukhruf,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/044",
      nbaya: 'Màkka 59 Laaya',
      sourate: addukhan,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/045",
      nbaya: 'Màkka 37 Laaya',
      sourate: aljathiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/046", nbaya: 'Màkka 35 Laaya', sourate: alahqaf, lieu: 'Màkka'),
  MesSourates(
      numero: "/047",
      nbaya: 'Màddina 38 Laaya',
      sourate: mouhamed,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/048",
      nbaya: 'Màddina 29 yat',
      sourate: alfath,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/049",
      nbaya: 'Màddina 18 Laaya',
      sourate: alhujurat,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/050", nbaya: 'Màkka 45 Laaya', sourate: qaf, lieu: 'Màkka'),
  MesSourates(
      numero: "/051",
      nbaya: 'Màkka 60 Laaya',
      sourate: adhariyat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/052", nbaya: 'Màkka 49 Laaya', sourate: attur, lieu: 'Màkka'),
  MesSourates(
      numero: "/053", nbaya: 'Màkka 62 Laaya', sourate: annajm, lieu: 'Màkka'),
  MesSourates(
      numero: "/054", nbaya: 'Màkka 55 Laaya', sourate: alqamar, lieu: 'Màkka'),
  MesSourates(
      numero: "/055",
      nbaya: 'Màkka 78 Laaya',
      sourate: arrahman,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/056",
      nbaya: 'Màkka 96 Laaya',
      sourate: alwaqiah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/057",
      nbaya: 'Màddina 29 Laaya',
      sourate: alhadid,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/058",
      nbaya: 'Màddina 22 Laaya',
      sourate: almujadila,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/059",
      nbaya: 'Màddina 24 Laaya',
      sourate: alhashr,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/060",
      nbaya: 'Màddina 13 Laaya',
      sourate: almumtaHana,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/061",
      nbaya: 'Màddina 14 Laaya',
      sourate: assaf,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/062",
      nbaya: 'Màddina 11 Laaya',
      sourate: aljumah,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/063",
      nbaya: 'Màddina 11 Laaya',
      sourate: almunafiqun,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/064",
      nbaya: 'Màddina 18 Laaya',
      sourate: attagabun,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/065",
      nbaya: 'Màddina 12 Laaya',
      sourate: attalaq,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/066",
      nbaya: 'Màddina 12 Laaya',
      sourate: attahrim,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/067", nbaya: 'Meque 30 Laaya', sourate: almulk, lieu: 'Màkka'),
  MesSourates(
      numero: "/068", nbaya: 'Màkka 52 Laaya', sourate: alqalam, lieu: 'Màkka'),
  MesSourates(
      numero: "/069", nbaya: 'Màkka 52 Laaya', sourate: alhaqqa, lieu: 'Màkka'),
  MesSourates(
      numero: "/070", nbaya: 'Màkka 44 yat', sourate: almarij, lieu: 'Màkka'),
  MesSourates(
      numero: "/071", nbaya: 'Màkka 28 Laaya', sourate: nuh, lieu: 'Màkka'),
  MesSourates(
      numero: "/072", nbaya: 'Màkka 28 Laaya', sourate: aljinn, lieu: 'Màkka'),
  MesSourates(
      numero: "/073",
      nbaya: 'Màkka 20 Laaya',
      sourate: almuzzammil,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/074",
      nbaya: 'Màkka 56 Laaya',
      sourate: almuddathir,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/075",
      nbaya: 'Màkka 40 Laaya',
      sourate: alqiyamah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/076",
      nbaya: 'Màddina 31 Laaya',
      sourate: alinssan,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/077",
      nbaya: 'Màkka 50 Laaya',
      sourate: almursalat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/078", nbaya: 'Màkka 40 Laaya', sourate: annaba, lieu: 'Màkka'),
  MesSourates(
      numero: "/079",
      nbaya: 'Màkka 46 Laaya',
      sourate: annaziat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/080", nbaya: 'Màkka 42 Laaya', sourate: abassa, lieu: 'Màkka'),
  MesSourates(
      numero: "/081", nbaya: 'Màkka 29 Laaya', sourate: takwir, lieu: 'Màkka'),
  MesSourates(
      numero: "/082", nbaya: 'Màkka 19 Laaya', sourate: infitar, lieu: 'Màkka'),
  MesSourates(
      numero: "/083",
      nbaya: 'Màkka 36 Laaya',
      sourate: mutafifin,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/084",
      nbaya: 'Màkka 25 Laaya',
      sourate: inshiqaq,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/085",
      nbaya: 'Màddina 22 Laaya',
      sourate: alburuj,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/086", nbaya: 'Màkka 17 Laaya', sourate: tariq, lieu: 'Màkka'),
  MesSourates(
      numero: "/087", nbaya: 'Meque 19 Laaya', sourate: alala, lieu: 'Màkka'),
  MesSourates(
      numero: "/088",
      nbaya: 'Màkka 26 Laaya',
      sourate: alghasiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/089", nbaya: 'Màkka 30 Laaya', sourate: alfadjr, lieu: 'Màkka'),
  MesSourates(
      numero: "/090", nbaya: 'Màkka 20 Laaya', sourate: abalad, lieu: 'Màkka'),
  MesSourates(
      numero: "/091", nbaya: 'Màkka 15 Laaya', sourate: ashams, lieu: 'Màkka'),
  MesSourates(
      numero: "/092", nbaya: 'Màkka 21 Laaya', sourate: allayyl, lieu: 'Màkka'),
  MesSourates(
      numero: "/093", nbaya: 'Màkka 11 Laaya', sourate: aduha, lieu: 'Màkka'),
  MesSourates(
      numero: "/094", nbaya: 'Màkka 8 Laaya', sourate: alsharh, lieu: 'Màkka'),
  MesSourates(
      numero: "/095", nbaya: 'Màkka 8 Laaya', sourate: atin, lieu: 'Màkka'),
  MesSourates(
      numero: "/096", nbaya: 'Màkka 19 Laaya', sourate: alalaq, lieu: 'Màkka'),
  MesSourates(
      numero: "/097", nbaya: 'Màkka 5 Laaya', sourate: alqadr, lieu: 'Màkka'),
  MesSourates(
      numero: "/098",
      nbaya: 'Màkka 8 Laaya',
      sourate: albayyina,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/099", nbaya: 'Màkka 8 Laaya', sourate: azalzala, lieu: 'Màkka'),
  MesSourates(
      numero: "/100",
      nbaya: 'Màkka 11 Laaya',
      sourate: aladiyat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/101",
      nbaya: 'Màkka 11 Laaya',
      sourate: alqariah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/102",
      nbaya: 'Màkka 8 Laaya',
      sourate: atakathur,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/103", nbaya: 'Màkka 3 Laaya', sourate: alasr, lieu: 'Màkka'),
  MesSourates(
      numero: "/104",
      nbaya: 'Màkka 9 Laaya',
      sourate: alhumazah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/105", nbaya: 'Màkka 5 Laaya', sourate: alfil, lieu: 'Màkka'),
  MesSourates(
      numero: "/106", nbaya: 'Meque 4 Laaya', sourate: quraysh, lieu: 'Màkka'),
  MesSourates(
      numero: "/107", nbaya: 'Màkka 7 Laaya', sourate: almaun, lieu: 'Màkka'),
  MesSourates(
      numero: "/108", nbaya: 'Màkka  Ay3at', sourate: alkawthar, lieu: 'Màkka'),
  MesSourates(
      numero: "/109",
      nbaya: 'Màkka 6 Laaya',
      sourate: alkafirun,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/110",
      nbaya: 'Màddina 3 Laaya',
      sourate: anasr,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/111", nbaya: 'Màkka 5 Laaya', sourate: almasad, lieu: 'Màkka'),
  MesSourates(
      numero: "/112", nbaya: 'Màkka 4 Laaya', sourate: alikhlas, lieu: 'Màkka'),
  MesSourates(
      numero: "/113", nbaya: 'Màkka 5 Laaya', sourate: alfalaq, lieu: 'Màkka'),
  MesSourates(
      numero: "/114", nbaya: 'Màkka 6 Laaya', sourate: annas, lieu: 'Màkka')
];
