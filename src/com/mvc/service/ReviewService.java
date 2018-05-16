package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.NoticeDAO;
import com.mvc.dao.ReviewDAO;
import com.mvc.dto.ReviewDTO;

public class ReviewService {

	//리스트 호출 하기
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB 이용 해서 데이터 가져오기
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.list();
		//가져온 데이터를 request 에 담기
		request.setAttribute("list", list);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("reviewList.jsp");
		dis.forward(request, response);
	}

	//상세 보기
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB 에 개별 데이터 요청
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.detail(request.getParameter("review_id"));
		request.setAttribute("info", dto);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("reviewDetail.jsp");
		dis.forward(request, response);
	}

	//글쓰기 페이지
	public void write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 1. 파라메터 추출
		String user_Id = request.getParameter("user_Id");
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		System.out.println(user_Id+"/"+review_title+"/"+review_content);
		
		// 2. DAO 요청
		ReviewDAO dao = new ReviewDAO();
		
		// 3. 결과값 JSON 변환
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		int review_id = dao.write(user_Id,review_title,review_content);
		//세션에서 review_id를  string 으로 불러 내기 때문에 넣을 때 문자 열로 형변환 해야 한다. 
		request.getSession().setAttribute("review_id",Integer.toString(review_id));
		map.put("success", review_id);
		
		String obj = json.toJson(map);
		System.out.println(obj);
		// 4. response 로 변환
		response.getWriter().println(obj);
	}

	//글 삭제
	public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//파라메터 추출
		String review_id = request.getParameter("review_id");
		ReviewDAO dao = new ReviewDAO();
		//글 번호로 파일명 추출(DB)
		String fileName = dao.fileNameCall(Integer.parseInt(review_id));
		//글 삭제(DB)
		if(dao.del(review_id)>0) {
			//파일 삭제(파일이 있을 경우만)
			if(fileName != null) {
				ReviewUpload review = new ReviewUpload(request);
				review.del(fileName);
			}
		}		
		//페이지 이동(리스트)
		response.sendRedirect("reviewList.jsp");
	}

	//수정 보기
	public void updateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_id = request.getParameter("review_id");
		//상세정보 가져오기(DB)
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.detail(review_id);
		//수정 보기 페이지에 뿌려 준다.
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("reviewUpdateForm.jsp");
		dis.forward(request, response);
	}

	//수정 하기
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//PhotoUpload 의 regist() 실행
		ReviewUpload upload = new ReviewUpload(request);
		ReviewDTO dto = upload.regist();
		//올린 파일이 있는가? 기존 파일 명은?
		ReviewDAO dao = new ReviewDAO();
		String oldFileName = null;		
		dao.update(dto);//DB 이용 해서 글 수정
		System.out.println("newFileName : "+dto.getNewFileName());
		if(dto.getNewFileName() != null) {//새로 올리는 파일이 있을 경우
			//올린파일이 있다는 것은 기존 파일을 지워야 하는 것을 의미하므로 파일명을 알아야 한다.
			oldFileName = dao.fileNameCall(dto.getReview_id());		
			dao = new ReviewDAO();//update() 에서 자원을 닫았으므로 다시 객체화			

			//파일명을 DB 에서 수정
			dao.fileNameUpdate(dto.getReview_id(),dto.getNewFileName(),oldFileName);
			//기존 파일을 폴더에서 삭제	
			upload.del(oldFileName);			
		}
		response.sendRedirect("reviewDetail?review_id="+dto.getReview_id());
	}

	public void updateView(HttpServletRequest request, HttpServletResponse response) {
		
	}

	public void detailView(HttpServletRequest request, HttpServletResponse response) {
		
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	
	

}
