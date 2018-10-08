package bean;



/**
 * MenuInfo entity. @author MyEclipse Persistence Tools
 */

public class MenuInfo  implements java.io.Serializable {


    // Fields    

     private String id;
     private String name;
     private String pid;
     private Integer seq;


    // Constructors

    /** default constructor */
    public MenuInfo() {
    }

    
    /** full constructor */
    public MenuInfo(String id, String name, String pid, Integer seq) {
        this.id = id;
        this.name = name;
        this.pid = pid;
        this.seq = seq;
    }

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getPid() {
        return this.pid;
    }
    
    public void setPid(String pid) {
        this.pid = pid;
    }

    public Integer getSeq() {
        return this.seq;
    }
    
    public void setSeq(Integer seq) {
        this.seq = seq;
    }
   








}