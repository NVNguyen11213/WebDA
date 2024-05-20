package webgiay.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;


public class Cart {

	private List<ProductCart> productCarts = new ArrayList<ProductCart>();
	
	public BigInteger totalCartProduct() {
		BigInteger total = BigInteger.ZERO;
		for (ProductCart productCart : productCarts) {
			total = total.add(productCart.getQuantity());
		}
		return total;
	}
	
	public BigDecimal totalCartPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for (ProductCart productCart : productCarts) {
			total = total.add(productCart.totalPrice());
		}
		return total;
	}
	
	// Tìm sản phẩm trong giỏ hàng theo ID sản phẩm và kích thước
		public int findProductByIdAndSize(int productId, String size) {
		    for (int index = 0; index < productCarts.size(); index++) {
		        ProductCart productCart = productCarts.get(index);
		        if (productCart.getProductId() == productId && productCart.getSize().equals(size)) {
		            return index;
		        }
		    }
		    return -1;
		}

	public Cart() {
		super();
	}
	
	public Cart(List<ProductCart> productCarts) {
		super();
		this.productCarts = productCarts;
	}

	public List<ProductCart> getProductCarts() {
		return productCarts;
	}

	public void setProductCarts(List<ProductCart> productCarts) {
		this.productCarts = productCarts;
	}
}
