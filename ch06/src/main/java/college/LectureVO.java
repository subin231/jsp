package college;

public class LectureVO {
	private int lecno;
	private String lecname;
	private int lecCredit;
	private int lectime;
	private String lecClass;
	public int getLecno() {
		return lecno;
	}
	public void setLecno(int lecno) {
		this.lecno = lecno;
	}
	public String getLecname() {
		return lecname;
	}
	public void setLecname(String lecname) {
		this.lecname = lecname;
	}
	public int getLecCredit() {
		return lecCredit;
	}
	public void setLecCredit(int lecCredit) {
		this.lecCredit = lecCredit;
	}
	public int getLectime() {
		return lectime;
	}
	public void setLectime(int lectime) {
		this.lectime = lectime;
	}
	public String getLecClass() {
		return lecClass;
	}
	public void setLecClass(String lecClass) {
		this.lecClass = lecClass;
	}
	@Override
	public String toString() {
		return "LectureVO [lecno=" + lecno + ", lecname=" + lecname + ", lecCredit=" + lecCredit + ", lectime="
				+ lectime + ", lecClass=" + lecClass + "]";
	}
	
	
	
	
}
