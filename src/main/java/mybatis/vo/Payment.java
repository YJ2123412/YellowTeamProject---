package mybatis.vo;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
	private String orderid;
	private String id;
	private int amount;
	private Date paydate;
	private String paytype;
	private String paymentkey;

}

enum PayType {
	Kakao, Toss
}