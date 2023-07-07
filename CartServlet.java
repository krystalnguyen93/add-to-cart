package coding.mentor.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import coding.mentor.entity.Book;
import coding.mentor.entity.BookInCart;
import coding.mentor.service.BookService;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String action = request.getParameter("action");
			if (action != null && action.equals("AddCart")) {
				// get thong tin book tu request
				String bookId = request.getParameter("bookId");
				BookService bookService = new BookService();
				// get book list tuwf session
				HttpSession session = request.getSession();
				HashMap<String, BookInCart> cart = (HashMap<String, BookInCart>) session.getAttribute("cart");
				// neu chua co cart, tao moi
				if (cart == null) {
					cart = new HashMap<>();
					session.setAttribute("cart", cart);
				}
				// kiem tra book da co trong cart chua
				// ton tai thi quanity + 1
				if (cart.containsKey(bookId)) {
					BookInCart bookInCart = cart.get(bookId);
					bookInCart.setQuantity(bookInCart.getQuanity() + 1);
					request.setAttribute("bookInCart", bookInCart);
					// neu chua ton tai, them moi voi so luong 1
				} else {
					Book book = bookService.getBookDetails(Integer.parseInt(bookId)); // lay book tu database
					BookInCart newBookInCart = new BookInCart(book);
					cart.put(bookId, newBookInCart);
					request.setAttribute("bookInCart", newBookInCart);
				}
				session.setAttribute("cart", cart);

				response.sendRedirect("home");
			} else if (action != null && action.equals("ViewCart")) {
				response.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
