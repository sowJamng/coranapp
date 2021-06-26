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
      numero: "/001",
      nbaya: 'Màkka - 7i Laaya',
      sourate: fatiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/002",
      nbaya: 'Màddina - 286i Laaya',
      sourate: baqara,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/003",
      nbaya: 'Màddina - 200i Laaya',
      sourate: imran,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/004",
      nbaya: 'Màddina - 176i Laaya',
      sourate: nisa,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/005",
      nbaya: 'Màddina - 120i Laaya',
      sourate: maIda,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/006", 
      nbaya: 'Màkka - 165i Laaya', sourate: anam, lieu: 'Màkka'),
  MesSourates(
      numero: "/007", nbaya: 'Màkka - 206i Laaya', sourate: araf, lieu: 'Màkka'),
  MesSourates(
      numero: "/008",
      nbaya: 'Màddina - 75i Laaya',
      sourate: anfal,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/009",
      nbaya: 'Màddina - 129i Laaya',
      sourate: tawbah,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/010",
      nbaya: 'Màkka - 109i Laaya',
      sourate: yunus,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/011", nbaya: 'Màkka 123i Laaya', sourate: hud, lieu: 'Màkka'),
  MesSourates(
      numero: "/012",
      nbaya: 'Màkka 111i Laaya',
      sourate: yussuf,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/013",
      nbaya: 'Màddina - 43i Laaya',
      sourate: arrad,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/014",
      nbaya: 'Màkka - 52i Laaya',
      sourate: ibrahim,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/015",
      nbaya: 'Màkka - 99i Laaya',
      sourate: alhijr,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/016",
      nbaya: 'Màkka - 128i Laaya',
      sourate: annahl,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/017",
      nbaya: 'Màkka - 111i Laaya',
      sourate: alisra,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/018",
      nbaya: 'Màkka - 110i Laaya',
      sourate: alkahf,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/019",
      nbaya: 'Màkka - 98i Laaya',
      sourate: maryam,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/020",
      nbaya: 'Màkka - 135i Laaya',
      sourate: taha,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/021",
      nbaya: 'Màkka - 112i Laaya',
      sourate: alanbiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/022",
      nbaya: 'Màddina - 78i Laaya',
      sourate: alhadjj,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/023",
      nbaya: 'Màkka - 118i Laaya',
      sourate: muminun,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/024",
      nbaya: 'Màddina - 64i Laaya',
      sourate: annur,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/025",
      nbaya: 'Màkka - 77i Laaya',
      sourate: furqan,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/026",
      nbaya: 'Màkka - 227i Laaya',
      sourate: ashura,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/027",
      nbaya: 'Meque - 93i Laaya',
      sourate: annaml,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/028",
      nbaya: 'Màkka - 88i Laaya',
      sourate: alqasas,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/029",
      nbaya: 'Màkka - 69i Laaya',
      sourate: ankabut,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/030:",
      nbaya: 'Màkka - 60i Laaya',
      sourate: arum,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/031",
      nbaya: 'Màkka - 34i Laaya',
      sourate: luqman,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/032",
      nbaya: 'Màkka - 30i Laaya',
      sourate: asajdah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/033",
      nbaya: 'Màddina - 73i Laaya',
      sourate: alhazab,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/034", nbaya: 'Màkka - 54i Laaya', sourate: saba, lieu: 'Màkka'),
  MesSourates(
      numero: "/035",
      nbaya: 'Màkka - 45i Laaya',
      sourate: fatir,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/036",
      nbaya: 'Màkka - 83i Laaya',
      sourate: yassin,
      lieu: 'Màkka'),
  MesSourates(
      numero: '/37',
      nbaya: 'Màkka - 182i Laaya',
      sourate: assafat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/38", nbaya: 'Màkka - 88i Laaya', sourate: sad, lieu: 'Màkka'),
  MesSourates(
      numero: "/39",
      nbaya: 'Màkka - 75i Laaya',
      sourate: azzumar,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/40",
      nbaya: 'Màkka - 85i Laaya',
      sourate: ghafir,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/041",
      nbaya: 'Màkka - 54i Laaya',
      sourate: fussila,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/042",
      nbaya: 'Màkka - 53i Laaya',
      sourate: ashshura,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/043",
      nbaya: 'Màkka - 89i Laaya',
      sourate: azukhruf,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/044",
      nbaya: 'Màkka - 59i Laaya',
      sourate: addukhan,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/045",
      nbaya: 'Màkka - 37i Laaya',
      sourate: aljathiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/046",
      nbaya: 'Màkka - 35i Laaya',
      sourate: alahqaf,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/047",
      nbaya: 'Màddina - 38i Laaya',
      sourate: mouhamed,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/048",
      nbaya: 'Màddina 29i yat',
      sourate: alfath,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/049",
      nbaya: 'Màddina - 18i Laaya',
      sourate: alhujurat,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/050", nbaya: 'Màkka 45 Laaya', sourate: qaf, lieu: 'Màkka'),
  MesSourates(
      numero: "/051",
      nbaya: 'Màkka - 60i Laaya',
      sourate: adhariyat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/052",
      nbaya: 'Màkka - 49i Laaya',
      sourate: attur,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/053",
      nbaya: 'Màkka - 62i Laaya',
      sourate: annajm,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/054",
      nbaya: 'Màkka - 55i Laaya',
      sourate: alqamar,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/055",
      nbaya: 'Màkka - 78i Laaya',
      sourate: arrahman,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/056",
      nbaya: 'Màkka - 96i Laaya',
      sourate: alwaqiah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/057",
      nbaya: 'Màddina - 29i Laaya',
      sourate: alhadid,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/058",
      nbaya: 'Màddina - 22i Laaya',
      sourate: almujadila,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/059",
      nbaya: 'Màddina - 24i Laaya',
      sourate: alhashr,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/060",
      nbaya: 'Màddina - 13i Laaya',
      sourate: almumtaHana,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/061",
      nbaya: 'Màddina - 14i Laaya',
      sourate: assaf,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/062",
      nbaya: 'Màddina - 11i Laaya',
      sourate: aljumah,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/063",
      nbaya: 'Màddina - 11i Laaya',
      sourate: almunafiqun,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/064",
      nbaya: 'Màddina - 18i Laaya',
      sourate: attagabun,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/065",
      nbaya: 'Màddina - 12i Laaya',
      sourate: attalaq,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/066",
      nbaya: 'Màddina - 12i Laaya',
      sourate: attahrim,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/067",
      nbaya: 'Meque - 30i Laaya',
      sourate: almulk,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/068",
      nbaya: 'Màkka - 52i Laaya',
      sourate: alqalam,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/069",
      nbaya: 'Màkka - 52i Laaya',
      sourate: alhaqqa,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/070",
      nbaya: 'Màkka - 44i yat',
      sourate: almarij,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/071", nbaya: 'Màkka - 28i Laaya', sourate: nuh, lieu: 'Màkka'),
  MesSourates(
      numero: "/072",
      nbaya: 'Màkka - 28i Laaya',
      sourate: aljinn,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/073",
      nbaya: 'Màkka - 20i Laaya',
      sourate: almuzzammil,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/074",
      nbaya: 'Màkka - 56i Laaya',
      sourate: almuddathir,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/075",
      nbaya: 'Màkka - 40i Laaya',
      sourate: alqiyamah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/076",
      nbaya: 'Màddina - 31i Laaya',
      sourate: alinssan,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/077",
      nbaya: 'Màkka - 50i Laaya',
      sourate: almursalat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/078",
      nbaya: 'Màkka - 40i Laaya',
      sourate: annaba,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/079",
      nbaya: 'Màkka - 46i Laaya',
      sourate: annaziat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/080",
      nbaya: 'Màkka - 42i Laaya',
      sourate: abassa,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/081",
      nbaya: 'Màkka - 29i Laaya',
      sourate: takwir,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/082",
      nbaya: 'Màkka - 19i Laaya',
      sourate: infitar,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/083",
      nbaya: 'Màkka - 36i Laaya',
      sourate: mutafifin,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/084",
      nbaya: 'Màkka - 25i Laaya',
      sourate: inshiqaq,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/085",
      nbaya: 'Màddina - 22i Laaya',
      sourate: alburuj,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/086",
      nbaya: 'Màkka - 17i Laaya',
      sourate: tariq,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/087",
      nbaya: 'Meque - 19i Laaya',
      sourate: alala,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/088",
      nbaya: 'Màkka - 26i Laaya',
      sourate: alghasiya,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/089",
      nbaya: 'Màkka - 30i Laaya',
      sourate: alfadjr,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/090",
      nbaya: 'Màkka - 20i Laaya',
      sourate: abalad,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/091",
      nbaya: 'Màkka - 15i Laaya',
      sourate: ashams,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/092",
      nbaya: 'Màkka - 21i Laaya',
      sourate: allayyl,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/093",
      nbaya: 'Màkka - 11i Laaya',
      sourate: aduha,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/094",
      nbaya: 'Màkka - 8i Laaya',
      sourate: alsharh,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/095", nbaya: 'Màkka - 8i Laaya', sourate: atin, lieu: 'Màkka'),
  MesSourates(
      numero: "/096",
      nbaya: 'Màkka - 19i Laaya',
      sourate: alalaq,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/097",
      nbaya: 'Màkka - 5i Laaya',
      sourate: alqadr,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/098",
      nbaya: 'Màkka - 8i Laaya',
      sourate: albayyina,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/099",
      nbaya: 'Màkka - 8i Laaya',
      sourate: azalzala,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/100",
      nbaya: 'Màkka - 11i Laaya',
      sourate: aladiyat,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/101",
      nbaya: 'Màkka - 11i Laaya',
      sourate: alqariah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/102",
      nbaya: 'Màkka - 8i Laaya',
      sourate: atakathur,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/103", nbaya: 'Màkka - 3i Laaya', sourate: alasr, lieu: 'Màkka'),
  MesSourates(
      numero: "/104",
      nbaya: 'Màkka - 9i Laaya',
      sourate: alhumazah,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/105", nbaya: 'Màkka - 5i Laaya', sourate: alfil, lieu: 'Màkka'),
  MesSourates(
      numero: "/106",
      nbaya: 'Meque - 4i Laaya',
      sourate: quraysh,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/107",
      nbaya: 'Màkka - 7i Laaya',
      sourate: almaun,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/108",
      nbaya: 'Màkka - 3i Laaya',
      sourate: alkawthar,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/109",
      nbaya: 'Màkka - 6i Laaya',
      sourate: alkafirun,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/110",
      nbaya: 'Màddina - 3i Laaya',
      sourate: anasr,
      lieu: 'Màddina'),
  MesSourates(
      numero: "/111",
      nbaya: 'Màkka - 5i Laaya',
      sourate: almasad,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/112",
      nbaya: 'Màkka - 4i Laaya',
      sourate: alikhlas,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/113",
      nbaya: 'Màkka - 5i Laaya',
      sourate: alfalaq,
      lieu: 'Màkka'),
  MesSourates(
      numero: "/114", nbaya: 'Màkka - 6i Laaya', sourate: annas, lieu: 'Màkka')
];
