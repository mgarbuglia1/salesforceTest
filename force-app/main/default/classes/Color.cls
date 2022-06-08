public with sharing class Color {
    //public Long Id;
    @AuraEnabled
    public String color;
    @AuraEnabled
    public String colorCode;
    @AuraEnabled
    public Datetime colorDate;
    @AuraEnabled
    public Boolean successful {get;set;}
    @AuraEnabled
    public String accountId {get;set;}

        public Color(){
            
        }

        public Color(String color, String colorCode, Datetime colorDate){
        }
}