
public class test {
	public static void main(String[] args) {
		
	String mname = "";
    String temp = "띄 어쓰기 들어간";
    if (temp != null && !temp.isEmpty()) {
    	for(int j=0; j<temp.length();j++) {
        char charAtIndex = temp.charAt(j); // 리스트의 인덱스를 이름의 길이로 나눈 나머지를 사용하여 mname의 각 문자에 접근
        if (charAtIndex != ' ') {
            mname += charAtIndex;
        }}
    }
    System.out.println(mname);
}

}
