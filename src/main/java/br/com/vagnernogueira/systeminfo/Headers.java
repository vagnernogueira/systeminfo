package br.com.vagnernogueira.systeminfo;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/headers")
public class Headers extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Headers()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("ContextPath: ").append(request.getContextPath() + "\n\n");
		response.getWriter().append("getRemoteHost: ").append(request.getRemoteHost() + "\n");
		response.getWriter().append("getRemoteAddr: ").append(request.getRemoteAddr() + "\n\n\nHTTP Headers:");
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements())
		{
			String key = headerNames.nextElement();
			String value = request.getHeader(key);
			response.getWriter().append(key + ": ").append(value + "\n");
		}
	}
}
