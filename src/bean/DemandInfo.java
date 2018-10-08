package bean;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * DemandInfo entity. @author MyEclipse Persistence Tools
 */

/**
 * @author DELL
 *
 */ 
public class DemandInfo implements java.io.Serializable {

	// Fields

	private String id;//
	private UserBean userBean;//
	private String unitname;//
	private String demandbrief;//
	private String studytype;//
	private String subjecttype;//
	private String invest;//
	private String status;
	private Date date;//
	private String address;//
	private String website;//
	private String mailbox;//
	private String legalperson;//
	private String postcode;//
	private String contactperson;//
	private String unittype;//
	private String unitbrief;//
	private String demandname;//
	private String techfield;//
	private String techsector;//
	private String mode;//
	private String keyword;//
	private String telephone;//
	private String mobile;//
	private String fax;//
	private String mgsector;//
	private String field;//
	private Timestamp qsdate;//
	private Timestamp jzdate;//
	private String teamunit;//
	private String advise;//

	// Constructors

	/** default constructor */
	public DemandInfo() {
	}

	/** minimal constructor */
	public DemandInfo(String id, UserBean userBean, String unitname, String demandbrief, String studytype,
			Timestamp date, String address, String mailbox, String legalperson, String contactperson, String unittype,
			String unitbrief, String demandname, String mode, String keyword, String telephone, String field,
			Timestamp qsdate, Timestamp jzdate) {
		this.id = id;
		this.userBean = userBean;
		this.unitname = unitname;
		this.demandbrief = demandbrief;
		this.studytype = studytype;
		this.date = date;
		this.address = address;
		this.mailbox = mailbox;
		this.legalperson = legalperson;
		this.contactperson = contactperson;
		this.unittype = unittype;
		this.unitbrief = unitbrief;
		this.demandname = demandname;
		this.mode = mode;
		this.keyword = keyword;
		this.telephone = telephone;
		this.field = field;
		this.qsdate = qsdate;
		this.jzdate = jzdate;
	}

	/** full constructor */
	public DemandInfo(String id, UserBean userBean, String unitname, String demandbrief, String studytype,
			String subjecttype, String invest, String status, Timestamp date, String address, String website,
			String mailbox, String legalperson, String postcode, String contactperson, String unittype,
			String unitbrief, String demandname, String techfield, String techsector, String mode, String keyword,
			String telephone, String mobile, String fax, String mgsector, String field, Timestamp qsdate,
			Timestamp jzdate, String teamunit, String advise) {
		this.id = id;
		this.userBean = userBean;
		this.unitname = unitname;
		this.demandbrief = demandbrief;
		this.studytype = studytype;
		this.subjecttype = subjecttype;
		this.invest = invest;
		this.status = status;
		this.date = date;
		this.address = address;
		this.website = website;
		this.mailbox = mailbox;
		this.legalperson = legalperson;
		this.postcode = postcode;
		this.contactperson = contactperson;
		this.unittype = unittype;
		this.unitbrief = unitbrief;
		this.demandname = demandname;
		this.techfield = techfield;
		this.techsector = techsector;
		this.mode = mode;
		this.keyword = keyword;
		this.telephone = telephone;
		this.mobile = mobile;
		this.fax = fax;
		this.mgsector = mgsector;
		this.field = field;
		this.qsdate = qsdate;
		this.jzdate = jzdate;
		this.teamunit = teamunit;
		this.advise = advise;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public UserBean getUserBean() {
		return this.userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public String getUnitname() {
		return this.unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	public String getDemandbrief() {
		return this.demandbrief;
	}

	public void setDemandbrief(String demandbrief) {
		this.demandbrief = demandbrief;
	}

	public String getStudytype() {
		return this.studytype;
	}

	public void setStudytype(String studytype) {
		this.studytype = studytype;
	}

	public String getSubjecttype() {
		return this.subjecttype;
	}

	public void setSubjecttype(String subjecttype) {
		this.subjecttype = subjecttype;
	}

	public String getInvest() {
		return this.invest;
	}

	public void setInvest(String invest) {
		this.invest = invest;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() throws ParseException {
		this.date = new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(this.date));
		return this.date;
	}

	public void setDate(Date date2) {
		this.date = date2;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getMailbox() {
		return this.mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	public String getLegalperson() {
		return this.legalperson;
	}

	public void setLegalperson(String legalperson) {
		this.legalperson = legalperson;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getContactperson() {
		return this.contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}

	public String getUnittype() {
		return this.unittype;
	}

	public void setUnittype(String unittype) {
		this.unittype = unittype;
	}

	public String getUnitbrief() {
		return this.unitbrief;
	}

	public void setUnitbrief(String unitbrief) {
		this.unitbrief = unitbrief;
	}

	public String getDemandname() {
		return this.demandname;
	}

	public void setDemandname(String demandname) {
		this.demandname = demandname;
	}

	public String getTechfield() {
		return this.techfield;
	}

	public void setTechfield(String techfield) {
		this.techfield = techfield;
	}

	public String getTechsector() {
		return this.techsector;
	}

	public void setTechsector(String techsector) {
		this.techsector = techsector;
	}

	public String getMode() {
		return this.mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMgsector() {
		return this.mgsector;
	}

	public void setMgsector(String mgsector) {
		this.mgsector = mgsector;
	}

	public String getField() {
		return this.field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Timestamp getQsdate() {
		return this.qsdate;
	}

	public void setQsdate(Timestamp qsdate) {
		this.qsdate = qsdate;
	}

	public Timestamp getJzdate() {
		return this.jzdate;
	}

	public void setJzdate(Timestamp jzdate) {
		this.jzdate = jzdate;
	}

	public String getTeamunit() {
		return this.teamunit;
	}

	public void setTeamunit(String teamunit) {
		this.teamunit = teamunit;
	}

	public String getAdvise() {
		return this.advise;
	}

	public void setAdvise(String advise) {
		this.advise = advise;
	}

	@Override
	public String toString() {
		return "DemandInfo [id=" + id + ", userBean=" + userBean + ", unitname=" + unitname + ", demandbrief="
				+ demandbrief + ", studytype=" + studytype + ", subjecttype=" + subjecttype + ", invest=" + invest
				+ ", status=" + status + ", date=" + date + ", address=" + address + ", website=" + website
				+ ", mailbox=" + mailbox + ", legalperson=" + legalperson + ", postcode=" + postcode
				+ ", contactperson=" + contactperson + ", unittype=" + unittype + ", unitbrief=" + unitbrief
				+ ", demandname=" + demandname + ", techfield=" + techfield + ", techsector=" + techsector + ", mode="
				+ mode + ", keyword=" + keyword + ", telephone=" + telephone + ", mobile=" + mobile + ", fax=" + fax
				+ ", mgsector=" + mgsector + ", field=" + field + ", qsdate=" + qsdate + ", jzdate=" + jzdate
				+ ", teamunit=" + teamunit + ", advise=" + advise + "]";
	}
}