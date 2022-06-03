public with sharing class Color {
    public Long Id;
    public String color;
    public String colorCode;
    public Datetime colorDate;
    public Boolean successful {get;set;}
    public String accountId {get;set;}

        public Color(){
            
        }

        public Color(Long Id, String color, String colorCode, Datetime colorDate){
        }
}