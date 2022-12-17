package axxa.lista.registros.portlet;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ContentTypes;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import axxa.customer.api.api.AxxaCustomerApi;
import axxa.lista.registros.constants.AxxaListaRegistrosPortletKeys;

/**
 * @author johnbarbosa
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=AxxaListaRegistros",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/html/view.jsp",
		"javax.portlet.name=" + AxxaListaRegistrosPortletKeys.AXXALISTAREGISTROS,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class AxxaListaRegistrosPortlet extends MVCPortlet {
	
	@Reference
	AxxaCustomerApi axxaCustomerApi;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		String responseGet = axxaCustomerApi.callRestServiceByGet(AxxaListaRegistrosPortletKeys.URL_WS);
				
		renderRequest.setAttribute("listCustomer", responseGet);
		
		super.doView(renderRequest, renderResponse);
	}
	
	
	
	@Override
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws IOException, PortletException {
		// TODO Auto-generated method stub
		

		ThemeDisplay td = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);


		String name = ParamUtil.getString(resourceRequest, AxxaListaRegistrosPortletKeys.FORM_NAME);
		String age = ParamUtil.getString(resourceRequest, AxxaListaRegistrosPortletKeys.FORM_AGE);
		String phoneNumber = ParamUtil.getString(resourceRequest, AxxaListaRegistrosPortletKeys.FORM_PHONENUMBER);
		String address = ParamUtil.getString(resourceRequest, AxxaListaRegistrosPortletKeys.FORM_ADDRESS);
		
		Map<String, String> parameters = new HashMap<>();
		
		parameters.put("name", name);
		parameters.put("age", age);
		parameters.put("phoneNumber", phoneNumber);
		parameters.put("address", address);

		System.out.println("Agrego");
		String responsePost = axxaCustomerApi.callRestServiceByPost(AxxaListaRegistrosPortletKeys.URL_WS, parameters);


		System.out.println("Agrego:::::::: " + responsePost);
		resourceResponse.setCharacterEncoding(AxxaListaRegistrosPortletKeys.UTF_8);
		resourceResponse.setContentType(ContentTypes.APPLICATION_JSON);
		resourceResponse.resetBuffer();
		resourceResponse.getWriter().print(responsePost);
		resourceResponse.flushBuffer();
		super.serveResource(resourceRequest, resourceResponse);
	}
	
	
	
	
		
}