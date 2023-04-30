package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import handler.DefaultHandler;

public class Controller extends HttpServlet{

	private static final long serialVersionUID = -1611850246097453697L;
	
	private HashMap<String, CommandHandler> handlerMap	= new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String	configFile	= config.getInitParameter("configFile");
		String	path		= config.getServletContext().getRealPath("/");
		
		path = path + configFile;
		
		FileInputStream	fis		= null;
		Properties		prop	= new Properties();
		
		try {
			fis	= new FileInputStream(path);
			
			prop.load(fis);
			
			Iterator<Object> keys	= prop.keySet().iterator();
			
			while(keys.hasNext()) {
				String		key				= (String)keys.next();
				String		handlerName		= prop.getProperty(key);
				Class<?>	handlerClass	= Class.forName(handlerName);
				CommandHandler	handler		= (CommandHandler) handlerClass.getDeclaredConstructor().newInstance();
				
				handlerMap.put(key, handler);
			}
			
		} catch (IOException | ClassNotFoundException | InstantiationException |
				 IllegalAccessException | IllegalArgumentException |
				 InvocationTargetException | NoSuchMethodException |
				 SecurityException e) {
			e.printStackTrace();
		}
	}

public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String	command	= request.getRequestURI();
		
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		
		CommandHandler	handler	= handlerMap.get(command);
		
		if(handler == null) {
			handler = new DefaultHandler();
		}
		
		String viewPage	= null;
		
		try {
			viewPage	= handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher	dispatcher	= request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
