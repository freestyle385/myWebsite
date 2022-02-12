package myWebsite.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

public class Util {

	public static boolean emptyChk(Object obj) {

		if (obj != null) {

			// obj가 String 타입일 때
			if (obj.getClass().getSimpleName().equals("String")) {
				// obj가 null 또는 공백이라면 true 반환
				return obj == null || ((String) obj).trim().equals("");
			}
			// obj가 null도 아니고 공백도 아닐 경우 false 반환
			return false;
		}
		
		return true;
	}

	// nullField의 Name을 ArrayList로 반환
	public static ArrayList<String> fieldChk(Object obj) {
		
		// obj의 모든 field의 정보를 가져옴
		Field[] boardField = obj.getClass().getDeclaredFields();
		ArrayList<String> nullField = new ArrayList<>();

		try {
			for (Field f : boardField) {
				// 각 field의 값에 접근 허용 
				f.setAccessible(true);
				// hashtag가 아닌 field가 비어있다면 nullField에 추가
				if (Util.emptyChk(f.get(obj)) && !f.getName().equals("hashtag")) {
					nullField.add(f.getName());
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		}

		return nullField;
	}
	
	public static String jsReplace(String msg, String uri) {

		if (msg == null) {
			msg = "";
		}

		String script = """
				<script>
					const msg = '%s'.trim();

					if(msg.length > 0){
						alert(msg);
					}

					location.replace('%s');
				</script>
				""";

		return String.format(script, msg, uri);
	}

	public static String jsHistoryBack(String msg) {

		if (msg == null) {
			msg = "";
		}

		String script = """
				<script>
					const msg = '%s'.trim();

					if(msg.length > 0){
						alert(msg);
					}

					history.back();
				</script>
				""";

		return String.format(script, msg);
	}
	
	// responseBody 태그에서 활용
	public static void javaHistoryBack(HttpServletResponse rs, String msg) throws IOException {

		rs.setContentType("text/html; charset=UTF-8");
		PrintWriter out = rs.getWriter();

		out.println(jsHistoryBack(msg));
		out.flush();
	}
	// responseBody 태그에서 활용
	public static void javaReplace(HttpServletResponse rs, String msg, String uri) throws IOException {

		rs.setContentType("text/html; charset=UTF-8");
		PrintWriter out = rs.getWriter();

		out.println(jsReplace(msg, uri));
		out.flush();

	}
}
