package dto;

public class ProductDTO {

	private int prodNo;
	private String prodName;
	private int stock;
	private int price;
	private String company;
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	
	public void setProdNo(String prodNo) {
		this.prodNo = Integer.parseInt(prodNo);
	}
	
	
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public void setStock(String stock) {
		this.stock = Integer.parseInt(stock); 
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "ProductDTO [prodNo=" + prodNo + ", prodName=" + prodName + ", stock=" + stock + ", price=" + price
				+ ", company=" + company + "]";
	}
	
	
	
}
