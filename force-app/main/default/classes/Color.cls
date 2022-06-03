
public class Color {
   
    public Long Id;
    public String color;
    public String colorCode;
    public Datetime colorDate;
    public Boolean successful;
    public String accountId;

        public Color(){
        } 

        public Color(Long Id, String color, String colorCode, Datetime colorDate){
        }

        public Color(Long Id, String color, String colorCode, Datetime colorDate, Boolean successful, String accountId){
        } 

        //getters y setters 
        public void setSuccessful(Boolean successful) {
            this.successful = successful;
        }
 
        public Boolean getSuccessful(){
            return successful;
        }
 
        public void setAccountId(ID accountID) {
            this.accountID = accountID;
        }
 
        public ID getAccountId(){
            return accountID;
        }


}

