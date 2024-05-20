package webgiay.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel {
	@Column(name = "name", length = 300, nullable = false)
	private String name;

	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;
	
	@Column(name = "product_quantity", nullable = true)
	private Integer productQuantity;

	@Column(name = "price", nullable = true)
	private BigDecimal price;

	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice;

	@Column(name = "short_description", length = 500, nullable = true)
	private String shortDescription;

	@Column(name = "detail_description", nullable = true)
	private String detailDescription;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@Column(name = "size", length = 50, nullable = true)
	private String size;

	private String sortBy;

//	----------Mapping many-to-one: product-to-category----------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	// -----------------Mapping many-to-one: tbl_product-to-tbl_user (for create
	// product)----------------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateProduct;

	// ----------------Mapping many-to-one: tbl_product-to-tbl_user (for update
	// product)-------------------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateProduct;

	// -----------Mapping one-to-many: tbl_product-to-tbl_product_image
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<Product_image> product_images = new HashSet<Product_image>();

	// Methods add and remove elements in relational product list
	public void addRelationalProductImage(Product_image product_image) {
		product_images.add(product_image);
		product_image.setProduct(this);
	}

	public void removeRelationalProductImage(Product_image product_image) {
		product_images.remove(product_image);
		product_image.setProduct(null);
	}
	// --------------------------------------------------------------------------

	// -----------Mapping one-to-many: tbl_product-to-tbl_sale_order-product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();

	// Methods add and remove elements in relational product list
	public void addRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);
		saleOrderProduct.setProduct(this);
	}

	public void removeRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct);
		saleOrderProduct.setProduct(null);
	}
//		// --------------------------------------------------------------------------

	public Product() {
		super();
	}

	public Product(Integer id, Date createDate, Date updateDate, Boolean status, String name, String avatar,int productQuantity,
			BigDecimal price, BigDecimal salePrice, String shortDescription, String detailDescription, Boolean isHot,
			String seo,String size, String sortBy, Category category, User userCreateProduct, User userUpdateProduct,
			Set<Product_image> product_images, Set<SaleOrderProduct> saleOrderProducts) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.avatar = avatar;
		this.productQuantity = productQuantity;
		this.price = price;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.detailDescription = detailDescription;
		this.isHot = isHot;
		this.seo = seo;
		this.size = size;
		this.sortBy = sortBy;
		this.category = category;
		this.userCreateProduct = userCreateProduct;
		this.userUpdateProduct = userUpdateProduct;
		this.product_images = product_images;
		this.saleOrderProducts = saleOrderProducts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUserCreateProduct() {
		return userCreateProduct;
	}

	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}

	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}

	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}

	public Set<Product_image> getProduct_images() {
		return product_images;
	}

	public void setProduct_images(Set<Product_image> product_images) {
		this.product_images = product_images;
	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

}
