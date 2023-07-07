package coding.mentor.entity;

public class BookInCart {
private Book book;
private int quantity;

public BookInCart(Book book) {
	this.book = book;
	this.quantity = 1;
}

public Book getBook() {
	return book;
}

public int getQuanity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

}
