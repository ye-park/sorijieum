package wishbook.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class WishBookSearchServlet
 */
@WebServlet("/wbsearch")
public class WishBookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서신청 검색 처리용 컨트롤러
		//도서명 검색, 저자명 검색 기능
		request.setCharacterEncoding("utf-8");
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		
		int limit = 5;  //한 페이지에 출력할 목록 갯수
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 4;
		int endnum = currentPage * limit;
		
		WishBookService wservice = new WishBookService();
		ArrayList<WishBook> list = wservice.selectSearchWishBook(search, keyword);
		int listCount = list.size(); //검색된 갯수 조회
		
		//총 페이지수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + (limit - 1); //+ 9
		if(endPage > maxPage)
			endPage = maxPage;
		
		ArrayList<WishBook> searchlist = new ArrayList<WishBook>();
		for(int i=startnum-1; i<endnum; i++) {
			if(i == listCount)
				break;
			searchlist.add(list.get(i));
		}
		
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher("views/boardwishbook/wishbookListView.jsp");
			request.setAttribute("list", searchlist);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서신청 검색 조회 실패! ");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
