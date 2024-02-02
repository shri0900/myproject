public class ContactTriggerHandler {

    //Requirement-upon creation or updation of contact emil field thrown an error if same email found on lead object
    
    public static void preventduplication(List<Contact>newContactList){
       List<String>conemails=New List<String>();
        For(Contact con:newContactList){
            conEmails.add(con.email);
        }
        List<Lead>leadList=[SELECT Email FROM Lead WHERE EMail IN:conEmails];
        List<String>dupEmails=New List<String>();
        For(Lead l:LeadList){
            dupEmails.add(l.email);
        }
        
        For(Contact con:newContactList){
            if(dupEmails.Contains(con.Email)){
                con.addError('Duplicate Email Id Found on Lead'+con.Email);
            }
        }
    }
}