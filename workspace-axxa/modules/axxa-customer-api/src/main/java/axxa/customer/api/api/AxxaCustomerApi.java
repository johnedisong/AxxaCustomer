package axxa.customer.api.api;

import java.util.Map;

/**
 * @author johnbarbosa
 */
public interface AxxaCustomerApi {
	
	/**
	 * Funcion que permite realizar el llamado al metodo HTTP tipo GET.
	 * 
	 * @author johnbarbosa
	 * @param url        - Url de la peticion
	 */
	String callRestServiceByGet(String url);
	
	/**
	 * Funcion que permite realizar el llamado al metodo HTTP tipo POST
	 * 
	 * @author johnbarbosa
	 * @param url         - Url de la peticion.
	 * @param parameters  - Parametros asocaidos a la peticion
	 * @param contentType
	 * @return String - Con la respuesta de la invocacion
	 */
	String callRestServiceByPost(String url,Map<String, String> parameters);
	
}