package mybatis.controller;

import java.util.HashMap;
import java.util.Map;
import mybatis.controller.api.ApiAdminDeleteController;
import mybatis.controller.api.ApiAdminJoinController;
import mybatis.controller.api.ApiCheckIdController;
import mybatis.controller.api.ApiGetAllMembersController;
import mybatis.controller.api.ApiGetAllMovieCommentsController;
import mybatis.controller.api.ApiGetAllMoviesController;
import mybatis.controller.api.ApiMemberJoinController;
import mybatis.controller.api.ApiMemberModifyController;
import mybatis.controller.api.ApiMovieModifyController;
import mybatis.controller.api.ApiMovieSearchController;
import mybatis.controller.api.ApiPaymentSaveController;
import mybatis.controller.member.AdminJoinController;
import mybatis.controller.member.AdminListController;
import mybatis.controller.member.AdminPageController;
import mybatis.controller.member.AdminSaveController;
import mybatis.controller.member.AuthCertSMSController;
import mybatis.controller.member.LoginActionController;
import mybatis.controller.member.LoginViewController;
import mybatis.controller.member.LogoutController;
import mybatis.controller.member.MemberDropController;
import mybatis.controller.member.MemberJoinController;
import mybatis.controller.member.MemberModifyController;
import mybatis.controller.member.MemberSaveController;
import mybatis.controller.member.MovieDeleteController;
import mybatis.controller.member.MyPageController;
import mybatis.controller.movie.MovieCommentsGetController;
import mybatis.controller.movie.MovieDetailController;
import mybatis.controller.movie.MovieListController;
import mybatis.controller.movie.MovieModifyController;
import mybatis.controller.movie.MovieRegisterController;
import mybatis.controller.movie.MovieRegisterPostController;
import mybatis.controller.movie.MovieReserveController;
import mybatis.controller.movie.MovieReserveGetController;
import mybatis.controller.movie.MovieSearchController;
import mybatis.controller.movie.MoviecompleteController;
import mybatis.controller.movie.ReadController;
import mybatis.controller.movie.PayRequestFailController;
import mybatis.controller.movie.PayRequestSuccessController;


public class RequestControllerMapping {
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();

	public static void init() {
		// API
		mapping.put(new RequestKeyValue("/api/auth/checkId", "POST"), new ApiCheckIdController());
		mapping.put(new RequestKeyValue("/api/member", "POST"), new ApiGetAllMembersController()); // 메소드 수정 필요
		mapping.put(new RequestKeyValue("/api/auth/join", "POST"), new ApiMemberJoinController());
		mapping.put(new RequestKeyValue("/api/modify","POST"),new ApiMemberModifyController());
		mapping.put(new RequestKeyValue("/api/auth/adminJoin", "POST"), new ApiAdminJoinController());
		mapping.put(new RequestKeyValue("/api/movie", "GET"), new ApiGetAllMoviesController());
		mapping.put(new RequestKeyValue("/api/movie", "PUT"), new ApiMovieSearchController());
		mapping.put(new RequestKeyValue("/api/movie/comments", "GET"), new ApiGetAllMovieCommentsController());
		mapping.put(new RequestKeyValue("/api/movie/modify", "PUT"), new ApiMovieModifyController());

		// 회원가입
		mapping.put(new RequestKeyValue("/join","GET"), new MemberJoinController());
		mapping.put(new RequestKeyValue("/join","POST"), new MemberSaveController());
		mapping.put(new RequestKeyValue("/auth/cert/sms","GET"), new AuthCertSMSController());

		// 관리자
		mapping.put(new RequestKeyValue("/admin/list","GET"), new AdminListController());
		mapping.put(new RequestKeyValue("/api/admin","DELETE"), new ApiAdminDeleteController());
		mapping.put(new RequestKeyValue("/admin/join","GET"),new AdminJoinController());
		mapping.put(new RequestKeyValue("/admin/save","POST"),new AdminSaveController());
		mapping.put(new RequestKeyValue("/admin/page","GET"),new AdminPageController());

		// 마이페이지
		mapping.put(new RequestKeyValue("/myPage","GET"), new MyPageController());
		mapping.put(new RequestKeyValue("/myPage","POST"), new MovieDeleteController());
		mapping.put(new RequestKeyValue("/member/modify","GET"),new MemberModifyController());
		mapping.put(new RequestKeyValue("/member/drop","GET"),new MemberDropController());

		// 로그인
		mapping.put(new RequestKeyValue("/login", "GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout", "GET"), new LogoutController());

		// 결제
		mapping.put(new RequestKeyValue("/api/pay", "POST"), new ApiPaymentSaveController() );
		mapping.put(new RequestKeyValue("/pay/success","GET"), new PayRequestSuccessController());
		mapping.put(new RequestKeyValue("/pay/fail","GET"), new PayRequestFailController());

		// Movie
		mapping.put(new RequestKeyValue("/movie/list", "GET"), new MovieListController() );
		mapping.put(new RequestKeyValue("/movie/list", "POST"), new MovieListController() );
		mapping.put(new RequestKeyValue("/movie/showMovieDetail", "GET"), new MovieDetailController());
		mapping.put(new RequestKeyValue("/movie/reserve", "GET"), new MovieReserveGetController() );
		mapping.put(new RequestKeyValue("/movie/reserve", "POST"), new MovieReserveController() );
		mapping.put(new RequestKeyValue("/movie/search", "GET"), new MovieSearchController());
		mapping.put(new RequestKeyValue("/movie/search", "PUT"), new MovieSearchController());
		mapping.put(new RequestKeyValue("/movie/read", "GET"), new ReadController());
		mapping.put(new RequestKeyValue("/movie/complete", "GET"), new MoviecompleteController());
		 
	    mapping.put(new RequestKeyValue("/movie/register", "GET"), new MovieRegisterController());
	    mapping.put(new RequestKeyValue("/movie/register", "POST"), new MovieRegisterPostController());
	    mapping.put(new RequestKeyValue("/movie/modify", "GET"), new MovieModifyController());
	    mapping.put(new RequestKeyValue("/movie/comments", "GET"), new MovieCommentsGetController());
	}

	// url,method 필드를 저장하는 key 를 전달받아 HashMap에서 value(컨트롤러)를 리턴
	public static Controller getController(RequestKeyValue key) {
		return mapping.get(key);
	}
}
