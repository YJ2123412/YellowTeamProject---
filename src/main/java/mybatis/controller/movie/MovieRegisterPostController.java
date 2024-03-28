package mybatis.controller.movie;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.controller.Controller;
import mybatis.dao.MovieDao;
import mybatis.vo.Movie;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.transfer.s3.S3TransferManager;
import software.amazon.awssdk.transfer.s3.model.CompletedFileUpload;
import software.amazon.awssdk.transfer.s3.model.FileUpload;
import software.amazon.awssdk.transfer.s3.model.UploadFileRequest;
import software.amazon.awssdk.transfer.s3.progress.LoggingTransferListener;

public class MovieRegisterPostController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String path = "D:\\hyeonbeom\\upload";
		int maxSize = 8*1024*1024;

		MultipartRequest multiRequest = new MultipartRequest(
			request, 
			path,
			maxSize,
			"UTF-8",
			new DefaultFileRenamePolicy()
		);

		String mname = multiRequest.getParameter("mname");
		String genre = multiRequest.getParameter("genre");
		String director = multiRequest.getParameter("director");
		String release_date = multiRequest.getParameter("release_date");
		String producer = multiRequest.getParameter("producer");
		int rating = Integer.parseInt(multiRequest.getParameter("rating"));
		String running_time = multiRequest.getParameter("running_time");
		String synopsys = multiRequest.getParameter("synopsys");
		double mgrade = Double.parseDouble(multiRequest.getParameter("mgrade"));
		String country = multiRequest.getParameter("country");
		String mcast = multiRequest.getParameter("mcast");
		String poster = multiRequest.getFilesystemName("poster");
		File posterFile = multiRequest.getFile("poster");

		MovieDao dao = MovieDao.getInstance();
		int result = dao.insert(new Movie(
			0, mname, genre, director, release_date,
			producer, rating, running_time, synopsys, mgrade,
			country, mcast, poster.replace(".jpg", ""), 0, null, 0, null
		));

		if (result == 1) {
			String bucket = "yellows3";
			String key = "share/poster/" + poster;
			String accessKey = "AKIAW3MD76D233OOFXJW";
			String secretKey = "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";

			AwsCredentialsProvider creds = StaticCredentialsProvider.create(AwsBasicCredentials.create(accessKey, secretKey));
			S3AsyncClient s3AsyncClient = S3AsyncClient.crtBuilder()
	                .credentialsProvider(creds)
	                .region(Region.AP_NORTHEAST_2)
	                .targetThroughputInGbps(20.0)
	                .minimumPartSizeInBytes((long) (8*1024*1024))
	                .build();

	        S3TransferManager transferManager = S3TransferManager.builder()
	                .s3Client(s3AsyncClient)
	                .build();

	        UploadFileRequest uploadFileRequest = UploadFileRequest.builder()
	                                                               .putObjectRequest(
	                                                            	  req -> req.bucket(bucket)
	                                                            	  		.key(key)
	                                                            	  		.contentType("image/jpeg")
	                                                            	  		.contentEncoding("UTF-8")
	                                                            	)
	                                                               .addTransferListener(LoggingTransferListener.create())
	                                                               .source(posterFile)
	                                                               .build();

	        FileUpload upload = transferManager.uploadFile(uploadFileRequest);
	        CompletedFileUpload uploadResult = upload.completionFuture().join();
	        String rs = uploadResult.response().eTag();
	        if (!rs.isEmpty()) {
	        	response.sendRedirect("modify");
	        }
		} else {
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().print("<script>alert(\"등록 실패\")</script>");
		}
	}
}
