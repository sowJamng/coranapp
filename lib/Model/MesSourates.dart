// import 'dart:convert';
// import 'dart:io';

import 'Allsourate.dart';

class MesSourates {
String numero;
Sourate sourate;
String nbaya;
String lieu;

 MesSourates({this.numero,this.nbaya, this.sourate,this.lieu});
// String getNumero()=>this.numero;
// String getLieu()=>this.lieu;
// String getNbaya()=>this.nbaya;
// Sourate getSourate()=>this.sourate;


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

List<MesSourates> mesSourates=[
  
  MesSourates(
      numero: "/001",
      nbaya: 'Mecque - 7 Ayat',
      sourate: fatiya,
      lieu:'Mecque'

  ),

MesSourates(
numero: "/002",
nbaya: 'Medine - 286 Ayat',
sourate: baqara,
lieu: 'Medine'
),
MesSourates(
numero: "/003",
nbaya: 'Medine - 200 Ayat',
sourate: imran,
lieu: 'Medine'
),
MesSourates(
numero: "/004",
nbaya: 'Medine - 176 Ayat',
sourate: nisa,
lieu: 'Medine'
),
MesSourates(
numero: "/005",
nbaya: 'Medine - 120 Ayat',
sourate: maIda,
lieu: 'Medine'
),
MesSourates(
numero: "/006",
nbaya: 'Mecque - 165 Ayat',
sourate: anam,
      lieu:'Mecque'

),
MesSourates(
numero: "/007",
nbaya: 'Meque - 206 Ayat',
sourate: araf,
      lieu:'Mecque'
),
MesSourates(
numero: "/008",
nbaya: 'Medine - 75 Ayat',
sourate: anfal,
lieu: 'Medine'
),
MesSourates(
numero: "/009",
nbaya: 'Medine - 129 Ayat',
sourate: tawbah,
lieu: 'Medine'
),
MesSourates(
numero: "/010",
nbaya: 'Mecque - 109 Ayat',
sourate: yunus,
      lieu:'Mecque'
),
MesSourates(
numero: "/011",
nbaya: 'Mecque 123 Ayat',
sourate: hud,
      lieu:'Mecque'
),
MesSourates(
numero: "/012",
nbaya: 'Mecque 111 Ayat',
sourate: yussuf,
      lieu:'Mecque'
),
MesSourates(
numero: "/013",
nbaya: 'Medine - 43 Ayat',
sourate: arrad,
lieu: 'Medine'
),
MesSourates(
numero: "/014",
nbaya: 'Mecque 52 Ayat',
sourate: ibrahim,
      lieu:'Mecque'
),
MesSourates(
numero: "/015",
nbaya: 'Mecque 99 Ayat',
sourate: alhijr,
      lieu:'Mecque'
),
MesSourates(
numero: "/016",
nbaya: 'Mecque 128 Ayat',
sourate: annahl,
      lieu:'Mecque'
),
MesSourates(
numero: "/017",
nbaya: 'Mecque 111 Ayat',
sourate: alisra,
      lieu:'Mecque'
),
MesSourates(
numero: "/018",
nbaya: 'Mecque 110 Ayat',
sourate: alkahf,
      lieu:'Mecque'
),
MesSourates(
numero: "/019",
nbaya: 'Mecque 98 Ayat',
sourate: maryam,
      lieu:'Mecque'
),
MesSourates(
numero: "/020",
nbaya: 'Mecque 135 Ayat',
sourate: taha,
      lieu:'Mecque'
),
MesSourates(
numero: "/021",
nbaya: 'Mecque 112 Ayat',
sourate: alanbiya,
      lieu:'Mecque'
  ),
MesSourates(
numero: "/022",
nbaya: 'Medine - 78 Ayat',
sourate: alhadjj,
lieu: 'Medine'
),
MesSourates(
numero: "/023",
nbaya: 'Mecque 118 Ayat',
sourate: muminun,
      lieu:'Mecque'
),
MesSourates(
numero: "/024",
nbaya: 'Medine 64 Ayat',
sourate: annur,
lieu: 'Medine'
),
MesSourates(
numero: "/025",
nbaya: 'Mecque 77 Ayat',
sourate: furqan,
      lieu:'Mecque'
),
MesSourates(
numero: "/026",
nbaya: 'Mecque 227 Ayat',
sourate:  ashura,
      lieu:'Mecque'
),
MesSourates(
numero: "/027",
nbaya: 'Meque 93 Ayat',
sourate: annaml,
      lieu:'Mecque'
),
MesSourates(
numero: "/028",
nbaya: 'Mecque 88 Ayat',
sourate: alqasas,
      lieu:'Mecque'
),
MesSourates(
numero: "/029",
nbaya: 'Mecque 69 Ayat',
sourate: ankabut,
      lieu:'Mecque'
),
MesSourates(
numero: "/030:",
nbaya: 'Mecque 60 Ayat',
sourate: arum,
      lieu:'Mecque'
),
MesSourates(
numero: "/031",
nbaya: 'Mecque 34 Ayat',
sourate: luqman,
      lieu:'Mecque'
),
MesSourates(
numero: "/032",
nbaya: 'Mecque 30 Ayat',
sourate: asajdah,
      lieu:'Mecque'
),
MesSourates(
numero: "/033",
nbaya: 'Medine 73 Ayat',
sourate: alhazab,
lieu: 'Medine'
),
MesSourates(
numero: "/034",
nbaya: 'Mecque 54 Ayat',
sourate: saba,
      lieu:'Mecque'
),
MesSourates(
numero: "/035",
nbaya: 'Mecque 45 Ayat',
sourate: fatir,
      lieu:'Mecque'
),
MesSourates(
numero: "/036",
nbaya: 'Mecque 83 Ayat',
sourate: yassin,
      lieu:'Mecque'
),
MesSourates(
numero: '/37',
nbaya: 'Mecque 182 Ayat',
sourate: assafat,
      lieu:'Mecque'
),
MesSourates(
numero: "/38",
nbaya: 'Mecque 88 Ayat',
sourate: sad,
      lieu:'Mecque'
),
MesSourates(
numero: "/39",
nbaya: 'Mecque 75 Ayat',
sourate: azzumar,
      lieu:'Mecque'
),
MesSourates(
numero: "/40",
nbaya: 'Mecque 85 Ayat',
sourate: ghafir,
      lieu:'Mecque'
),
MesSourates(
  numero: "/041",
  nbaya: 'Mecque 54 Ayat',
  sourate: fussila,
      lieu:'Mecque'
  ),
MesSourates(
numero: "/042",
nbaya: 'Mecque 53 Ayat',
sourate: ashshura,
      lieu:'Mecque'
),
MesSourates(
numero: "/043",
nbaya: 'Mecque 89 Ayat',
sourate: azukhruf,
      lieu:'Mecque'
),
MesSourates(
numero: "/044",
nbaya: 'Mecque 59 Ayat',
sourate: addukhan,
      lieu:'Mecque'
),
MesSourates(
numero: "/045",
nbaya: 'Mecque 37 Ayat',
sourate: aljathiya,
      lieu:'Mecque'
),
MesSourates(
numero: "/046",
nbaya: 'Mecque 35 Ayat',
sourate: alahqaf,
      lieu:'Mecque'
),
MesSourates(
numero: "/047",
nbaya: 'Medine 38 Ayat',
sourate: mouhamed,
lieu: 'Medine'
),
MesSourates(
numero: "/048",
nbaya: 'Medine 29 yat',
sourate: alfath,
lieu: 'Medine'
),
MesSourates(
numero: "/049",
nbaya: 'Medine 18 Ayat',
sourate: alhujurat,
lieu: 'Medine'
),
MesSourates(
numero: "/050",
nbaya: 'Mecque 45 Ayat',
sourate: qaf,
      lieu:'Mecque'
),
MesSourates(
numero: "/051",
nbaya: 'Mecque 60 Ayat',
sourate: adhariyat,
      lieu:'Mecque'
),
MesSourates(
numero: "/052",
nbaya: 'Mecque 49 Ayat',
sourate: attur,
      lieu:'Mecque'
),
MesSourates(
numero: "/053",
nbaya: 'Mecque 62 Ayat',
sourate: annajm,
      lieu:'Mecque'
),
MesSourates(
numero: "/054",
nbaya: 'Mecque 55 Ayat',
sourate: alqamar,
      lieu:'Mecque'
),
MesSourates(
numero: "/055",
nbaya: 'Mecque 78 Ayat',
sourate: arrahman,
      lieu:'Mecque'
),
MesSourates(
numero: "/056",
nbaya: 'Mecque 96 Ayat',
sourate: alwaqiah,
      lieu:'Mecque'
),
MesSourates(
numero: "/057",
nbaya: 'Medine 29 Ayat',
sourate: alhadid,
lieu: 'Medine'
),
MesSourates(
numero: "/058",
nbaya: 'Medine 22 Ayat',
sourate:almujadila,
lieu: 'Medine'
),
MesSourates(
numero: "/059",
nbaya: 'Medine 24 Ayat',
sourate: alhashr,
lieu: 'Medine'
),
MesSourates(
numero: "/060",
nbaya: 'Medine 13 Ayat',
sourate: almumtaHana
),
MesSourates(
  numero: "/061",
  nbaya: 'Medine 14 Ayat',
  sourate: assaf,
lieu: 'Medine'
  ),
MesSourates(
numero: "/062",
nbaya: 'Medine 11 Ayat',
sourate: aljumah,
lieu: 'Medine'
),
MesSourates(
numero: "/063",
nbaya: 'Medine 11 Ayat',
sourate: almunafiqun,
lieu: 'Medine'
),
MesSourates(
numero: "/064",
nbaya: 'Medine 18 Ayat',
sourate: attagabun,
lieu: 'Medine'
),
MesSourates(
numero: "/065",
nbaya: 'Medine 12 Ayat',
sourate: attalaq,
lieu: 'Medine'
),
MesSourates(
numero: "/066",
nbaya: 'Medine 12 Ayat',
sourate: attahrim,
lieu: 'Medine'
),
MesSourates(
numero: "/067",
nbaya: 'Meque 30 Ayat',
sourate: almulk,
      lieu:'Mecque'
),
MesSourates(
numero: "/068",
nbaya: 'Mecque 52 Ayat',
sourate: alqalam,
      lieu:'Mecque'
),
MesSourates(
numero: "/069",
nbaya: 'Mecque 52 Ayat',
sourate: alhaqqa,
      lieu:'Mecque'
),
MesSourates(
numero: "/070",
nbaya: 'Mecque 44 yat',
sourate: almarij,
      lieu:'Mecque'
),
MesSourates(
numero: "/071",
nbaya: 'Mecque 28 Ayat',
sourate:nuh,
      lieu:'Mecque'
),
MesSourates(
numero: "/072",
nbaya: 'Mecque 28 Ayat',
sourate: aljinn,
      lieu:'Mecque'
),
MesSourates(
numero: "/073",
nbaya: 'Mecque 20 Ayat',
sourate: almuzzammil,
      lieu:'Mecque'
),
MesSourates(
numero: "/074",
nbaya: 'Mecque 56 Ayat',
sourate: almuddathir,
      lieu:'Mecque'
),
MesSourates(
numero: "/075",
nbaya: 'Mecque 40 Ayat',
sourate: alqiyamah,
      lieu:'Mecque'
),
MesSourates(
numero: "/076",
nbaya: 'Medine 31 Ayat',
sourate: alinssan,
lieu: 'Medine'
),
MesSourates(
numero: "/077",
nbaya: 'Mecque 50 Ayat',
sourate: almursalat,
      lieu:'Mecque'
),
MesSourates(
numero: "/078",
nbaya: 'Mecque 40 Ayat',
sourate: annaba,
      lieu:'Mecque'
),
MesSourates(
numero: "/079",
nbaya: 'Mecque 46 Ayat',
sourate: annaziat,
      lieu:'Mecque'
),
MesSourates(
numero: "/080",
nbaya: 'Mecque 42 Ayat',
sourate: abassa,
      lieu:'Mecque'
),
MesSourates(
  numero: "/081",
  nbaya: 'Mecque 29 Ayat',
  sourate: takwir,
      lieu:'Mecque'
  ),
MesSourates(
numero: "/082",
nbaya: 'Mecque 19 Ayat',
sourate: infitar,
      lieu:'Mecque'
),
MesSourates(
numero: "/083",
nbaya: 'Mecque 36 Ayat',
sourate: mutafifin,
      lieu:'Mecque'
),
MesSourates(
numero: "/084",
nbaya: 'Mecque 25 Ayat',
sourate: inshiqaq,
      lieu:'Mecque'
),
MesSourates(
numero: "/085",
nbaya: 'Medine 22 Ayat',
sourate: alburuj
),
MesSourates(
numero: "/086",
nbaya: 'Mecque 17 Ayat',
sourate: tariq,
      lieu:'Mecque'
),
MesSourates(
numero: "/087",
nbaya: 'Meque 19 Ayat',
sourate: alala,
      lieu:'Mecque'
),
MesSourates(
numero: "/088",
nbaya: 'Mecque 26 Ayat',
sourate: alghasiya,
      lieu:'Mecque'
),
MesSourates(
numero: "/089",
nbaya: 'Mecque 30 Ayat',
sourate: alfadjr,
      lieu:'Mecque'
),
MesSourates(
numero: "/090",
nbaya: 'Mecque 20 Ayat',
sourate: abalad,
      lieu:'Mecque'
),
MesSourates(
numero: "/091",
nbaya: 'Mecque 15 Ayat',
sourate: ashams,
      lieu:'Mecque'
),
MesSourates(
numero: "/092",
nbaya: 'Mecque 21 Ayat',
sourate: allayyl,
      lieu:'Mecque'
),
MesSourates(
numero: "/093",
nbaya: 'Mecque 11 Ayat',
sourate: aduha,
      lieu:'Mecque'
),
MesSourates(
numero: "/094",
nbaya: 'Mecque 8 Ayat',
sourate: alsharh,
      lieu:'Mecque'
),
MesSourates(
numero: "/095",
nbaya: 'Mecque 8 Ayat',
sourate: atin,
      lieu:'Mecque'
),
MesSourates(
numero: "/096",
nbaya: 'Mecque 19 Ayat',
sourate: alalaq,
      lieu:'Mecque'
),
MesSourates(
numero: "/097",
nbaya: 'Mecque 5 Ayat',
sourate: alqadr,
      lieu:'Mecque'
),
MesSourates(
numero: "/098",
nbaya: 'Mecque 8 Ayat',
sourate: albayyina,
      lieu:'Mecque'
),
MesSourates(
numero: "/099",
nbaya: 'Mecque 8 Ayat',
sourate: azalzala,
      lieu:'Mecque'
),
MesSourates(
numero: "/100",
nbaya: 'Mecque 11 Ayat',
sourate: aladiyat,
      lieu:'Mecque'
  ),
MesSourates(
numero: "/101",
nbaya: 'Mecque 11 Ayat',
sourate: alqariah,
      lieu:'Mecque'
),
MesSourates(
numero: "/102",
nbaya: 'Mecque 8 Ayat',
sourate: atakathur,
      lieu:'Mecque'
),
MesSourates(
numero: "/103",
nbaya: 'Mecque 3 Ayat',
sourate: alasr,
      lieu:'Mecque'
),
MesSourates(
numero: "/104",
nbaya: 'Mecque 9 Ayat',
sourate: alhumazah,
      lieu:'Mecque'
),
MesSourates(
numero: "/105",
nbaya: 'Mecque 5 Ayat',
sourate: alfil,
      lieu:'Mecque'
),
MesSourates(
numero: "/106",
nbaya: 'Meque 4 Ayat',
sourate: quraysh,
      lieu:'Mecque'
),
MesSourates(
numero: "/107",
nbaya: 'Mecque 7 Ayat',
sourate: almaun,
      lieu:'Mecque'
),
MesSourates(
numero: "/108",
nbaya: 'Mecque  Ay3at',
sourate: alkawthar,
      lieu:'Mecque'
),
MesSourates(
numero: "/109",
nbaya: 'Mecque 6 Ayat',
sourate: alkafirun,
      lieu:'Mecque'
),
MesSourates(
numero: "/110",
nbaya: 'Medine 3 Ayat',
sourate: anasr
),
MesSourates(
numero: "/111",
nbaya: 'Mecque 5 Ayat',
sourate: almasad,
      lieu:'Mecque'
),
MesSourates(
numero: "/112",
nbaya: 'Mecque 4 Ayat',
sourate: alikhlas,
      lieu:'Mecque'
),
MesSourates(
numero: "/113",
nbaya: 'Mecque 5 Ayat',
sourate: alfalaq,
      lieu:'Mecque'
),
MesSourates(
numero: "/114",
nbaya: 'Mecque 6 Ayat',
sourate: annas,
      lieu:'Mecque'
)
];

