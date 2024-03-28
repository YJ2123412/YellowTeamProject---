package mybatis.vo;

import java.sql.Timestamp;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class ReserveList {
	private String member_code;
	private String mname;
	private String poster;
	private String schedule;
	private Date reserve_date;
	private String reserve_datef;
	private int rating;
	private String name;
	private int rcode;
	private String seat;
	
	private int mcode;
	private String id;
	private int amount;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd'T'HH:mm:ssXXX")
	private Timestamp paydate;
	private String paytype;
	private String paymentkey;

}

