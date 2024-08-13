package college;

public class StudentVO {
	private String stdno;
	private String stdname;
	private String stdhp;
	private int stdyear;
	private String stdaddr;
	public String getStdno() {
		return stdno;
	}
	public void setStdno(String stdno) {
		this.stdno = stdno;
	}
	public String getStdname() {
		return stdname;
	}
	public void setStdname(String stdname) {
		this.stdname = stdname;
	}
	public String getStdhp() {
		return stdhp;
	}
	public void setStdhp(String stdhp) {
		this.stdhp = stdhp;
	}
	public int getStdyear() {
		return stdyear;
	}
	public void setStdyear(int stdyear) {
		this.stdyear = stdyear;
	}
	public String getStdaddr() {
		return stdaddr;
	}
	public void setStdaddr(String stdaddr) {
		this.stdaddr = stdaddr;
	}
	@Override
	public String toString() {
		return "StudentVO [stdno=" + stdno + ", stdname=" + stdname + ", stdhp=" + stdhp + ", stdyear=" + stdyear
				+ ", stdaddr=" + stdaddr + "]";
	}
	
	
	
}
