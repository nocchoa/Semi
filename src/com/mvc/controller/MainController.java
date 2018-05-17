package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.AdminService;
import com.mvc.service.MemberService;
import com.mvc.service.NoticeService;
import com.mvc.service.PhotoService;
import com.mvc.service.ProductService;
import com.mvc.service.ProductService2;
import com.mvc.service.ReviewService;
import com.mvc.service.UploadService;
import com.mvc.service.UserService;

@WebServlet({ "/login", "/logout", "/join", "/sell_prdList", "/sell_prdDelete",
	"/prd_search", "/prd_list", "/prd_detail", "/prd_update", "/prd_updateView", "/prd_write", "/prd_delete", "/prd_sellerdetail", "/prd2_buy", "/prd2_list", "/prd2_user",
	"/review_list","/review_detail","/review_update","/review_updateView","/review_write",
	"/findId", "/findPw","/payList","/restock","/overlay",
	"/admin_loginCheck","/admin_main" , "/admin_login" , "/admin_logout" , "/review_view", "/user_view", "/seller_view",
	"/notice_main", "/notice_write", "/notice_delete", "/notice_detail","/notice_update" , "/notice_detailView","/admin_useDel","/u_update","/u_pwCheck", "/u_detailView",
	"/u_list","/detailView", "/sell_overlay", "/sell_join", "/sell_login", "/sell_logout", "/seller_accept_list","/seller_list",
    "/sell_delete", "/write", "/update", "/upload", "/searchID", "/searchPW", "/pwCheck", "/request", "/sell_request",
    "/acptok", "/acptno", "/send_no"})
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		dual(request,response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		dual(request,response);
	}

	private void dual(HttpServletRequest request, 
			HttpServletResponse response) throws IOException, ServletException {
				//subAddr 추출
				//subAddr 에 따른  처리
				String uri = request.getRequestURI();
				String ctx = request.getContextPath();
				String subAddr = uri.substring(ctx.length());
				
				//Service 생성
				UserService user = null;
				ProductService product = null;
				ReviewService review = null;
				AdminService admin = null;
				NoticeService notice = null;
				PhotoService photo = null;
				ProductService2 product2 = null;
				PhotoService service = null;
				MemberService member =null;
				UploadService file_service = null;
				// "/login", "/logout", "/join", 
				// "/list","/detail", "/update", "/updateView", 
				// "/write", "/delete", "/findId", "/findPw","/payList","/restock"
				
			   // ㅡㅡㅡㅡ관리자 
				// "/admin_login" , /"admin_logout" , 
				// "/review_view"(리뷰 리스트), "/user_view"(회원리스트), "/seller_view"(판매자 리스트),
				// ㅡㅡㅡㅡ공지사항 
				// "/notice_list"(공지사항리스트), "/notice_write"(공지사항 작성), "/notice_delete", "/notice_detail"
				// "/notice_update" , "/notice_updateView"
			 
				switch(subAddr) {
				
					// 로그인
					case "/login":
					System.out.println("구매자 로그인 요청");
					user = new UserService();
					user.login(request, response);
					break;
					
					// 로그아웃
					case "/logout":
					user = new UserService();
					user.logout(request,response);
					System.out.println("구매자 로그아웃 요청");
					break;
					
					// 회원가입
					case "/join":
						System.out.println("구매자 회원가입 요청");
						user = new UserService();
						user.join(request, response);
						break;
					
					// 판매자별 상품 리스트	
					case "/sell_prdList":
						System.out.println("판매자별 상품 리스트 요청");
						product = new ProductService();
						product.sellprdlist(request, response);
						break;
					
					// 상품 삭제	
					case "/sell_prdDelete":
						System.out.println("판매자별 상품 리스트 요청");
						product = new ProductService();
						product.prdDel(request, response);
						break;
						
					// 상품 리스트	
					case "/prd_list":
						System.out.println("상품 리스트 호출 요청");
						service = new PhotoService(request, response);
						service.list();
						break;
						
					// 상품 검색	
					case "/prd_search":
						System.out.println("상품 리스트 호출 요청");
						product = new ProductService();
						product.prdSearch(request, response);
						break;
					
					// 상품 상세보기
					case "/prd_detail":
						System.out.println("상품 상세보기 요청");
						product = new ProductService();
						product.detail(request, response);
						break;
						
					// 판매자 상품 상세보기
					case "/prd_sellerdetail":
						System.out.println("판매자 상품 상세보기 요청");
						product = new ProductService();
						product.sellerdetail(request, response);
						break;
						
					// 상품 수정 
					case "/prd_update":
						System.out.println("상품 수정 요청");
						product = new ProductService();
						product.update(request, response);
						break;
						
					// 상품 수정 상세
					case "/prd_updateView":
						System.out.println("상품 수정 상세 요청");
						product = new ProductService();
						product.updateView(request,response);
						break;
						
					// 상품 등록
					case "/prd_write":
						System.out.println("상품 등록 요청");
						product = new ProductService();
						product.write(request, response);
						break;
					
					// 상품 삭제
					case "/prd_delete":
						System.out.println("상품 삭제 요청");
						product = new  ProductService();
						product.delete(request, response);
						break;
						
					// 상품 구매
					case "/prd2_buy":
						System.out.println("상품 구매 요청");
						product2 = new ProductService2();
						product2.buy(request, response);
						break;
						
					// 상품 구매 사진
					case "/prd2_list":
						System.out.println("구매 리스트 호출");
						product2 = new ProductService2();
						product2.list(request, response);
						break;
					
					// 상품 구매자 정보
					case "/prd2_user":
						System.out.println("구매자 정보 호출");
						user = new UserService();
						user.buyuser(request, response);
						break;
					
					// 후기 리스트
					case "/review_list":
						System.out.println("후기 리스트 호출 요청");
						review = new ReviewService();
						review.list(request, response);
						break;
					
					// 후기 상세보기
					case "/review_detail":
						System.out.println("후기 상세보기 화면 요청");
						//받아온 파라메터를 세션에 저장
						request.getSession().setAttribute("review_id", request.getParameter("review_id"));
						//html 간 이동시 값을 공유 할 수 없어 세션에 저장 한다.
						response.sendRedirect("reviewDetail.jsp");
						break;	
						
					// 후기 수정
					case "/review_update":
						System.out.println("후기 수정 요청");
						review = new ReviewService();
						review.update(request, response);
						break;
						
					// 후기 수정 상세
					case "/review_updateView":
						System.out.println("후기 수정 상세 요청");
						review = new ReviewService();
						review.updateView(request,response);
						break;
					
					// 후기 등록
					case "/review_write":
						System.out.println("후기 등록 요청");
						review = new ReviewService();
						review.write(request, response);
						break;
						
					// 후기 삭제
					case "/review_delete":
						System.out.println("후기 삭제 요청");
						review = new ReviewService();
						review.delete(request, response);
						break;
						
					// 후기 상세보기
					case "review_detailView":
						System.out.println("후기 상세보기 요청");
						review = new ReviewService();
						review.detailView(request, response);
						break;
						
					// Id 찾기
					case "/findId":
						System.out.println("ID찾기 요청");
						user = new UserService();
						user.findId(request,response);
						break;
						
					// Pw찾기
					case "/findPw":
						System.out.println("PW찾기 요청");
						user = new UserService();
						user.findPw(request,response);
						break;
				
					// 중복 확인
					case "/overlay":
						System.out.println("회원가입 아이디 중복 체크");
						user = new UserService();
						user.overlay(request, response);
						break;
						
						
					// ㅡㅡㅡㅡㅡ관리자 	
						
					case "/admin_loginCheck":
						System.out.println("관리자 로그인");
						admin = new AdminService();
						admin.loginCheck(request, response);
						break;
	
					case "/admin_login":
						System.out.println("관리자 로그인");
						admin = new AdminService();
						admin.login(request, response);
						break;
						
					case "/admin_logout":
						System.out.println("관리자 로그아웃");
						admin = new AdminService();
						admin.logout(request, response);
						break;
						
					case "/admin_main":
						System.out.println("관리자 메인 페이지");
						admin = new AdminService();
						admin.main(request, response);
						break;
						
					case "/admin_useDel":
						System.out.println("관리자페이지 : 회원삭제");
						admin = new AdminService();
						admin.delete(request, response);
						break;
						
					case "/review_view":
						System.out.println("리뷰 확인");
						
						break;
						
					case "/user_view":
						System.out.println("회원 확인");
				
						break;
						
					case "/seller_view":
						System.out.println("판매자 확인");
					
						break;
						
					case "/notice_main":
						System.out.println("공지사항 메뉴화면");
						notice = new NoticeService();
						notice.main(request,response);
						break;
	
					case "/notice_write":
						System.out.println("공지사항 작성");
						notice = new NoticeService();
						notice.write(request,response);
						break;
						
					case "/notice_delete":
						System.out.println("공지사항 삭제");
						notice = new NoticeService();
						notice.del(request,response);
						break;
						
					case "/notice_detail":
						System.out.println("공지사항 상세보기");
						notice = new NoticeService();
						notice.detail(request,response);
						break;
						
					case "/notice_detailView":
						System.out.println("공지사항 상세보기 화면");
						notice = new NoticeService();
						notice.detailView(request,response);
						break;
						
						
					case "/notice_update":
						System.out.println("공지사항 수정하기");
						notice = new NoticeService();
						notice.update(request,response);
						break;
						
					case "/u_detailView":
						System.out.println("유저상세보기");
						user = new UserService();
						user.detailView(request, response);
						break;

					case "/u_update":
						System.out.println("유저수정 요청");
						user = new UserService();
						user.update(request, response);
						break;

					case "/u_pwCheck":
						System.out.println("유저수정 본인확인 요청");
						user = new UserService();
						user.upPwCheck(request, response);
						break;
						
					case "/u_list":
						System.out.println("유저 구매내역  요청");
						product = new ProductService();
						product.ulist(request, response);
						break;
					case "/sell_overlay":
				         System.out.println("중복 체크");
				         member = new MemberService();
				         member.overlay(request, response);
				         // upload 메서드를 실행 하면 사진의 경로를 반환
				         // service.upload(request, response);// request : text+file;
				         break;

				      case "/sell_join":
				         System.out.println("회원가입 요청");
				         member = new MemberService();
				         member.join(request, response);
				         break;

				      case "/sell_login":
				         System.out.println("로그인 요청");
				         member = new MemberService();
				         member.login(request, response);
				         break;

				      case "/sell_logout":
				         System.out.println("로그아웃");
				         /* 알아서 처리 할 것 */
				         break;

				      case "/seller_accept_list":
				         System.out.println("리스트 호출 요청");
				         member = new MemberService();
				         member.list(request, response);
				         break;
				         
				      case "/detailView":
				         member = new MemberService();
				         member.detailView(request, response);
				         break;

				      case "/sell_delete":
				         System.out.println("삭제 요청");
				         member = new MemberService();
				         member.sell_delete(request, response);
				         break;

				      case "/update":
				         System.out.println("수정 요청");
				         member = new MemberService();
				         member.update(request, response);
				         break;


				      case "/upload":
				         System.out.println("파일 업로드 요청"); // 받아서 서비스에 전달 UploadService
				         file_service = new UploadService(); // upload 메서드를 실행 하면 사진의 경로를 반환
				         file_service.upload(request, response);// request : text+file;
				         break;

				      case "/searchID":
				         System.out.println("아이디 찾기 요청");
				         member = new MemberService();
				         member.searchID(request, response);
				         break;
				      case "/searchPW":
				         System.out.println("비밀번호 찾기 요청");
				         member = new MemberService();
				         member.searchPW(request, response);
				         break;

				      case "/pwCheck":
				         System.out.println("수정 본인확인 요청");
				         member = new MemberService();
				         member.upPwCheck(request, response);
				         break;

				      case "/request":
				         System.out.println("판매자 등록 요청준비");
				         member = new MemberService();
				         member.request(request, response);
				         break;

				      case "/sell_request":
				         System.out.println("판매자 등록 요청시작");
				         member = new MemberService();
				         member.sell_request(request, response);
				         break;

				      case "/acptok":
				         System.out.println("판매자 등록요청 수락");
				         System.out.println(request.getParameter("sell_id"));
				         request.getSession().setAttribute("seller_id", request.getParameter("sell_id"));
				         member = new MemberService();
				         member.acptok(request, response);
				         break;

				      case "/acptno":
				         System.out.println("판매자 등록요청 거절");
				         request.getSession().setAttribute("seller_id", request.getParameter("sell_id"));
				         request.getSession().setAttribute("seller_email", request.getParameter("sell_email"));
				         request.getSession().setAttribute("no_msg", request.getParameter("no_msg"));
				         member = new MemberService();
				         member.acptno(request, response);
				         break;
						


				}
		
	}

}
