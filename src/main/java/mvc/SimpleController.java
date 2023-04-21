package mvc;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{

	// [방법 3] - #1 START
	// 명령어 처리기 Handler
	// : 2. 요청을 분석하고
	// : 3. 요청을 처리하도록 시킨다
	
	Map<String, CommandHandler> handlerMap	= new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String	configFile	= config.getInitParameter("configFile");
		String	path		= config.getServletContext().getRealPath("/");
		
		Properties		prop	= new Properties();
		FileInputStream	fis		= null;

		try {
			path	= path + "/" + configFile;
			fis		= new FileInputStream(path);

			prop.load(fis);		// = 기준으로 왼쪽 키 오른쪽 값
			
			Iterator<Object> keys	= prop.keySet().iterator();
			
			// handler.properties에 등록된 command=handler을 읽어와서 handlerMap 구성
			while(keys.hasNext()) {
				String		key				= (String)keys.next();
				String		handlerName		= prop.getProperty(key);
				Class<?>	handlerClass	= Class.forName(handlerName);
				
				CommandHandler	handler	= (CommandHandler)handlerClass.getDeclaredConstructor().newInstance();
				handlerMap.put(key, handler);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e ) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
	}
	// [방법 3] - #1 END
	
	private static final long serialVersionUID = 1L;
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청을 받는다
		String	viewPage	= null;

		// [방법 4] - 요청 URI 자체를 명령어로 사용하는 방법 
/*
		String	command		= request.getParameter("command");	// [방법 3] 까지는 이걸로 사용
*/

		String	command	= request.getRequestURI();
		
		if(command.indexOf(request.getContextPath()) == 0) {
			command	= command.substring(request.getContextPath().length());
		}

		// http://localhost:8080/JSP/hello.do	<- URL
		// http://localhost:8080/JSP			<- Context Path
		// /hello.do							<- substring 한 후 command

		// [방법 4] - END

		
/*
		// [방법 1]
		// 2. 요청을 분석하고
		// 3. 요청을 처리한다
		//  : 지금은 Handler를 만들지 않지만, 나중에 Handler 만들어서 넘길 것임
		//  : 2번, 3번, 4번 역할을 Handler가 수행하게 된다
		// [단점]
		// : 분석과 처리를 한 곳에서하니 복잡하다
		// : 분석은 여기서하고 각 명령어를 처리하는 곳은 별도로 만들자 (Handler)

		Object	result		= null;

		if(command == null) {
			result		= "처리할 요청이 없습니다";
			viewPage	= "/016_mvc/null.jsp";
		} else if(command.equals("hello")) {	// http://localhost:8080/JSP/simple?command=hello
			result		= "안녕하세요";
			viewPage	= "/016_mvc/hello.jsp";
		} else if(command.equals("date")) {		// http://localhost:8080/JSP/simple?command=date
			result		= new Date();
			viewPage	= "/016_mvc/date.jsp";
		} else {
			result		= "처리할 수 없는 요청입니다";
			viewPage	= "/016_mvc/default.jsp";
		}
		
		// 4. 처리 결과를 저장한다
		request.setAttribute("result", result);
*/		

/*
		// [방법 2]
		// 명령어 처리기 Handler
		// : 2. 요청을 분석하고
		// : 3. 요청을 처리하도록 시킨다
		// [단점]
		// : 명령이 추가될 때마다 controller를 수정해야 한다
		// : 커맨트 패턴 (key-value : map) 파일을 별도로 만들어두고
		// : servlet life cycle 중 init()에서 불러와서 세팅하도록 수정하자
		CommandHandler	handler	= null;
		
		if(command == null) {
			handler	= new NullHandler();
		} else if(command.equals("hello")) {
			handler	= new HelloHandler();
		} else if(command.equals("date")) {
			handler	= new DateHandler();
		} else if(command.equals("hi")) {
			handler	= new HiHandler();
		} else if(command.equals("bye")) {
			handler	= new ByeHandler();
		} else {
			handler	= new DefaultHandler();
		}
*/		

		// [방법 3] - #2 START
		// 명령어 처리기 Handler - handler.properties 사용
		// : 2. 요청을 분석하고
		//  - properties에 등록된 command=handler에 따라 handler 선택
		// : 3. 요청을 처리하도록 시킨다
		CommandHandler	handler	= handlerMap.get(command);
		
		if(handler == null) {
			handler	= new DefaultHandler();
		}

		try {
			viewPage	= handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// [방법 3] - #2 END

		// 5. 적당한 뷰를 선택해서 포워딩한다
		RequestDispatcher	dispatcher	= request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

}
