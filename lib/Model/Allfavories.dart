import 'dart:core';

class Allfavories {
  int  id;
  int numsourate;
  int ontap=0;
  //Verset verset;
  String date;
  //Sourate sourate;
  String varabe;
  String vwolof;
  int numverset;
  String nomsourate;
  Allfavories({this.date,this.varabe,this.vwolof,this.numverset,this.nomsourate,this.numsourate,this.ontap});
  Allfavories.withId({this.id,this.date,this.varabe,this.vwolof,this.numverset,this.nomsourate,this.numsourate,this.ontap});

  int getId() => this.id;
  int getNumsourate() => this.numsourate;
  int getOntap() => this.ontap;
  String getDate() => date;
  String getVarabe()=>this.varabe;
  String getVwolof()=>this.vwolof;
  int getNumverset()=>this.numverset;
  String getNomSourate()=>this.nomsourate;
  setDate(String newdate){this.date=newdate;}
  setNumsourate(int numsourate){this.numsourate=numsourate;}
  setOntap(int ontap){this.ontap=ontap;}
  setVarabe(String varabe){this.varabe=varabe;}
  setVwolof(String versetwolof){this.vwolof=versetwolof;}
  setNumverset(int numverset){this.numverset=numverset;}
  setNomsourate(String nom){this.nomsourate=nom;}
  

  //conversion des objet favories en type map du fait que la database sql lite prend des donnees mappe et les renvoies
//le type string est la cle  et dynamic cest pour dire que la valeur peut etre de type int ou string ou verset ou autres
   Map<String,dynamic> toMap(){
     var map= Map<String,dynamic>();
     if(id!=null){
     map['id']=id;
     }
      map['numsourate']= numsourate;
    
     map['date']=date;
     map['varabe']=varabe;
     map['vwolof']=vwolof;
     map['numverset']=numverset;
     map['nomsourate']=nomsourate;
      map['ontap']=ontap;
    
     return map;
    
   }
//fonction pour extraite les donnees mappes pour les avoir en objet Favories a partir des objet map dynamic car on a dif types
   Allfavories.fromMapObjet(Map<String,dynamic> map){
     //extraction
     this.id=map['id'];
     this.date=map['date'];
     this.varabe=map['varabe'];
     this.vwolof=map['vwolof'];
     this.numverset=map['numverset'];
     this.nomsourate=map['nomsourate'];
     this.numsourate=map['numsourate'];
     this.ontap=map['ontap'];
   }

}