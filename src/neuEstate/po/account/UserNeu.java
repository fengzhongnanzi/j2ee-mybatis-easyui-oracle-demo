package neuEstate.po.account;

public class UserNeu {
    //用于分页的page当前页和rows所需行数
    private Integer startNum;
    private Integer addNum;

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getAddNum() {
        return addNum;
    }

    public void setAddNum(Integer addNum) {
        this.addNum = addNum;
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userAccount
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String useraccount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userName
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userPassword
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String userpassword;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userPhoneNumber
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String userphonenumber;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userEmail
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String useremail;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userAuthority
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String userauthority;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userGender
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String usergender;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userIdCard
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String useridcard;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column USER_NEU.userIdCardType
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    private String useridcardtype;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userAccount
     *
     * @return the value of USER_NEU.userAccount
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUseraccount() {
        return useraccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userAccount
     *
     * @param useraccount the value for USER_NEU.userAccount
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount == null ? null : useraccount.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userName
     *
     * @return the value of USER_NEU.userName
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userName
     *
     * @param username the value for USER_NEU.userName
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userPassword
     *
     * @return the value of USER_NEU.userPassword
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUserpassword() {
        return userpassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userPassword
     *
     * @param userpassword the value for USER_NEU.userPassword
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword == null ? null : userpassword.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userPhoneNumber
     *
     * @return the value of USER_NEU.userPhoneNumber
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUserphonenumber() {
        return userphonenumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userPhoneNumber
     *
     * @param userphonenumber the value for USER_NEU.userPhoneNumber
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUserphonenumber(String userphonenumber) {
        this.userphonenumber = userphonenumber == null ? null : userphonenumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userEmail
     *
     * @return the value of USER_NEU.userEmail
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUseremail() {
        return useremail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userEmail
     *
     * @param useremail the value for USER_NEU.userEmail
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUseremail(String useremail) {
        this.useremail = useremail == null ? null : useremail.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userAuthority
     *
     * @return the value of USER_NEU.userAuthority
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUserauthority() {
        return userauthority;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userAuthority
     *
     * @param userauthority the value for USER_NEU.userAuthority
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUserauthority(String userauthority) {
        this.userauthority = userauthority == null ? null : userauthority.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userGender
     *
     * @return the value of USER_NEU.userGender
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUsergender() {
        return usergender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userGender
     *
     * @param usergender the value for USER_NEU.userGender
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUsergender(String usergender) {
        this.usergender = usergender == null ? null : usergender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userIdCard
     *
     * @return the value of USER_NEU.userIdCard
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUseridcard() {
        return useridcard;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userIdCard
     *
     * @param useridcard the value for USER_NEU.userIdCard
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUseridcard(String useridcard) {
        this.useridcard = useridcard == null ? null : useridcard.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column USER_NEU.userIdCardType
     *
     * @return the value of USER_NEU.userIdCardType
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public String getUseridcardtype() {
        return useridcardtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column USER_NEU.userIdCardType
     *
     * @param useridcardtype the value for USER_NEU.userIdCardType
     *
     * @mbggenerated Sun Jul 30 22:26:32 CST 2017
     */
    public void setUseridcardtype(String useridcardtype) {
        this.useridcardtype = useridcardtype == null ? null : useridcardtype.trim();
    }
}